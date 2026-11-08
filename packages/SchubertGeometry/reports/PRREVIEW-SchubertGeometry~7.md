# Review of SchubertGeometry (pull request #1224 at 0936394)

**Verdict:** needs changes

Full review of the folder at 0936394 (478 changed lines since a4a7f5c). One blocking finding and three P3. This verdict asks for repairs before the next review. It is not an approval and not a merge.

## R01 (P2): The README consumes about 130 Tau Ceti declarations that are absent at the folder's pin, so the S4 headlines cannot be stated

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:3`, “The finite-type Lakshmibai–Seshadri path engine is consumed from the pinned Tau Ceti, whose `TauCeti/RepresentationTheory/LSPath/` and `TauCeti/RepresentationTheory/Crystal/` files already prove…”. The From Tau Ceti contract (lines 106–331) and the *Needs:* lines of S2.3, S2.4, S3.3, S3.4, S3.6, S4.1–S4.5 and S9.5 also cite these files. `TauCetiRoadmap/SchubertGeometry/Suggested.lean:13–21`: “the Tau Ceti revision pinned by this folder's manifest has none of these files”.

**Claim:** The README treats the natives as present at the pin. Suggested.lean says the same natives are absent there. Both cannot be true at the pin this folder builds against.

**Witness:** `lake-manifest.json` pins Tau Ceti `a91d3aafa` (2026-10-05). The branch's merge base `fee8e0ea` predates main's pin bump `a891cd19` (2026-11-05, Tau Ceti `2fd255d9`). I swept all 170 backticked library names (table below). 33 exist at both pins and 7 are Mathlib. The remaining 130 exist only at `2fd255d9`, including every `RootPairing.demazureOperator*`, `TauCeti.LSPath.*`, `TauCeti.PLPath.*`, `TauCeti.NormalCrystal.*`, bond and chain declaration, `TauCeti.weylCoxeterSystem` and `ChainProperty.lean`.

**What is right:** At `2fd255d9` every one of the 130 resolves with the namespace and hypotheses the README states (checked file by file; see Verified sound). The README is correct for main's pin. The defect is the branch, which still builds against the old pin. This is the previous review's R02, not repaired. Its R03 is repaired in the README but not in Suggested.lean (below). No repair report marks either as not actionable.

**Repair:**
1. Merge main into the branch, so that `lake-manifest.json` pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b`. Keep the README's names as written.
2. Restate `Suggested.lean`. At that pin the S4 headlines are statable on native carriers alone, so they must be stated, each with `sorry`, with no new definitions. Use the hypothesis pattern of `TauCeti.LSPath.forall_raise_eq_none_iff` (`LSPath/Highest.lean:73`): `[P.flip.IsReduced]`, `hlam : lam ∈ dominantChamber P b`, `f : M →+ V`, and `F` with `F i (f m) = P.coroot' i m`. The three statements:
   - **Operator stability (S4.2; Littelmann1995 Proposition 4.7 and Corollary 2, pp. 511–512).** If `PLPath.lower (F i) (f (P.root i)) (π.toPLPath 𝕜 f) = some q`, then `∃ π' : LSPath P b lam, π'.toPLPath 𝕜 f = q`. State the same for `raise`.
   - **Generation from the straight encoding (S4.3; Littelmann1995 Corollary 3, p. 512).** Every `π` is reached from `LSPath.straight lam` by a finite list of simple lowerings.
   - **Character formula (S4.4 with S3.4).** There is `wt : LSPath P b lam → M` with `f (wt π) = (π.toPLPath 𝕜 f).endpoint` and `weylDenominator P b * ∑ᶠ π, single (wt π) 1 = dotAlternatization P b (single lam 1)`. Use this form, not the e^{wρ} form; see R03.
3. Delete the “stated once the manifest pins a revision…” sentence from the docstring. Keep the unstatable list for S1–S3, S5–S9, which is correct at both pins.

**Retest:** `grep -rn "def demazureOperator" .lake/packages/TauCeti/TauCeti` in the worktree must hit `Weyl/Demazure/Basic.lean:81`. `lake env lean` on the new `Suggested.lean` must report only `sorry` warnings.

## R02 (P3): Three sampled targets have a wrong or missing locator

