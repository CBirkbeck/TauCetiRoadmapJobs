# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 9107b6b)

**Verdict:** needs changes

This is an incremental re-review of the 82 lines (41 added, 41 removed, all in README.md) that changed since cd70693. It found 2 findings, 1 P2 and 1 P3. Both carry over from the previous report: one is partly repaired, one is not repaired. The repairs introduced no new defect. Below, README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` and Suggested.lean is the file beside it. Other roadmaps are cited by folder and pull request, with line numbers at that pull request's head.

## R01 (P2) — Eichler orders and Brandt matrices still have two owners

**Location.**
- README:9: “For quaternion orders over every number field they are Eichler orders with their completed levels and right ideal classes, and the neighbour ideals with their Brandt matrices at places prime to the level (§§R18.5.16a, R18.5.16c)”.
- The targets are §R18.5.16a (README:2353) and §R18.5.16c (README:2382).

**Claim.** README:9 and README:4392 now describe QuaternionArithmetic correctly: it consumes R18.1, §R18.3.1 and §R18.5.17a. The double ownership the previous report raised is still there, though. At its head, QuaternionArithmetic still defines and proves the content of §§R18.5.16a and R18.5.16c itself, and does not cite them. Each object therefore has two owners.

**Witness.** QuaternionArithmetic at #1722:
- README:664: “Define Eichler orders as pinned”; §§1.10 and 1.12 at lines 685 and 731.
- §7.1 at line 1491 defines `T(𝔫)`.
- Suggested.lean:216: `def IsEichler`.
- Lines 236–239 consume only R18.1, R18.3.1 and R18.5.17a.

**What overlaps.** These items of #1722 restate the following parts of this roadmap:

| QuaternionArithmetic at #1722 | This roadmap |
| --- | --- |
| §1.9: definition, locality, conjugacy to `O₀(𝔭^e)`, intersection of `M₂(R)` and `[[R,𝔭^{−e}],[𝔭^e,R]]` | §R18.5.16a, items 1–2 |
| §1.10: level coprime to the discriminant, local unit index `N𝔭^{e−1}(N𝔭+1)` | items 2 and 4 |
| §1.12: vertices at distance e meet in an Eichler order of level `𝔭^e` | item 1 |
| §§7.1–7.3: Brandt matrices, independence of representatives, commutativity, self-adjointness | §R18.5.16c, items 1–4, at `𝔫=𝔭_v` prime to the level |

**Repair.** This roadmap stays the owner. QuaternionArithmetic consumes three of its sections, so it is the later roadmap and has to cite. That needs the following edit in #1722 (author roed-math), and this folder should not be accepted until #1722's head carries it:
- §1.9 cites §R18.5.16a items 1–2 for the definition and the local form. It keeps superorders, the hereditary criterion and the normalizer quotient ℤ/2, which §R18.5.16a does not state.
- §1.10 cites items 2 and 4 for the level and the local unit index. It keeps the genus statement, `ψ(𝔐)` and local norm-maximality.
- §1.12 cites item 1 for the two maximal orders at distance e. It keeps the bijection between vertices and maximal orders.
- §§7.1–7.3 cite §R18.5.16c for `T(𝔭)` at primes not dividing the level of an Eichler order. Since #1722 uses the column convention, `T(𝔭)=B(v)ᵀ`. It keeps `T(𝔫)` for composite 𝔫 and for non-Eichler orders, multiplicativity and the trace formula. Each kept variant says in one clause how it differs.
- Lines 236–239 add §§R18.5.16a and R18.5.16c to the consumed list.

The conventions already agree on a test case. #1722's Check at D=11 has `T(2)=[[1,3],[2,0]]`, whose columns sum to 3. Its transpose `B(2)=[[1,2],[3,0]]` has rows summing to `q+1=3`. With weights (2,3), item 4 of §R18.5.16c holds with `s_v` the identity: `w₂B₁₂=3·2=6=w₁B₂₁=2·3`. The citation therefore changes no Check of #1722.

The only other settlement is the reverse one. QuaternionArithmetic stops consuming R18.1, §R18.3.1 and §R18.5.17a, so that it can precede this roadmap. Then §§R18.5.16a and R18.5.16c become citations of its §§1.9–1.12 and 7.1–7.3, and README:9 says so.

## R02 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description still does not name

**Location.**
- README:45: “AlgebraicTopology, Layer 6”, and README:100: “**AlgebraicTopology** (Layer 6)”.
- README:3572 links `../AlgebraicTopology/README.md#layer-6-cohomology-products-and-manifold-duality`.

**Claim.** This numbering and anchor exist only at the head of #1652, so the citation makes #1652 a dependency. The pull request names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.**
- On main, AlgebraicTopology README:946 reads “## Stage 6: cohomology, products, and manifold duality”, and no Layer 6 anchor exists there.
- `roadmaps overlaps` reports the id as “only an open revision defines”, at #1652 (author kim-em).
- “1652” occurs nowhere in the description.

**Repair.** Add “#1652 AlgebraicTopology (kim-em)” to the description's Depends-on list, and put it before this pull request in the merge-order paragraph. Leave the README as it is. Repointing to main's “Stage 6” would break when #1652 merges, because #1652 renames that heading.

## Previous findings

The ids below are those of the previous report (review of cd70693).

- R01 — partly repaired: README:9 now reads “QuaternionArithmetic consumes this roadmap (R18.1, §R18.3.1 and §R18.5.17a) and is not one of its suppliers”, and README:4392 matches. #1722 still restates both sections; this is R01 above.
- R02 — repaired: README:2899 now reads “`π₂` by `x↦xω⁻¹`, which is defined on `Y_{H₀(w)}` because `ωH₀(w)ω⁻¹⊂H`. If (f,g) lies in the kernel, then `f(x)=−g(xω⁻¹)` for all x”. The invariance computation follows, and MS19's misprint is noted with the witness.
- R03 — repaired: README:94, 2445 and 2487 use `#r1715-swapped-quaternion-invariants-in-arithmetic-applications`, and README:2445 uses `#44-…` and `#42-…`. README:136, 2868, 3005 and 3027 use `#58a-…`, `#06-hecke-operators-on-invariants` and `#58b-galois-eigensystems`. All of them resolve.
- R04 — not repaired: README:3572 still links `#layer-6-cohomology-products-and-manifold-duality`, and the description still does not name #1652. This is R02 above.
- R05 — repaired: README:93 reads “(§§3, 3.4)”, “(§4.3)”, “(§4.2)”; :116 “(§3.14)”; :128 and :3869 “`§7a.1`, `§7a.2`”; :3045 and :4007 lost their duplicates; §R18.4.30 lost its self-references; the §R18.5.16b sentence is deleted.
- R06 — repaired: README:4239 now reads “[Sai09] §§4–5, pp.19–25”. That is correct, and more precise than the previous report's suggested pp.19–24, because §5 runs onto p.25 (see the sample below).

## Verified sound

**Validation.**
- **Head and pins.** Head 9107b6b3c3f4719b43e24b723a878da43c0fd92b. Pins unchanged: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, Lean v4.36.0-rc2.
- **Files.** The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`). Suggested.lean is byte-identical to cd70693.
- **Worker's gate.** Every rule is 0, including `build=0`, `stray-files=0` and `statement-hygiene=0`.
- **My rerun of the gate.** Every text rule is 0, ending in `OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 243 roadmaps, 2489 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean: exit 0, no output.
- **Worktree.** It is clean afterwards.
- **Suggested.lean.** It declares nothing. The `#check @` signature pass and the one-tactic padding probe therefore have nothing to run on. The previous report's headline assessment stands, because neither file's statements changed. The end theorems are R18.5.15, R18.4.32–R18.4.33, R18.3.8 and H6.2–H6.8, and none is statable at the pins. The docstring names each group of headlines with the carrier it lacks.

**Changed passages reviewed in full.**
- README:9, 30, 93, 94, 116, 128, 136 and 327.
- README:733, 835, 1063, 1757 and 1832.
- README:2445, 2467, 2476 and 2487.
- README:2856–2868 and 2876–2899.
- README:3005–3045, 3183, 3317, 3491, 3697 and 3790.
- README:3869, 4007, 4043, 4084, 4125–4137, 4239, 4290 and 4392.

**What those edits do.**
- **Self-references.** Each deleted self-reference was inside the section it named:
  - :835 in §H3.4 and :1063 in §H4.8;
  - :2876 in §R18.3.7 and :3009 in §R18.3.15;
  - :3790 in §R18.4.20, :4084 in §R18.4.29 and :4125–4137 in §R18.4.30;
  - :2467–2487 in §R18.5.18;
  - :327, :3317 and :4290 in their own layer's Dependencies.
- **Duplicates.** Each removed duplicate (:733, :1757, :1832, :3183, :4290) leaves the cited item present once.
- **Sentences.** No sentence lost a supplier or changed its mathematics. My scan for self-references and duplicated locators finds none left in the changed lines.