**Location and witness, one per target:**
- **S4.7, line 1018:** “the initial-direction condition of LLM §3, p. 309”. LLM's §3 begins at line 786 (page 19, printed p. 311, by the offset the README itself uses for Theorems 4 and 6). Printed p. 309 (lines 663–709) is §2.4, Proposition 12, on crystal components of k_μ⊗V_ν(y). The basis of V_λ(w) by LS chains with first direction ≤ w is Proposition 14, LLM line 809, printed p. 312.
- **S1.1, line 414:** “prove that the source's coordinate model and forgetful/refinement maps identify with those same maps”. S1.1 names no source.
- **S3.5, line 795:** “the closed-immersion argument through the scheme stabilizer in every characteristic is the target here”. This is the previous review's R04, partly repaired. The complex type-A locators were added, but the arbitrary-characteristic statement has no locator. Ramanathan1987 line 490 (Remark 2.4, printed p. 73) says that when the diagonal of X×X is compatibly split, every ample line bundle on X is very ample. Line 803 (Theorem 3.5(ii), p. 82) supplies that splitting for G/Q.

**Repair:**
- **S4.7:** Replace the locator with “LLM §3.1, Proposition 14, p. 312 (LLM line 809), recalling Littelmann's Demazure basis; realized as sections in §4.1, p. 315 (line 946)”.
- **S1.1:** Name the model: “the partial flag variety as a subvariety of the product of Grassmannians, BrionFlags §1.2, p. 7 (lines 256–258), with the incidence equation of Example 1.2.3(5), pp. 9–10 (lines 345–354)”.
- **S3.5:** State the target: for λ with ⟨λ,α∨⟩>0 exactly on the simple roots off P−, the complete linear system of L(λ) is a closed immersion of G/P− over every field. Cite “Ramanathan1987 Remark 2.4, p. 73, with Theorem 3.5(ii), p. 82, in characteristic p”.

**Retest:** Open the three source lines named in the repair and check that each states the claim.

## R03 (P3): S4.4 states Weyl's formula with e^{wρ}, which is not an element of ℤ[X] for adjoint root data

**Location:** `README.md:955`, “satisfies Weyl's formula Σ_(w∈W) sgn(w)e^(wρ)·char B(λ)=Σ_(w∈W) sgn(w)e^(w(λ+ρ)) (Littelmann1995, Theorem 9.1, p. 520)”.

**Claim:** This identity is stated for the general finite root datum, central lattice and isogeny type kept (Conventions, line 54).

**Witness:** Littelmann1995 line 811 fixes ρ in the weight lattice with ⟨ρ,α∨⟩=1 for every simple root. For PGL₂, X=ℤα and ⟨kα,α∨⟩=2k≠1, so no such ρ exists and e^{ρ}=e^{α/2} is not in ℤ[X]. The S8.4 Check uses this same datum.

**Repair:** State the S4.4 character theorem in ℤ[X] as Δ·char B(λ)=J(e^λ). Here Δ is `RootPairing.weylDenominator` and J is the dot alternatization Σ sgn(w)e^{−(ρ−wρ)}w(·), whose exponents lie in X. Equivalently, char B(λ)=D_{w₀}(e^λ). Say that Littelmann's e^{wρ} form holds after adjoining ρ (in ℤ[X+ℤρ]). Add the PGL₂ Check: for λ=α, char B(α)=e^α+1+e^{−α} and Δ=1−e^{−α}. Then Δ·char = e^α−e^{−2α} = J(e^α), all in ℤ[ℤα]; I computed both sides.

## R04 (P3): Three suppliers have no contract entry, one link is broken, and Downstream consumers omits three consumers on main

**Location and witness, in three parts:**
- **(a) Missing contracts.** S9.6's *Needs:* (line 1528) consumes AlgebraicTopology Stage 5, item 3. S9.7's *Needs:* (line 1550) consumes HamiltonianReduction R2a and MorseTheory M2. None of these appears under `## Exact supplier contracts` (lines 333–341), and the roadmap suppliers sit under one heading instead of one `### From TauCetiRoadmap.<X>` subsection each.
- **(b) Broken link.** Line 1532 links `../HamiltonianReduction/README.md`. On main the roadmap is at `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` (R2a at line 157). No `TauCetiRoadmap/HamiltonianReduction/` exists.
- **(c) Missing consumers.** `## Downstream consumers` (lines 1710–1716) lists only TensorProductCombinatorics and GeometricQuantization. On main, KacMoody consumes S4 and S7 (`KacMoody/README.md:72–78, 172–176`), CharacteristicClasses consumes S9.6 (`CharacteristicClasses/README.md:1668, 1722`), and FlagVarieties consumes S1–S2.3 and S1's B− convention (`FlagVarieties/README.md:37, 51, 272, 280`). KacMoody's contract says “SchubertGeometry S4 owns … the interval gcd, typed central translation, convexity”. Lines 18–24 of this head assign exactly these to the Tau Ceti natives.