**Cross-roadmap anchors.**
- 72 of the 73 anchored cross-roadmap links resolve, at main or at the supplier's head. The exception is R02.
- All 753 internal anchored links resolve.
- **New targets, each opened and read:**
  - AutomorphicFormsOnReductiveGroups at #1037: §0.6 at line 201 (`invariantsHecke`, `IsHeckeTriple`, `HeckeCoset`, the opposite action), §5.8a at line 913 (`𝕋^S = MvPolynomial ({v ∉ S} × Fin 2) 𝒪`, `eigenIdeal`), §5.8b at line 927 (`galoisAnemicEigenSystem`) and §7.3a at line 1208 (`arithmeticHeckeSystem`).
  - AdelicAlgebraicGroups at #792: §4.2 at line 4283 and §4.4 at line 4766.
  - GL2AutomorphicRepresentationsAndTransfer at #931: §R17.1.5 at line 1464.
  - Chebotarev on main: Completed/Chebotarev README:410, Layer 10. There is no `TauCetiRoadmap/Chebotarev` on main any more, so the path change is required.
- **The renumbered AutomorphicFormsOnReductiveGroups citations state what is attributed to them.** README:2856's polynomial `X²−T_vX+q_vS_v` is §5.8b's `det(X−ρ(Frob_v))=X²−t_vX+q_vs_v`, in the same normalization. README:3005's `𝕋^S` is §5.8a's presentation, verbatim in form.

**Other citations.**
- `roadmaps grep 'R18\.5\.16b'` finds no match on main or at any open head.
- §R18.5.18 is still cited by NeronModelsAndSemistableAbelianVarieties (#852, lines 2908 and 4497) and SerreWeightAndLevelOptimisation (#1013, lines 131 and 438), and it still exists here (README:2447).
- `roadmaps overlaps`: no other open pull request changes this roadmap, and no id cited here is dropped elsewhere.
- **Planned supplier names** (the four leads of `roadmaps resolve`) are present in their READMEs:
  - `OrderIdeles.unit_change` in ClassicalArithmeticCompletion on main, line 16155;
  - `FrankeInput` and `isoSingular` in ArithmeticLocallySymmetricSpaces at #871;
  - `minimal_defined_over_reflex` in ShimuraVarieties at #933.
- **Library declarations opened at the pin:**
  - Mathlib `IsHeckeTriple` (NumberTheory/HeckeRing/Defs.lean:75) and `HeckeCoset` (Defs.lean:157);
  - Mathlib `RingHom.ker_isMaximal_of_surjective` (RingTheory/Ideal/Maps.lean:852);
  - Mathlib `MvPolynomial.eval₂Hom` (Algebra/MvPolynomial/Eval.lean:158).

**Ownership.**
- **Method.** By object, for Eichler orders and Brandt matrices: `roadmaps grep` over main and the 472 open heads, then reading #1722, #1724 and #934.
- **QuaternionArithmetic (#1722).** The only second owner (R01).
- **HilbertModularForms (#1724).** Its §10.3 (line 2310) defines nothing new: it reads `B(𝔭)` as the matrix of QuaternionicModularForms §3.1 on the §0.3 class-set basis. It is not an owner.
- **QuaternionicModularForms (#934).** It owns class sets and Hecke operators, but neither Eichler orders nor Brandt matrices.

**Seeded sample, where it falls in the changed passages.** The sample's labels are generic. These are the 10 targets in the changed passages, each read at its locator:

| Label | Target | Source (`<id> line N`) | Result |
| --- | --- | --- | --- |
| Theorem | R18.3.8 definite Ihara lemma | MS19 lines 1718–1729 (§6.2, Thm 6.8, pp.34–35), 1736–1744 (proof, p.35), 481–489 (§2.11, p.10) | Supported. The hypotheses (S, unramified at w, non-Eisenstein m) match. The README's `ω⁻¹` correction is right; the misprint is under Source issues. |
| Theorem | R18.4.30 nodal thickening transfer | MS19 lines 1568 (Lemma 5.1, p.31), 1591–1597 (Lemma 5.2, p.32), 1622–1630 (Lemma 5.3, pp.32–33) | Supported. The rewording keeps exactly Lemma 5.2's hypotheses: M flat, `XL=0`, `XYN=0`. |
| Construction | R18.4.29 weak patching system | MS19 lines 920 (Def 4.1, p.19), 960 (Prop 4.2, p.20), 1004 (Lemma 4.7, p.21) | Supported; pages correct |
| Theorem | R18.4.20 Taylor–Wiles datum | MS19 lines 1074 (§4.2, p.22), 1146 (Lemma 4.10, p.24) | Supported; pp.22–24 correct |
| Finite-level specialization | R18.4.34 Saito projector | Sai09 lines 816 (p.19 header), 841 (§4), 982 (§5, p.22), 1072 (p.25 header), 1102 (§6.1) | §§4–5 span pp.19–25: correct |
| Comparison | R18.3.6 split Hecke normalization | AutomorphicFormsOnReductiveGroups at #1037, line 201 | Supplier states the cited operators; KW09 not reread (Not verifiable) |
| Construction | R18.3.15 residual Hecke ideal | #1037 lines 913, 927, 1208 | Supplier states the cited presentation and eigensystems |
| Construction | R18.5.17a class-set graph | Zha14 lines 594 (§3.4, printed p.207), 629 ((3.14), p.208), 650 ((3.17), p.209) | Supported. The cited pp.208–209 carry (3.14)–(3.17). |
| Comparison | R18.5.18 torsion realization | Zha14 lines 1243–1245 (§6.3 begins printed p.228) | Locator correct |
| Definition | README:9 scope of §R18.5.16c | README:2384 (v split, prime to 𝔑, `j_v(R_v)=M₂(O_v)`) | Consistent |

No README locator is flagged as unverified.

**Adversarial pass.**

These rows were computed this round, for the changed statements:

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| R18.3.8: `π₂` well defined | `k=(a b; c d)∈K₀(w)`, `ω=diag(ϖ,1)` | `ωkω⁻¹=(a ϖb; c/ϖ d)`, with `c/ϖ∈O_w` since `c∈ϖO_w`. So `ωH₀(w)ω⁻¹⊂H` and `[x]↦[xω⁻¹]` is well defined. | Correct |
| R18.3.8: kernel relation | `(f,g)↦f∘π₁+g∘π₂` | The kernel is `f(x)+g(xω⁻¹)=0`. Then `f(xω⁻¹hω)=−g(xω⁻¹h)=−g(xω⁻¹)=f(x)`, so f is `ω⁻¹Hω`-invariant. | Correct (previous R02 repaired) |
| R18.3.8: printed `g(xω)` | `k=(1 1; 0 1)∈H₀(w)` | `ω⁻¹kω=(1 ϖ⁻¹; 0 1)∉H`, so `x↦g(xω)` is not `H₀(w)`-invariant. With `xω`, f would be `ωHω⁻¹`-invariant, which at w contains `(1 0; ϖ⁻¹ 1)`. | README remark correct |
| R18.3.8: generation | determinants | `det(ω⁻¹hω)=det h∈O_w×`. The generated group contains `SL₂(F_w)` (amalgam at adjacent vertices) and lies in `{det∈O_w×}`, so `ω` is not in it. The norm-fibre step of §R18.3.7 is therefore needed. | Correct |
| R18.3.8: degenerate case | F=ℚ, D ramified at {2,∞}, w=3, H Hurwitz | `#Y_H=1`. `#Y_{H₀(3)}=1` (one class, by §R18.5.16a's Check). `π*(a,b)=a+b`, with kernel `{(a,−a)}` of dimension 1. `T₃` on constants is 4=q+1 and `S₃=1`, which is Eisenstein. | Matches the README Check |
| README:9 vs §R18.5.16c vs #1722 | D=2: `B(3)`, `B(5)`; D=11: `B(2)` | D=2: `B(3)=(4)` and `B(5)=(6)`, equal to #1722's `T(3)`, `T(5)`. D=11: `B(2)=T(2)ᵀ=[[1,2],[3,0]]`, rows 3, 3. Item 4: `3·2=2·3`. The Hurwitz level-3 order at v=3 is excluded by “prime to the level”. | Consistent; duplication (R01) |
| README:9, :4392 vs #1722 | #1722 lines 169–170, 236–239 | Both list R18.1, R18.3.1 and R18.5.17a | Accurate |
| R18.4.30, nodal thickening (reworded) | `R=A=k[[X,Y]]/(X²Y)`, `M=A`, `L=XY·A`, `N=A/(XY)` | `XL=X²Y·A=0` and `XYN=0`. `N=B` is B-flat. `N/XN=k[[X,Y]]/(X,XY)=k[[Y]]`. `L≅A/ann(XY)=A/(X)=k[[Y]]`. | Correct, = MS19 Lemma 5.2 |
| R18.4.34 locator | Sai09 page markers | §4 at line 841 (p.19); §5 at line 982 (p.22); §6.1 at line 1102 (p.25 starts at line 1072) | pp.19–25 correct |
| R18.3.6/R18.3.15 supplier renumbering | trivial coefficients, unramified v | The double coset of `diag(ϖ,1)` has q+1 right cosets (#1037 §0.5 Check), so `T_v=q+1` and `S_v=1`. Then `X²−(q+1)X+q=(X−1)(X−q)`, matching §5.8b's normalization. | Consistent |
| H3.4 Check, :835 (reworded) | F=ℚ(√2), N=5, ε=1+√2 | `ε³=7+5√2≡2 (mod 5)` and `ε⁶≡−1`. So `U₅=⟨−ε⁶⟩`, `S₅=⟨ε¹²⟩`, `U⁺=⟨ε²⟩` and `Δ(5)≅ℤ/6`. A map ℤ→J killing 6ℤ factors uniquely. | Correct |
| R18.5.18, torsion realization (internal references) | Tate factor of valuation ℓ; one loop | `coker(ℤ →ℓ ℤ)=ℤ/ℓ`, so `Φ[ℓ]=ℤ/ℓ`. A thickness-one loop gives `Φ=coker(ℤ→ℤ, ×1)=0`. “The comparison above” is README:2449, in the same section. | Correct |

Rows carried from the previous report (review of cd70693, its adversarial table), for statements this diff leaves untouched:

| Statement | Values as computed there | Result |
| --- | --- | --- |
| R18.5.16a items 1, 4, 5 | `End(O⊕𝔭^e)∩M₂(O)=O₀(𝔭^e)`. At q=3, e=1: unit index 4, `K₁` index 8, additive index 3. `nM₂(O)n⁻¹∩M₂(O)=O₀(𝔭)`, `n²=ϖ`. | Correct |
| R18.5.16a items 7–8; Hurwitz, level 3, disc 37 | w=12 and 3, masses 1/12 and 1/3; disc 37: h=3, type number 2 | Correct |
| R18.5.16c: ℚ(√10) and p=23 Checks; item 2 | `ζ_F(−1)=7/6`, mass 7/6 = 1/12+1/2+1/3+1/4. `B(2)·diag(2,1,3)` symmetric, Σ1/w=11/6. Inverse coset `S⁻¹T`. | Correct |
| R18.5.17a incidence | `a_*U_r=q·b_*`, `b_*U_r=T_r b_*−a_*` | Correct |
| R18.3.2, R18.3.3, R18.3 Examples | Rank 9, Gram det 4; central-character identity; `C₈/{0,4}≅C₄` | Correct |
| R18.3.15, R18.4.9, R18.4.14 | 𝔽₇: qS=6. `m*=m` iff `s=s⁻¹`. `GJ=((q+1)²−S⁻¹T²)·id`; Δ=0 at S=1. | Correct |
| R18.4.32, R18.4.33 (headlines) | \|SL₂(𝔽₃)\|=24; `O/λⁿ` free over `O/λⁿ` but λ-torsion | Correct; not statable |
| R18.5.15 (headline), R18.5.16/R18.1.1a | `inv₂=½` for disc 6, `M₂(ℚ)` excluded; level-7 cycles inverse (2·4≡1 mod 7) | Correct |
| R18.5.1, R18.5.4, R18.5.6 | `z∈K₂∖K` in Ω, ∞ excluded; group height 8, `[π]` height 4f; shifts 2 and 0 | Correct |
| H1.1, H1.5, H2.1 | −1 not ordered; `T²−2=N(T−√2)`; `W^⊥=W`, `TW=0` | Correct |
| H4.18, H4.19, H6.5 (headline input) | `[U:U₅]=12`, bound 48≥6; `η=17+12√2`, `Δ_n≅ℤ/6`; `x³−3x+1` disc 81, roots 3, 7, 9 mod 19 | Correct; H4.19 refutes BHW23 Lemma 8.20 |

## Not verifiable

- KW09 (R18.3.6), CDN23 (R18.3.15) and BHW23 (H3.4, H4.8) are not in the sources cache and were not reread. In these sections the diff changes only internal references or a supplier's section number; their source locators are unchanged since the previous review.
- Voi21's printed pages (§§R18.5.16a, R18.5.16c) remain unreadable through the sources service, as before. Those sections are unchanged apart from README:9's scope phrase, which was checked against README:2384.

## Source issues

- **Misprint** in MS19 at proof of Theorem 6.8, p.35: the source writes the kernel relation as f(x) = −g(xω); with its own π₂ = ρ_{ω⁻¹} (§2.11, p.10) it should be f(x) = −g(xω⁻¹); affects the proof.