**Repair:**
- **(a)** Split the roadmap contracts into `### From TauCetiRoadmap.<X>` subsections. Add AlgebraicTopology (Stage 5, item 3: finite-cover transfer), MorseTheory (M2: compact-band handle attachments) and HamiltonianReduction (R2a: compact orbit heights and root-plane Hessians), each with what is assumed.
- **(b)** Point the link at `../SymplecticGeometry/HamiltonianReduction/README.md`.
- **(c)** List KacMoody (S4, S7), CharacteristicClasses (S9.6) and FlagVarieties (S1–S2.3) under Downstream consumers. Add one sentence saying that S4's bond, interval-gcd, central-transport and convexity statements are the Tau Ceti declarations named in the From Tau Ceti contract, which KacMoody's S4 citation reaches through S4.

## Previous findings

| Previous finding | Status at 0936394 | Evidence |
|---|---|---|
| r6 R01 (P2), IndexTheory upward | repaired | Lines 42–48 leave the Lefschetz lane to “a SchubertGeometry Part II placed after IndexTheory … nothing is imported from IndexTheory”. `IndexTheory` occurs only there, and depcheck reports 0 problems. |
| r6 R02 (P2), Tau Ceti names absent at the branch pin | not repaired | The branch still pins `a91d3aafa`; the absent names grew from 7 to 130. Now R01. |
| r6 R03 (P2), README re-plans natives; S4 headlines | README part repaired; Lean part not | S3.3 line 731 says “the operator is not defined again”. S4.3 line 936 says “None of this is constructed again here”. `TauCeti.bondGcd_eq_intervalBondGcd` is cited (line 317). The bond-2 Check cites `TauCeti.isAChain_iff_den_dvd_bondGcd` (line 946). The S4 statements in Suggested.lean wait on the pin (R01). |
| r6 R04 (P3), S3.5 and S7.2 locators | S7.2 repaired; S3.5 partly | Line 1242 cites BrionFlags 1.4.5 (lines 667–685) and 1.3.5 (lines 501–509, 683), both read and correct. S3.5's arbitrary-characteristic claim is now R02. |
| r5 R01 (P3), no source manifest | repaired | `packages/SchubertGeometry/sources.toml` has 17 records. Steinberg1975, Pittie1972 and Jantzen are uncertified. |

## Verified sound

**Scope and gate.** The diff against origin/main outside the folder is empty. The worker's gate at 0936394 is zero on every check, including build, stray-files, readme-ids and depcheck. My depcheck run with the brief's command (`--movable`) printed:

    depcheck: 243 roadmaps, 2457 edges, 0 problem(s)

`lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`, run from the worktree, exits 0 with no output. The file has a single `import Mathlib`, one module docstring and an empty namespace. It has no declaration, no `set_option`, no sorry'd data and nothing to probe with one tactic. Signatures.md correctly lists no `#check` comparisons. At the branch pin the docstring's list of unstatable headlines is right: grepping `a91d3aafa` finds no flag, Bott–Samelson, Frobenius-splitting, LS-path, crystal, Demazure, analytic-space or scheme-K₀ carrier. The only “Frobenius split” hit is a docstring in `NumberField/Quadratic/Frobenius.lean`. The README has no process words, PR numbers or LaTeX.

**Headline theorems.** Ten families:
- S1: relative Par_t(G) and the flag incidence schemes.
- S2/S5.7: the all-word image X(δ(Q)) and the isomorphism O ≃ Rπ_*O.
- S3.4: Demazure's character formula, and the Weyl character formula for ∇(λ) in every characteristic.
- S4: operator stability, generation, the character formula and the tensor rule.
- S5: compatible splitting, normality, and vanishing with restriction surjectivity.
- S6: all-degree standard monomial bases.
- S7: the Chevalley divisor formula and the Chow comparison.
- S8: K₀(G/B−) ≅ R(T)⊗_{R(G)}ℤ, and its equivariant form.
- S9.0: proper GAGA with nilpotents.
- S9.7: the moment–Morse comparison.

None is statable at `a91d3aafa`. The S4 theorems become statable at `2fd255d9` (R01). The rest stay unstatable there too, because Tau Ceti `2fd255d9` has no flag or analytic-space carrier.

**Library declarations opened.** Mathlib, branch pin `6b7abb3c`:
- `Matrix.J := fromBlocks 0 (-1) 1 0` (`LinearAlgebra/SymplecticGroup.lean:58`) and `SymplecticGroup.mem_iff'` (`:185`, `Aᵀ * J * A = J`).
- `Module.Grassmannian` (`RingTheory/Grassmannian.lean:66`): a submodule whose quotient is finite and projective, with stalk rank k. It is not a scheme.
- `Module.Basis.flag` (`Basis/Flag.lean:37`), `RootPairing` (`Defs.lean:81`), `RootPairing.Base` (`Base.lean:68`), `RootPairing.weylGroup`.

Tau Ceti `2fd255d9`. All 130 main-only names were found with the right namespace, including:
- `RootPairing.demazureOperator` (`Weyl/Demazure/Basic.lean:81`). Its body gives the three strings; the string lemmas are at `:96`, `:107` and `:118`.
- `one_sub_single_neg_root_mul_demazureOperator` (`:153`).
- `prod_map_demazureOperator_eq_of_wordProd_eq` (`Braid.lean:707`, `[P.IsReduced]`, reduced words of a base).
- `weylDenominator_mul_prod_map_demazureOperator` (`LongestElement.lean:135`). Its right side is the dot alternatization Σ sgn(w)e^{−(ρ−wρ)}w(f), matching line 163.
- `TauCeti.LSPath` (`LSPath/Basic.lean:101`). Its fields: directions are minimal coset representatives of `wallIndices`; times strictly increase from 0 to 1; consecutive directions differ; there is an a-chain at each break.
- `LSPath.finite` (`Basic.lean:390`, dominant λ), `toPLPath_injective` (`Realization.lean:96`, injective on Wλ, no two orbit points on a ray) and `forall_raise_eq_none_iff` (`Highest.lean:73`).
- `PLPath.lower_mul` (`Concatenation.lean:116`): lowering acts on p exactly when −minHeight(q) < f(p(1)) − minHeight(p), i.e. ε(q)<φ(p), as line 955 says.
- `PLPath.lower_straight` (`RootOperator.lean:749`), `NormalCrystal` (`Crystal/Basic.lean:87`), `tensor` (`Tensor.lean:89`), `formalCharacter` (`Character.lean:38`), `component` (`Component.lean:178`).
- `bondGcd_eq_intervalBondGcd` (`Weyl/IntervalBondGcd.lean:297`).
- `MinimalCosetRepChain.simpleMul` (`Weyl/ReflectedChain.lean:105`, namespace `_root_.CoxeterSystem.MinimalCosetRepChain`).
- `RootPairing.wallIndices` (`Weyl/ParabolicQuotient.lean:105`, `_root_`).
- `weylCoxeterSystem` (`Coxeter/Presentation.lean:167`).
- `GeneralLinear.diagonalRootDatum` (`GeneralLinear/Root/Datum.lean:118`).
- `Scheme.Modules.Cohomology` (`AlgebraicGeometry/Cohomology/Basic.lean:61`) and `InvertibleSheaf` (`LineBundle/Basic.lean:119`).

**Cross-roadmap citations resolved** (main at eaf17b1):
- ModularCurves §0G (line 427).
- ReductiveGroups Layers 7, 7b, 7C, 8, 9, 10 (lines 627, 732, 652, 1023, 1092, 1731).
- GroebnerGeometry G5 (line 394).
- SchemeAndStackFoundations Layers 1, 2 and 5, and §§2.2, 2.6, 4.12, 5.7 (lines 2044, 3232, 6535, 3309, 3437, 5613, 6987).
- StableReduction Layers 2 and 4 (lines 405, 529).
- AlgebraicVectorBundles L2A (line 306).
- TopologicalKTheory T1 item 5 (line 228).
- LieGroups Layers 6 and 8 (`RepresentationTheory/LieGroups`, lines 383, 428).
- ComplexKahlerGeometry K3 and K4 (lines 296, 444).
- RealAnalyticGeometry R3.2 (line 728).
- AlgebraicTopology Stage 5 (line 849, item 3 at line 870).
- MorseTheory M2 (line 144).
- CharacteristicClasses C5 and C5a (lines 1344, 1420).
- ReflectionInvariantTheory §§1–3.
- HamiltonianReduction R2a (`SymplecticGeometry/…`, line 157).

At open heads:
- GeometricQuantization §§3.3–3.4 (the 1186 head, lines 624 and 680; its contract at line 200 consumes S9.1/S9.7).
- TensorProductCombinatorics §8.3 and Layer 6 (the 1107 head, lines 2277 and 1707; it consumes S4.1 and S9.5).
- IndexTheory I8 (the 1077 head, line 901; scope mention only).

`roadmaps grep` finds no citation, on main or at any open head, of the removed S9.2–S9.4.

**Ownership.** `roadmaps grep` over main and every open head for Demazure characters, LS paths, standard monomials, flag K-rings and Bott–Samelson finds:
- no second owner of Demazure characters or flag K-rings;
- LS paths only on main (KacMoody, a consumer and generalisation) and in TensorProductCombinatorics (a consumer);
- standard monomials only in GroebnerGeometry's polynomial normal forms, which S6.2 consumes.

KacMoody §7.2 builds Kac–Moody ind-flags and compares them with “the existing finite flag owners”, so it is a consumer. FlagVarieties on main classifies parabolics and projective homogeneous spaces over an algebraically closed field and consumes S1–S2.3 (line 51); its S1 and S2.3 citations resolve at this head. Its line 284 names ShimuraData §3.8 as a supplier of Par_t(G), the object S1.0 constructs relatively. That is one of the objects the previous round recorded as moved down; ShimuraData is not given with files here, so I did not check it beyond this. One object does have two owners: the analytic spaces with nilpotents and proper GAGA of S9.0 are also owned by ComplexComparisonPartII C-1 and C1.9 (`roadmaps show`, its Scope at line 59). Main's version of this roadmap cited that roadmap. I tested the citation on a scratch copy of the README with a ComplexComparisonPartII C1.9 item added to S9.0's *Needs:*:

    UPWARD: SchubertGeometry (on main) -> ComplexComparisonPartII (#42) at README lines [1468]

So the move down into S9.0 is forced. SchubertGeometry, being on main, is the earlier owner, and the citation has to be added on ComplexComparisonPartII's side. The brief lists ComplexComparisonPartII and IndexTheory among the roadmaps this one may consume, but depcheck places a roadmap on main before the whole merge order. I follow the gate.

`Suggested.lean` declares no name, so no fully qualified name can collide.

**Seeded sample, read at the locator:**

| Target | Locator read | What the source says / result |
|---|---|---|
| S1.1 flags | none named | R02; BrionFlags §1.2 lines 256–258 give the product-of-Grassmannians model |
| S1.5 symplectic | Mathlib only | block identities recomputed (table below) |
| S3.3 signed strings | KnutsonDemazure lines 85–98 (p. 3) | d_αp=(p−α r_α p)/(1−α), positive denominator, as the README's Δ_i |
| S3.5 embeddings | BrionFlags lines 549–552 (Proposition 1.4.1, p. 14), 562–568 (p. 15), 653–654 (p. 17) | ample ⇒ very ample; product of Plücker maps is a closed immersion; L(χ_d) is the pullback of O(1); the arbitrary-characteristic statement is R02 |
| S3.6 A₂ | KnutsonDemazure line 142 (§4.0.2, p. 4) | SL₃, λ=2ω₁+5ω₂, word (12)(23)(12); start D_{1,λ}=C_{w₀λ} (line 78) as χ₀=e^(0,5,7) |
| S4.2 root operators | Littelmann1995 lines 502–523 (Proposition 4.7, Corollary 2, pp. 511–512) | reflect between the last minimum and the first later +1 time; merge repeated directions (Remark 4.8) |
| S4.6 path sections | LLM lines 263–267 (Theorem 4, p. 299), 338–342 (Theorem 6, p. 301); line 40: any algebraically closed field | standard monomial basis of V*_{i,m}; H⁰≅V*_{i,m}, Hⁱ=0 for i≥1 |
| S4.7 opposition | LLM p. 309 = §2.4 | wrong page and section: R02; the intended statement is Proposition 14, line 809 |
| S5.2 compatible ideals | Ramanathan1987 lines 196–200 (Definition 1.1(b–c), p. 65), 231 (Proposition 1.4, p. 66), 799–802 (Theorem 3.5(i), p. 82) | σ(F_*I)=I; all Schubert varieties simultaneously compatibly split |
| S5.5 vanishing | Ramanathan1987 lines 904–906 (Theorem 3.7, p. 84) | any characteristic, H⁰(G/Q,L)≠0 ⇒ Hⁱ(X,L)=0 for i>0 and restriction onto |
| S8.1 K₀/G₀ | BrionFlags line 1374 (§3.3, p. 38) | for nonsingular X the map from vector-bundle K⁰ to coherent K₀ is an isomorphism |
| S8.3 equivariant map | MerkurjevEquivariant line 200 (Corollary 1.12, p. 5), lines 637–663 (§6.3, Proposition 6.5, pp. 15–16) | R(H)≅K₀(G;G/H); θ: R(T)⊗_{R(G)}K′(G;X)≅K′(T;X) for split G with simply connected G′ |
| S9.0 GAGA | SGA1 lines 9399 (XII 1.1, p. 239), 9479 (1.3.1, p. 241), 9738 (4.2, p. 248), 9801 and 9805 (4.3, 4.4, p. 249) | representability, completed local rings, exact faithful analytification, proper exchange isomorphism, equivalence of coherent categories for proper X |
| S9.7 moment–Morse | KnutsonSymplectic lines 24–40 (§1, p. 1), 53–56 (§2, p. 2), 80–94 (p. 3) | KKS form; ι_Xω=−dΦ_X; Φ_X Morse with even indices |
| S9.8 adapter | none needed | deduction from S3.1 and S9.1 |

**Adversarial table.** Every value below was computed this round: by script for S3.6 and S1.5, by hand for the rest.

| Statement | Instances | Values computed on both sides | Result |
|---|---|---|---|
| S1.1 incidence | rank 3, ranks (1,2) | product dimension 2+2=4; flag 3 | pass |
| S1.1 nilpotent test | k[ε], line e₁+εe₃, plane ⟨e₁,e₂⟩ | F₁→E/F₂ sends the generator to ε·ē₃≠0; reduced points nested | pass |
| S1.1 degenerate | empty rank list; r=0, r=N | S; S, not empty | pass |
| S1.5 Gram identity | m=1..4, every 0≤r≤m (14 cases) | CᵀQ_srcC = J_(r,s) in all 14 | pass |
| S1.5 unipotent condition | 30 random integral (Y, Z=Z₀+sym) per case | u(Y,Z)ᵀJu(Y,Z)=J in all; Z−Zᵀ=YᵀJ₀Y | pass |
| S1.5 product, inverse | Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=4−6=−2; Z-coordinate 9, reversed sign 13; Z+(−Zᵀ)−YᵀJ₀Y=0 | pass |
| S1.5 conjugation | l(A,D)=diag(A,D,A^{−T}) | top-middle block AYᵀJ₀D⁻¹=(DYAᵀ)ᵀJ₀ by DᵀJ₀=J₀D⁻¹ | pass |
| S1.5 dimension | from the stabilizer | m(2m+1)−[r²+s(2s+1)+2sr+r(r+1)/2] = r²/2+2rs+r/2 = r(2m−r)−r(r−1)/2; m=3, r=3: 6 = dim LG(3,6) | pass |
| S1.0 cells | GL₃/𝔽₂; P² | 1+2+2+4+4+8=21=168/8; 1+2+4=7 | pass |
| S1.0 canonical line | GL₂, Borel scheme ℙ¹ | det(Lie B)^* ≅ det(gl₂/Lie B) = T_{ℙ¹} = O(2), degree 2 | pass |
| S1.3 pivots | Gr(2,4): (1,2), (1,3), (3,4) | Σ(p_i−i)=0, 1, 4; λ=(2,2), (2,1), (0,0); 4−|λ| matches | pass |
| S3.3 D_i strings | m=0, −1, −2 (native Basic.lean:96, 107, 118) | e^λ; 0; −e^{λ+α} (augmentations 1, 0, −1) | pass |
| S3.3 Δ_i=ιD_iι | 200 random A₂ weights (script) | strings agree; m=1: Δ=0, D=e^λ+e^{λ−α} | pass |
| S3.3 numerator law | N=p−e^α s_i p | s_iN=s_ip−e^{−α}p=−e^{−α}N | pass |
| S3.5 Checks | SL₂ L(1); λ=0; Frobenius twist | identity, rank 1; point, rank 0; [x^p:y^p], derivative 0 | pass |
| S3.6 word 121 | χ₀=e^(0,5,7) | augmentations 1, 6, 33, 81; χ₁ and χ₂ match the displayed sums, multiplicity-free | pass |
| S3.6 coefficient formula | 46 weights | 1+min{2,a,b,c,7−a,7−b,7−c} equals χ₃; histogram 21/15/10; (4,4,4)↦3; (9,3,0)↦0 versus formula −1 | pass |
| S3.6 word 212 | ψ₁..ψ₃ | 1, 3, 21, 81; ψ₃=χ₃; Δ₁χ₃=Δ₂χ₃=χ₃; S₃-invariant | pass |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0, u≥w≥v | 81 patterns; multiplicities equal χ₃ coefficientwise | pass |
| S3.4 longest word | D₁D₂D₁(e^(7,5,0)) | equals χ₃ (script) | pass |
| S4.1 central shift | GL₂, φ(1/2)=1/4, χ=(1,1) | (3/4,1/2): x−2y=−1/4; canonical (1,1/2): 0 | pass |
| S4.2 lowering | SL₂ shape 2 | H=2t: t₀=0, t₁=1/2 → (s₁,1;0,1/2,1), endpoint 0; again: minimum −1 at 1/2, t₁=1 → (s₁;0,1), endpoint −2 | pass |
| S4.2 native lower_straight | f(v)=1 | straight(v−α)=straight(−ω), endpoint −1 | pass |
| S4.3 a-chain | bond 2 | 2·½=1, 2·⅓=⅔; with denominator 3 admitted, breaks ⅓ and ⅔ give 5 elements | pass |
| S4.3 transport law | T(λ,χ;σ): B(λ)^{σ+χ}→B(λ+χ)^σ | composite B(λ)^{σ+χ+ψ}→B(λ+χ+ψ)^σ = T(λ,χ+ψ;σ); inverse T(λ+χ,−χ;σ+χ) types match | pass |
| S4.4 adjoint controls | E_ab basis of sl₃ | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; [E₁₂,H₁]=−2E₁₂, [E₁₂,H₂]=E₁₂; all 32 simple-generator brackets single-target; pairwise determinants 1, 1, −1 | pass |
| S4.4 Weyl formula | PGL₂, λ=α | e^{ρ}=e^{α/2}∉ℤ[ℤα]; native Δ·char=(1−e^{−α})(e^α+1+e^{−α})=e^α−e^{−2α}=J(e^α) | **R03** |
| S4.6 Checks | SL₂ L(1) | degree 2: 3 monomials versus 4; at [1:0]: x²=1, xy=y²=0, image dimension 1 | pass |
| S4.7 point and longest | w=e; w=w₀ | only π_κ, weight −κ=w₀λ, transported λ = fibre weight (S3.2 Check); w₀: all of −wt V(κ) = wt ∇(λ) | pass; locator R02 |
| S5.1 trace | char 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ(F_*x²)=x versus k[x]-linear x² | pass |
| S5.2 ideals | σ=Tr(x·) | σ(F_*(x·x^a))=x^{(a+1)/2}∈(x) for odd a, otherwise 0; σ(F_*x²)=x∉(x²) | pass |
| S5.3 kernel | SL₂→PGL₂, char 2 | μ₂=k[u]/(u²−1)=k[u]/((u−1)²) | pass |
| S5.5 mixed union | P¹, Y={0,∞}, λ=0 | H⁰(O_Y)=k²; I_Y=O(−2), H¹=k | pass |
| S5.7 Q=ii | L=O(−2) | RΓ(Z,π*O(−2))=RΓ(ℙ¹,O(−2)): H⁰=0, H¹=k | pass |
| S7.1 covers | GL₃, ω₁, w=s₁s₂ | β=α₂: 0; β=α₁+α₂: 1; λ=ρ: 1, 2; both projected weights ε₂ | pass |
| S7.1 non-cover | w=s₂s₁ | v=s₂: coefficient 1, ε₃>ε₁ through ε₂; v=s₁: ε₃>ε₂, bond −⟨ε₃,α₂∨⟩=1 | pass |
| S7.1 bond sign | v=ws_β, γ=−wβ>0 | −⟨wλ,γ∨⟩=⟨λ,β∨⟩ | pass |
| S7.2 cone | Gr(2,4) | on p₃₄=0, p₁₃p₂₄=p₁₄p₂₃, p₂₄=0 gives p₁₄p₂₃=0 = X_(1,1)∪X_(2); dims 3, 1 for pivots (2,4), (1,3) | pass |
| S8.1 classes | P¹ | [O_e]=[O]−[O(−1)]: rank 0, χ=1−0=1 | pass |
| S8.2 SL₂ | t=[O(−1)] | (1−t)²=0, [O(1)]=t⁻¹=2−t | pass |
| S8.3 restriction | SL₂ | 1⊗z: z at e, z⁻¹ at s; z⊗1: z, z; P=G: R(T) | pass |
| S8.4 PGL₂ | u=[O(1)]−1 | [O(2)]=1+2u; image ℤ+2ℤu | pass |
| S8.5 push-pull | P¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass |
| S9.0 base change | ℙ¹ over ℂ[t], class t | complex [A→A] by t: H⁰=0, H¹=A/t; at t=0 H⁰=ℂ | pass |
| S9.0 dual numbers | Spec ℂ[ε]/(ε²) | H⁰ has basis 1, ε on both sides | pass |
| S9.5 GL₂ | (t,0) | height t; lowers to (0,t); plus (1,1) gives endpoint (2,1) | pass |
| S9.6 SU₂ | K/N(T)=ℝP² | H⁰=ℤ, H²=ℤ/2; χ=2/2=1; SU₃ 6/6=1 | pass |
| S9.7 ℙ¹ orbit | regular X; central X | indices 0, 2: 1+q², χ=2; constant height | pass |
| S9.8 Checks | SL₂/B−; torus | O(1), degree +1; characters 0, 1 give one ordinary line | pass |
| Worked: fixed plane | n=4, k₀=2 | d∈{0,1,2}: 3=min(2,2)+1; Z₀=Gr (no 3-minors of a rank-2 source) | pass |
| Worked: 8 versus 9 | Flag(ℂ³) in P²×P²* | H⁰(O(1,1)) = 9−1 = 8; highest weights (2,1,0) and (0,−1,−2); trace of u↦(u∧ω)v is v∧ω | pass |
| Contract: tie rule | native `lower_mul` | lowering on p iff ε(q)<φ(p); on a tie f acts right and e acts left | agree |
| Contract: Demazure longest | native `:135` | dotAlternatization Σ sgn(w)e^{−(ρ−wρ)}w(f) = README's Σ sgn(w)e^{wρ−ρ}w(f) | agree |

## Not verifiable

- Steinberg1975, Pittie1972 and Jantzen are uncertified, paywalled and cited by locator only. I read no text.
- LLM's printed pages: I read the author copy. The README maps its pages by +292, consistently (Theorem 4 p. 299, Theorem 6 p. 301, §4.1 p. 315). I did not compare this against the journal's typesetting.
- KnutsonDemazure §4.0.2: the diagram itself (lines 147–149) is unreadable in the OCR. Only the word, the weight and the root directions were read.
- KnutsonBottSamelson, KnutsonBorelWeil and CFL: not re-read this round, since they are outside the sample.
- Open pull requests without files in the brief (ComplexComparisonPartII, ShimuraData, AlgebraicModuliForArithmeticGeometry): checked only through `roadmaps grep` and `roadmaps show`.

## Source issues

- **Misprint** in BrionFlags at Proposition 1.1.3, printed p. 5 (lines 189–191): the source counts the indices with i_k strictly less than j in both the cell and the closure conditions. It should be i_k ≤ j, since E_I itself meets ⟨e₁,…,e_{i₁}⟩. Affects a stated result.
