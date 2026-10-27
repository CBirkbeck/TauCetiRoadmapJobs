<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6438367171 -->
Red team round 1 pass a (codex) of e5dbe2c

Verdict: needs_changes

1. **F01** (P2) The σ-centralizer needs a group over ℚ_p

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:532`, “For G/K₀ and b∈G(K₀)”.

   **Claim:** This datum defines σ(g), and the displayed equation defines an affine reductive ℚ_p-group inner to the Newton Levi.

   **Witness:** Put a∈W(𝔽ₚ²) with σ(a)≠a, u=[[1,a],[0,1]], G=uTu⁻¹, T diagonal, b=1. Then g=u diag(2,1)u⁻¹ has upper entry −a; σ(g) has entry −σ(a) and is outside G.

   **Exact repair text:** “Let G be a connected reductive group over ℚ_p, put K₀=Frac W(𝔽̄_p), and take b∈G(K₀). In the following formula σ acts through the specified ℚ_p-model of G and as the identity on A.” Retain the existing functor, reductivity and inner-form targets. Add a Check distinguishing scalar Frobenius on a chosen ℚ_p-model from entrywise Frobenius after a non-σ-fixed change of basis. KZ25 line 1185 uses the ℚ_p-group from its standing setup.

   **Repair test:** For the conjugated torus, transport the ℚ_p-model along u: σ_G(u t u⁻¹)=u σ(t)u⁻¹. Thus the b=1 fixed group is uT(ℚ_p)u⁻¹ of rank two, as required; the undefined entrywise operation is no longer used.

2. **F02** (P1) The period-torsor supplier does not cover the stated residue fields

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:110` and `:1439`, “compare the rational tensor representations by the neutral torsor above”.

   **Claim:** PadicHodgeTheory §5.5 provides the rational tensor-functor comparison used in §5.17 throughout the integral-frame residue-field range, including finite k.

   **Witness:** `TauCetiRoadmap/PadicHodgeTheory/README.md:1118` starts its period-torsor theorem with K/ℚ̆_p finite. For k=𝔽₃, K=ℚ₃, this hypothesis fails. Its separate general-perfect-residue equivalence does not supply the missing torsor comparison.

   **Exact repair text:** Add “What PadicHodgeTheory must provide (gap:perfect-residue-period-torsor-comparison): For perfect k, finite totally ramified K/Frac W(k), a connected reductive ℤ_p-group G, and two admissible G-valued filtrations on the same tensor G-isocrystal whose cocharacters are geometrically conjugate, the underlying ℚ_p-valued tensor fibre functors of their crystalline realizations are tensor-isomorphic.” Add the matching slug, supplier PadicHodgeTheory, section 5.5 and needs to `design/plan.json`; cite this gap in §5.17 and restrict the existing supplied claim to its actual K/ℚ̆_p range. This preserves §5.17's source-supported generality (Kisin17 lines 242–244 and 484–505).

   **Repair test:** k=𝔽₃, K=ℚ₃ and two copies of the jump-one line with F=3 now fall under the explicit extension contract: both underlying fibre functors are the same one-dimensional ℚ₃ realization and their identity comparison exists. No inclusion ℚ̆₃⊂ℚ₃ is assumed.

3. **F03** (P2) The point-detection gap bundles already supplied ideal calculus

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:72` and `design/plan.json`, gap formal-dvr-point-detection, “every ideal I is T-adically closed”.

   **Claim:** Point detection, adic closedness and localization contraction all require a new supplier extension.

   **Witness:** Pinned `Mathlib/RingTheory/Filtration.lean:415`, `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson`, applies to M=B/I and (T). Pinned `Mathlib/RingTheory/Localization/Ideal.lean:76`, `IsLocalization.algebraMap_mem_map_algebraMap_iff`, gives contraction via pⁿx∈I.

   **Exact repair text:** Keep gap formal-dvr-point-detection only as: “For a reduced p-torsion-free complete Noetherian local O_Ĕ-algebra R with residue k, continuous local maps R→O_K for finite K/Ĕ are jointly injective.” In the Mathlib supplier subsection add: “Apply Ideal.iInf_pow_smul_eq_bot_of_le_jacobson to B/I to obtain ∩ₙ(I+TⁿB)=I when (T)⊂Jac(B). Apply IsLocalization.algebraMap_mem_map_algebraMap_iff with powers of p and p-torsion-freeness of B/I to obtain I=preimage(I[1/p]).” Use these imports in §§4.11–4.13, and shorten the matching plan gap. The ideal facts need no new gap and no completeness assumption beyond the stated application.

   **Repair test:** For B=ℤ₃[[T]], I=(T²), intersections are (T²), and localization contracts to (T²). For I=(3), B/I has 3-torsion and contraction is B, correctly excluding that case.


4. **F04** (P3) The bounded-functions proposition has the wrong printed page

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:46` and `:1612`, “Proposition 7.3.6, p.88”.

   **Claim:** deJong95 Proposition 7.3.6 is on printed page 88.

   **Witness:** deJong95 line 2935 identifies printed page 89; Proposition 7.3.6 begins at line 2952 on that page. Its proof continues on page 90. Page 88 contains earlier lemmas.

   **Exact repair text:** Replace both instances of “Proposition 7.3.6, p.88” with “Proposition 7.3.6, pp.89–90”. Make the same correction in the deJong95 locator in `sources.toml:237`, which also records p.88. Keep Theorem 7.4.1, pp.90–91, unchanged.

   **Repair test:** The corrected range contains the proposition at deJong95 line 2952 and the end of its proof at line 2984; the old page does not.

5. **F05** (P3) Two horizontality Checks test the same tensor

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:659` and `:661`, “identity endomorphism” and “evaluation tensor in Λ⊗Λ∨”.

   **Claim:** §2.7 supplies three discriminating Checks for its definition of first-order tensor horizontality.

   **Witness:** Under End(Λ)≅Λ⊗Λ∨, id corresponds to Σᵢeᵢ⊗eᵢ∨. The first and third Checks both compute c·id·c⁻¹=id. The middle Check is explicitly only an ambient-module diagnostic.

   **Exact repair text:** Replace the third Check with: “Take k=F̄₃, Λ=ℤ₃², the diagonal torus cut out by E₁₁, and μ_y(z)=diag(z,1). Its completed orbit is R_G=W(k), a_G=(3), and c=id, so the non-scalar invariant E₁₁ is horizontal. In contrast E₂₁ is not an invariant tensor: diag(2,1)E₂₁diag(1/2,1)=(1/2)E₂₁≠E₂₁, so the definition's invariant-tensor input excludes it.” Keep the ambient first-order negative control.

   **Repair test:** The new positive instance is an actual good torus local-model datum with both transported tensors E₁₁. The excluded input has multiplier 1/2, unequal to 1 also after reduction to 𝔽₃. This adds a non-scalar test with a checked input hypothesis.

6. **F06** (P3) Two definition Checks only repeat general laws

   **Location:** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:198` and `:726`, “[x+y]_log=[x]_log+[y]_log” and “A proof at one x does not establish the quantified all-points predicate”.

   **Claim:** These are the third discriminating Checks for logarithmic coordinates and very-goodness.

   **Witness:** The former repeats the additive splitting law without an instance; the latter is a statement about quantifiers valid for every predicate, including an incorrect definition of very-goodness.

   **Exact repair text:** Replace §0.4's third Check by: “For p=3 and B=𝔽₃[x,y]/(x³,y³), use the nilpotent divided powers on (x,y) with γ_n(x)=γ_n(y)=0 for n≥3. Logarithmic addition gives [x+y]_log=[x]_log+[y]_log. Teichmüller addition has first Witt carry −x²y−xy²≠0, whereas [x+y]_Teich has first carry zero; a Teichmüller splitting therefore fails.” Replace §2.10's third Check by: “For the diagonal torus on ℤ₃² with μ_y=diag(z,1), c=id fixes E₁₁. Under the basis-swap w, the marking, cocharacter and tensor become w, diag(1,z) and E₂₂, and c=id fixes E₂₂. Keeping E₁₁ while transporting the marking fails, since wE₁₁w⁻¹=E₂₂≠E₁₁.” Keep the all-points warning as prose outside Checks.

   **Repair test:** In the first ring x²y and xy² are distinct nonzero basis monomials, so the carry is nonzero. In the second example E₁₁ and E₂₂ have different images on e₁. Both tests distinguish the proposed incorrect construction.

## Verified sound

Read all 1,613 README lines and all 60 Suggested.lean lines, the repository rules, plan gaps, manifest, cited supplier sections and relevant repair reports. There are **92 numbered targets**, **45 Checks blocks containing 141 bullets**, **21 documented headline groups**, and **zero Lean declarations**. The README has no additional bold target labels. All targets and Check bullets were inspected; the computed ledgers below record the tests and their limits. R05–R06 identify three deficient Check bullets rather than counting them as successful discriminatory tests.

Located **167 distinct numbered source-line anchors across 12 extracted works**, plus the scanned RG71 theorem, for **168 locator checks across 13 readable works**. The anchor count includes endpoints of cited ranges, not 168 independent theorem proofs. R04 records the printed-page mismatch. RZ96 remains the one settled uncertified work. Source numbering was checked against the versions named in the README, including the KZ25 and Zhou20 preprints. The RG71 extraction has page markers but no usable theorem text; its cached scan, printed p.27, was inspected directly.

Checked citations to **14 named supplier roadmaps**, including the scope-only PELModuli and LubinTateFormalModulesAndQuasiCanonicalLifts boundaries. Checked **14 declared gap slugs** against both the plan and README. The two resolver leads concerning Crystalline.fontaineEnvelope_initial and Crystalline.fontaineEnvelope_periodPDEnvelope are genuine planned targets of DerivedDeRhamCohomology §PD.7, not claims of pinned declarations. No missing-name finding follows from those leads. R02 concerns an actual hypothesis mismatch, and R03 concerns minimality of an otherwise declared contract. The other declared gaps are accepted conditionally as supplied contracts, not reported merely because their suppliers have not yet implemented them.

The pinned isocrystal class supplies a module and a Frobenius-semilinear equivalence but no finite-dimensionality hypothesis (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`). The pinned divided-power scalar law includes ideal membership (`Mathlib/RingTheory/DividedPowers/Basic.lean:86`). Witt Frobenius, perfect-ring Frobenius equivalence and additive Verschiebung were read at their named pinned files. Object searches in Mathlib and Tau Ceti found no native complete-local display, p-divisible-group/crystal comparison, parahoric tensor local model, or adapted-deformation carrier sufficient to state the documented headlines. No statable headline was identified as omitted. No matrix or scalar replacement theorem is called for.

The file contains one import, one module docstring and the prescribed namespace. There is no declaration to probe by one tactic, no sorry'd data, no lost section instance, no name collision, and no padding. Accordingly no Lean command or scratch elaboration was run: the requested declaration-signature inventory is empty. The previously settled empty-file finding is not re-raised.

The source checks and explicit computations confirm the factors p and φ₁ in the tilde matrix, the dual-Tate twist −1, the inverse Hodge label, the difference between m²+p and m²+π_E, the normalized Eisenstein multiplier E/(E(0)/p), the inverse different in lattice duality, and the right quasi-isogeny composition law. They also confirm that nonordinary Levi-filtration existence is a hypothesis, not an ordinary-lifting consequence.

### Supplier and ownership ledger

Supplier versions were resolved by the roadmap tooling; the explicitly supplied sibling folders were searched at their specified heads. Search results from revisions of existing roadmaps were not substituted for their main version.

| Supplier | Checked section or object | Outcome |
|---|---|---|
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.6–1.8, 1.22; 2.10–2.12, 2.27; 3.2–3.3; 4.1, 4.13, 4.16–4.21, 4.25 | Existing carriers and normalizations agree; R07.4.20's finite-Q_p restriction is covered by the declared realization gap. R07.2.27's bounded-functions hypotheses match the complete-local application. |
| AbelianSchemesAndArithmeticModuli | A4.CR.7.2, crystal, Hodge sequence, duality and marked PD deformations | Contravariant convention and Fil¹ rank agree. |
| CrystallineCohomology | CR.7.1 and CR.1 coefficient/site interfaces | General coefficient theory is imported, not rebuilt. |
| PELModuli | M2.15 | W(R) formal-group display direction differs from this package's Ŵ(R) all-p-divisible-group direction. |
| SchemeAndStackFoundations | 0.6, 1.15, 2.3, 4.1–4.4, 4.7–4.8, 4.12 | Hartogs, torsors, smooth lifting, deformation and formal-module inputs exist; local flattening/point detection/patching extensions are declared. R03 removes redundant ideal calculus. |
| ModularCurves | 0G relative Grassmannian construction | General chart/gluing/universal-property construction is explicitly owned there. |
| DerivedDeRhamCohomology | PD.7, both named Fontaine-envelope targets | Both names and the small/full PD-ideal distinction exist in the supplier. |
| PadicPeriodRings | 3, 4.1, 4.3 | Absolute envelope, Frobenius, filtration and constants exist; relative-cover constants remain the declared extension. |
| ReductiveGroupsPartII | RG2.1.5, 2.2.4, 2.3.3, 2.3.5, 2.3.7, 2.4.3 | Lattice ownership retained. Supplier t^λ has κ=−λ; package adapter t_here^λ=t_RG^(−λ) correctly gives κ=λ. Full-fixer and purity extensions are declared. |
| GeometricSatakeAndFusion | GS0 Witt affine flags/components and bounded admissible loci | v-sheaf versus scheme ownership is separated; four geometric extensions are declared. |
| VectorBundlesAndIsocrystals | VB0 finite isocrystals; VB4 integral group torsors and Frobenius | VB4 explicitly constructs the integral exact tensor–torsor dictionary on schemes; no field-only substitute is being used. |
| PadicHodgeTheory | 5.5 | G-isocrystal and general-perfect-residue admissibility inputs exist; the period-torsor theorem has the narrower range in R02. |
| ShimuraVarieties | 7.0i | Rational Hodge tensors exist; the absolute-Hodge p-adic comparison extension is explicitly declared, without consuming this package's integral model. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | LT.0–LT.6 scope boundary | Formal-module and quasi-canonical directions are excluded from this package. |

Object searches covered the active/completed main trees, board packages and **55 supplied sibling heads**, using both the roadmap grep tool and local searches. No duplicate own fully qualified Lean name is possible because this file declares none. AdmissiblePairsAndPadicHodgeStructures §1.3 (`TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:412`) also discusses the reductive σ-centralizer and imports BunGAndNewtonStrata. Both occur later: merge-order positions 245 and 240, versus this roadmap's 150. Under the stipulated direction-of-supply rule, the needed reductive σ-centralizer is owned here in §2.0, after R01, and later roadmaps must import it. This records the downward ownership move; it is not an instruction to add an upward supplier. AdmissiblePairs' extension beyond reductive G remains distinct.

No internal forward reference was found in the per-target Needs scan. The required dependency command returned:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

It emitted no UPWARD or CYCLE line. The read-only diff against origin/main lists nine changed files, all under this package, with 2,944 insertions and 65 deletions. No process identifiers, computational algorithm target, forbidden import, `lemma` declaration or `set_option` was found in the two deliverables.

### Headline acceptance-test inventory

All rows are documented in the module docstring and are not statable on the pinned carriers without constructing the missing theory. Simple scalar or matrix identities from their proofs are not substitutes.

| README targets | Headline group | Missing carrier at the pins |
|---|---|---|
| 0.2 | Perfect-ring Dieudonné anti-equivalence | p-divisible groups and their integral Dieudonné functor |
| 0.13 | Complete-local display anti-equivalence | Ŵ frames, displays and crystalline evaluations |
| 1.8 | Universal marked display | Marked display deformations and formal Grassmannian completion |
| 2.4, 2.6 | Integral filtration and tilde tensor torsors | Tensor local models and integral display torsors |
| 3.7, 3.9 | Curve and arithmetic-curve criteria | Very-good embeddings and their canonical first-order comparison |
| 3.13 | Nonexceptional very-good existence | Parahoric lattice-chain local-model embeddings |
| 3.14, 3.17 | Dᴴ PEL and central-enlargement existence | Integral fixer representations with tensor displays |
| 3.11, 3.15 | Wild type-A and symplectic enlargement | Division-algebra lattice chains with tensor local models |
| 4.4, 4.14 | Integral comparison and étale recognition | Crystalline Galois lattices, p-divisible Tate modules and integral tensor types |
| 4.12 | Versal adapted deformation theorem | Marked p-divisible deformations and local-model quotient |
| 4.13 | Universal marked parahoric display | Parahoric display deformation category |
| 5.1 | Hyperspecial Breuil–Kisin tensor frames | Crystalline-lattice functor and integral tensor-isomorphism torsor |
| 5.7 | Explicit adapted lifts | Height-one Breuil–Kisin realization and integral comparison |
| 5.8 | Frobenius-pullback integral connection | Smooth-base Dieudonné crystals and connection lattices |
| 5.3 | Toral admissibility | Filtered tensor G-isocrystals and Newton cocharacters |
| 5.11–5.12 | Horizontal/adapted equality and smooth quotient | Universal crystalline connection and its formal loci |
| 5.16, 5.18 | Lattice specialization and Kottwitz equality | Integral Breuil–Kisin family and reductive Grassmannian component maps |
| 5.17 | Isogenous realization of admissible filtration | Crystalline tensor filtration and p-divisible realization |
| 6.0 | Ordinary integral σ-conjugacy | Parahoric group schemes, affine Weyl action and ordinary classes |
| 6.4–6.5 | Ordinary lift and rational centralizer action | Central Levi modification and p-divisible isogeny category |
| 6.6 | Lift with specified nonordinary Levi filtration | Compatible Levi local models and marked adapted deformations |

### Declaration and target computations

All 92 numbered targets are included; the README has no separate bold target titles. These are falsification tests, not proofs of the general theorems. Context: p>2; perfect k in Layers 0–1, algebraically closed k in Layers 2–4 and 6, the stated perfect/finite/separably closed alternatives in Layer 5. Numerical ranks assume a nonzero ring. Zero frames have only the zero module. In the table p=3 unless another value is specified, W=W(k), S=W[[u]], ε²=0, and Eᵢⱼ are matrix units. Characteristic-2 instances are outside the explicit scope. Equal-characteristic coefficient fields are allowed only at the special-fibre/perfect-ring stage. Noncommutative coefficient rings are never admitted. Nonabelian matrix composition is tested in §6.5.

| Target | Context and instances | Computed values on the two sides / negative control | Result and change |
|---|---|---|---|
| 0.1 | Complete local R; R=k and R=k[ε] | Kernel for R=k is 0, hence Ŵ(k)=W(k); finitely supported ε-coordinates tend to 0, constant nonzero ε-coordinates do not | Consistent; no change |
| 0.2 | Perfect rings, finite projective modules; R=k×k, ranks (0,1) | F=(0,1), V=(0,p) give FV=VF=(0,p)=p·id; over the zero ring both sides are 0 | Consistent; ranks need not be globally constant |
| 0.3 | p-frame; I=pS | φ(pu)=p uᵖ and pφ₁(pu)=p uᵖ; replacing φ₁ by a·φ₁, a≠1, changes the second expression | Strictness excludes the wrong multiplier |
| 0.4 | PD kernel b=(ε), split relative frame | log(ε)+log(ε)=log(2ε); the stipulated extension of φ₁ sends both sides to 0 | Consistent coordinates; generic Check needs R06 |
| 0.5 | Perfect R; rank-one height-one objects | (F,V)=(1,p) and (p,1) both give FV=p; F=p² has pM⊄F(M) | Both boundary slopes allowed; height two excluded |
| 0.6 | Normal pair of type (h,d) | d=0 gives M₁=IM; d=h gives M₁=M; h=2,d=1 requires lower-left entry in I, so E₂₁ fails when 1∉I | Consistent |
| 0.7 | Relative PD surjection B→R | B=R gives the absolute frame; a split ε-kernel is sent to 0 by extended φ₁, agreeing with the residue map | PD hypothesis retained |
| 0.8 | Normal decomposition; W, I=pW | B=1 maps to p and C=p maps to 1; product of upper-1 and lower-p unipotents maps to [[1+p,p],[1,1]], as does their mapped product | Matrix factors and functoriality agree |
| 0.9 | Strict, possibly nonflat base change | Identity sends the entries (p,1) to (p,1); reduction of a dual-number coefficient sends ε to 0 on both constructions | No flatness smuggled into strict base change |
| 0.10 | j:tilde→φ* M | h=2,d=1 gives diag(1,p); d=0 gives p·id, d=h gives id; rationalization makes both diagonal entries units | Correct direction; integral j need not be onto |
| 0.11 | Contravariant display | Étale line has (M₁,F)=(pM,1), multiplicative line (M,p); their sum has Fil¹ rank 1 and quotient rank 1 | Normalization agrees with group dimensions |
| 0.12 | Strict display base change | Constant étale Ψ=1 remains 1 through R/m³→R/m²→k; direct and composite base changes both give Ψ=1 | Consistent including square-zero quotient |
| 0.13 | Complete local R, p>2 | Étale/multiplicative objects give (F,V)=(1,p)/(p,1); duality and twist exchange the two, as does Cartier duality | Variance and endpoint objects agree |
| 1.1 | Marked filtration rank d in h | (h,d)=(1,0),(1,1),(2,1),(3,1) give parameter counts 0,0,1,2, equal to d(h−d) | Checks distinguish submodule from quotient rank |
| 1.2 | Enlarged PD ideal | Identical ideals give identity; a split logarithmic ε-direction is killed by φ₁, so enlarging in one step or two gives 0 there | Consistent |
| 1.3 | Canonical comparison on m/(m²+p) | In the displayed nilpotent coordinate c=1+εE₂₁ and c⁻¹=1−εE₂₁; product is 1, and ε=0 gives identity | No uniqueness inferred merely from rational j |
| 1.4 | Rational Witt section, constant rank-one display | For A=W and constant display, section of 1 is 1; both reduction and composite section/reduction give 1 | Convergence additionally checked against KPZ26 lines 3790–3813 |
| 1.5 | Constancy relative to a marking | Ψ=Ψ₀(1−εE₂₁), c=1+εE₂₁ gives Ψc=Ψ₀; if p=unit·π², first quotient is O/(π²), reflex quotient is k | Two different first-order quotients retained |
| 1.6 | Tensor transport along rational section | For identity tensor, c·1·c⁻¹=1; for a constant diagonal projector and diagonal c, cE₁₁c⁻¹=E₁₁ | Dual factors use inverse dual |
| 1.7 | Locally PD-nilpotent thickening | Over k[ε], rank-two rank-one filtration lifts are graph(εa), a∈k, on both deformation descriptions; rank-one full filtration has one lift | Consistent; no arbitrary thickening substituted |
| 1.8 | Rigid marked universal display | h=2,d=1 gives O[[t]] and tangent k on each side; h=1,d=0 gives O and zero tangent | Universality has the expected dimensions |
| 2.0 | G/K₀ as written; conjugated split torus | Upper entries of g and entrywise σ(g) are −a and −σ(a), with a≠σ(a); σ(g)∉G | Fails to define σ; R01 |
| 2.1 | Integral mixed tensors on every algebra | Empty tensors fix GL₂; E₁₁ fixes the diagonal subgroup; (1+εE₂₁)E₁₁(1−εE₂₁)=E₁₁+εE₂₁ | Nonreduced points distinguish schematic fixers |
| 2.2 | Height-one filtration lattice | Zero filtration gives EM; full filtration gives M; split line gives Se₁+ESe₂ with quotient O_K e₂ | All three ranks agree |
| 2.3 | Completed local-model orbit | GL₂ at a line gives O[[t]], one tangent direction; diagonal torus at the same marked eigenline gives O, zero directions | Completion is local, not the whole flag variety |
| 2.4 | Integral tensors on filtration lattice | For diagonal torus, F=Se₁+ESe₂; E₁₁ acts integrally and the basis (e₁,Ee₂) is a tensor frame | Positive rank-two torsor example |
| 2.5 | Breuil–Kisin/tilde comparison | Full rank-one filtration maps to the unscaled Witt line; zero filtration maps through a p-scaled line since φ(E)=p·unit | Scaling matches §0.10 |
| 2.6 | Normal complete local base and local DVR tests | p/p=1 integral; 1/p not integral; x/p at x=π, π²=p has valuation −1 | Boundedness detects denominator; local-map hypothesis matters |
| 2.7 | First-order tensors | c·id·c⁻¹=id; cE₁₁c⁻¹=E₁₁+εE₂₁ for c=1+εE₂₁, so a projector can fail | Algebraic diagnostic correct; duplicate Check R05 |
| 2.8 | Parahoric display with integral torsor | Empty tensors recover ordinary (h,d)-display; E₁₁ forces Ψ diagonal, whereas Ψ=1+εE₂₁ changes E₁₁ by εE₂₁ | Rational vanishing of ε is not an integral test |
| 2.9 | Adapted group lift | Empty GL tensors impose just the chosen Hodge rank; multiplicative rank one has Fil¹=M and étale rank one has Fil¹=0 | Fixed integral tensor type is essential |
| 2.10 | Very-good datum at the marked point | Constant diagonal torus has c=1 and E₁₁ fixed; arbitrary 1+εE₂₁ moves E₁₁ by εE₂₁ | Canonical c, not arbitrary smooth lift; Check repair R06 |
| 2.11 | Two defining tensor families | Diagonal c fixing E₁₁ fixes E₂₂=1−E₁₁ as well; identity tensor alone fixes all GL₂ and cannot define the torus | Same schematic fixer retained |
| 2.12 | Unramified coefficient extension | k→k₂ is injective, so ε remains nonzero; Teichmüller a satisfies σ[a]=[aᵖ]≠[a] for a∉k | Faithful descent works; σ cannot be dropped |
| 2.13 | Periodic lattice-chain representation | Segment length 1 gives Λ; replacing Λ by pΛ identifies bases e↦pe, preserving stabilizer; length 0 has no faithful carrier for nontrivial G | Nonempty segment required |
| 3.1 | Curve over k[[u]] | F=S(e₁+ue₂)+pSe₂ has rank 2 and filtration rank 1; u/p in W(k((u)))[1/p] has p-valuation −1 and is outside the integral intersection | Intersection argument has a negative control |
| 3.2 | Invariant endomorphism | Scalar endomorphism commutes with c, commutator 0; E₁₁ commutator with 1+εE₂₁ equals −εE₂₁ | Invariance hypothesis distinguishes the cases |
| 3.3 | Formal curve and first jet | u↦ε maps u² to 0; identity tensor discrepancy is 0 before and after reduction | Curves give genuine first jets |
| 3.4 | Product representations | Two one-dimensional diagonal factors have c=diag(1,1); projectors remain E₁₁,E₂₂; rank-zero factor contributes no tensors | Product and direct-sum bookkeeping agree |
| 3.5 | Smooth neutral closure, p odd | For hyperbolic rank two, XᵗJ+JX=aJ forces off-diagonal X entries 0; reflection lies in the other component and is not identity modulo ε | Neutral and full fixer distinguished |
| 3.6 | Very-good direct summand | Block-diagonal c=diag(c₁,c₂) restricts to c₁ on the first block; zero summand has rank 0 and cannot faithfully realize nontrivial G | Faithfulness hypothesis retained |
| 3.7 | Curve-spanned tangents | At xy=0, tangent space k² is spanned by (1,0),(0,1); a curve with first jet (1,1) gives xy=u²+…≠0 | Spanning does not mean every vector is one curve |
| 3.8 | Endomorphism centralizer | Centralizer of E₁₁ consists of diag(a,d); [E₁₁,εE₂₁]=−εE₂₁≠0 | Scheme-level centralizer includes nilpotent tests |
| 3.9 | Arithmetic curve with ramification | For π_E=π_K², relative tangent m_K/(m_K²+π_E)=k; unramified identity extension gives 0 | Ramified arithmetic curves can detect missing directions |
| 3.10 | Repeated isomorphic summands | Kernel of diagonal GL₁ on n copies is 1 for n=1,2 but GL₁ for n=0; commuting with the inter-copy E₂₁ forces the two scalars equal | Copy-intertwining tensors exclude independent scalars |
| 3.11 | Standard type-A representation | D=K,m=1 gives G_m and a rank-one lattice; its tensor frame is 1; m=0 has zero carrier and is excluded | Wild index is not removed by an artificial prime bound |
| 3.12 | Determining segments | Repetition doubles dimension rh→2rh; transition and projection identities still read p·id and id | Same periodic chain determines the same fixer |
| 3.13 | Nonexceptional very-good cases | GL₂ hyperspecial μ=(1,0) has flag P¹, tangent dimension 1; torus has a point, dimension 0 | Exceptional division index p remains outside this theorem but inside §3.11 |
| 3.14 | Dᴴ PEL tensors | For i²=−1,j²=3, the tested balanced trace values are −2 on both sides; split alternating basis has pairings 1 and −1 | Side of module action and alternating sign matter |
| 3.15 | Paired type-A enlargement | ψ((0,f),(v,0))=−f(v), reverse=f(v); (p⁻ⁱZ_p)∨=pⁱZ_p; diag(1,diag(1,2)) has two cross multipliers, 1 and 2 | Dual index reversal required; independent second GL action excluded |
| 3.16 | Tame descent with different | π²=p, δ=2π, M=πO_L e+O_L f: M^Γ=pZ_p e+Z_p f; its dual=Z_p e+p⁻¹Z_p f=(δ⁻¹M#)^Γ | Omitting inverse different gives the wrong dual |
| 3.17 | Central enlargement over D | Two scalar factors (a,b) multiply the cross pairing by ab; left D action commutes with right D action, whereas two noncentral right actions need not commute | Central second factor and specified action side retained |
| 4.1 | Punctured spectrum of W[[u]] | (p,u) restricts to O on D(p)∪D(u), while globally (p,u)≠S | Codimension-two support explains why punctured exactness is weaker |
| 4.2 | Crystalline Galois image | Cyclotomic image lies in Z_p×, so κ=v_p=0; p∈Q_p× has κ=1 and is not such a unit image | Kottwitz sign correct |
| 4.3 | Tensor frames, algebraically closed residue | Constant diagonal torus over S has frame 1 and trivial torsor; its extension to the full split fixer is still trivial | No general perfect-residue vanishing inferred |
| 4.4 | Integral comparison on dual Tate module | μ_{p∞} gives L=Z_p(−1), crystalline F=p; étale line gives L=Z_p,F=1 | Dual-Tate convention agrees on both lines |
| 4.5 | Filtration cocharacter | Ordinary Fil¹=ke₁ is induced by diag(z,1); permuting basis gives ke₂, not the fixed torus-marked line | Marked integral type prevents wrong filtration |
| 4.6 | First-order rigid section | c=1+εE₂₁, Ψ=Ψ₀c⁻¹ gives Ψc=Ψ₀; multiplying a lift by 1+pX leaves the mod-p first jet unchanged | Existence does not imply a unique global lift |
| 4.7 | Hoff compatibility | Constant torus has both canonical tensor transports E₁₁; off-diagonal diagnostic gives E₁₁ versus E₁₁+εE₂₁ | Compatibility is the actual extra condition |
| 4.8 | Marked DVR tangent lifting | Ordinary (h,d)=(2,1) has tangent O_K on both sides; rank-one étale case has 0 on both sides | Matching ranks, including boundary case |
| 4.9 | Interpolation with equal residue | f(T)=a+(b−a)T/π has f(0)=a,f(π)=b when a≡b mod π; (a,b)=(0,1) requires nonintegral 1/π | Equal-residue condition is necessary |
| 4.10 | Four infinitesimal criteria | GL₂ ordinary tangent dimension 1; projector torus dimension 0; ε↦pⁿε is injective over O_K but zero over k | Integral torsion-freeness cannot be omitted |
| 4.11 | Local-model quotient | Ambient O[[t]], torus quotient t=0: tensor-adapted point has t-value 0, exactly the factorization condition; ∩(Tⁿ)=0 | Point argument consistent; R03 improves supplier ownership |
| 4.12 | Versal adapted quotient, very good | GL datum: all local maps factor through the full ambient ring; projector torus: precisely t=0 maps factor through O[[t]]/(t) | Both directions tested |
| 4.13 | Arbitrary complete local deformation base | Every O_K-point kills ε in k[ε], but O[[t]]→k[ε], t↦ε, preserves the nonzero deformation before reduction | Reduced lifting step is essential; R03 |
| 4.14 | Fixed integral étale tensor type | Constant projector has the same matrix E₁₁ in étale and crystalline bases and forces t=0; a merely rational projector can have denominators in another lattice | Recognition uses integral type, not rational existence |
| 5.1 | Perfect/finite/separably closed residue alternatives | Rank-one split G_m has standard frame 1 over S; finite/separably closed cases give H¹=0 in the stated connected case | No arbitrary-perfect-field triviality asserted |
| 5.2 | Relative normal-cover period ring | x=[p♭]−p has θx=0, but θφx=pᵖ−p≠0; φ(t)=pt and Fil¹ excludes p | φ is not forced to preserve ker θ |
| 5.3 | Toral Newton-average condition | Ordinary two lines have (t_H,t_N)=(1,1),(0,0); giving slope-zero line jump 1 yields 1>0 and fails weak admissibility | Numerical hypothesis is needed; RZ96 text uncertified |
| 5.4 | Hyperspecial adapted lift | Multiplicative and étale lines have (Fil¹,F)=(M,p),(0,1); identity mixed tensor has filtration degree 0 | Integral PD tensor convention consistent |
| 5.5 | Relative p-divisible comparison | Étale rank one comparison is 1; multiplicative comparison contains t, with θ(t)=0, so t is not an integral unit; sum is diag(t,1) | Isomorphism only after appropriate inversion |
| 5.6 | Hyperspecial Frobenius double coset | b=diag(p,1), μ₀(z)=diag(z⁻¹,1), υ₀=diag(z,1); p^υ₀=diag(p,1)=b | Inverse Hodge convention agrees |
| 5.7 | Eisenstein normalization | E=u−p, E(0)=−p: normalized multiplier −E specializes to p; E(0)=ap gives E/a specializing to p, while unnormalized E specializes to ap | Unit normalization cannot be omitted |
| 5.8 | Integral connection after iterated Frobenius | Constant g has dg=0, so connection is already integral for n=0; a denominator pʳ is canceled by a pⁿ derivative factor when n≥r | Constant boundary and denominator mechanism agree |
| 5.9 | Fixed Hodge framing | b=1 has kernel mod p equal 0; b=p has whole line; diag(p,1) gives ke₁, while swapping basis gives ke₂ | Framing retains the actual Hodge line |
| 5.10 | Horizontal Fil⁰ locus | N=−Σ t^(pʳ−1)E₂₁ has N(0)=−E₂₁; h=Σ t^(pʳ)/pʳ generates (t) in the generic completed power-series ring | Ambient horizontality need not hold off the locus |
| 5.11 | Horizontal versus adapted locus | Projector example has adapted ideal (t), and horizontal ideal (h)=(t); ambient [N(0),E₁₁]=−E₂₁≠0 | Equality is on the quotient, not ambient horizontality |
| 5.12 | Smooth hyperspecial quotient | GL₂ ordinary quotient has relative dimension 1; projector torus quotient has dimension 0; zero object gives 0 | Boundary dimensions agree |
| 5.13 | Étale tensors in connected universal family | A constant integral projector has coefficient 1 everywhere; on a disconnected union coefficients 1 and p⁻¹ show why one integral fibre alone cannot control the other component | Connected universal base retained |
| 5.14 | Hyperspecial recognition | Multiplicative dual Tate line is Z_p(−1), matching jump 1 and F=p; same rational line with lattice p⁻¹L has a different marked integral type | Integral marking retained |
| 5.15 | Supplied geometric family and Hodge tensor | For an actual product abelian family, factor projector is E₁₁ in its étale, de Rham and crystalline realizations; polarization retains its Tate twist | No existence of a global integral model inferred |
| 5.16 | Lattice specialization | g=p sends L to pL and T_p to p⁻¹T_p; crystal component v_p(p)=1; g=1 gives 0 on both component maps | Sign and variance consistent |
| 5.17 | Perfect-residue admissible realization | k=F₃,K=Q₃ and two jump-one lines have identical underlying Q₃ functors, but do not satisfy K/Q̆₃ finite | Supplier range missing: R02 |
| 5.18 | Hodge bound and Kottwitz | G_m,b=p,g=p: g⁻¹bσ(g)=p, so Hodge value stays 1 while lattice κ(g)=1; g=1 has κ(g)=0 | Both identities keep their distinct variables |
| 5.19 | Quotient map with central image | Identity on G_m sends pW to pW; determinant on GL₂ sends diag(p,1) to p with valuation 1 | Specialization and quotient agree |
| 6.0 | Ordinary σ-straight normalization | GL₂ t^(1,0) has ℓ=1 and nth power ℓ=n; Newton=(1,0); G_m has ℓ=0 and ν=1; slope (1/2,1/2) is not ordinary for this μ | Ordinary hypothesis separates supersingular case |
| 6.1 | Ordinary integral datum | b=diag(p,1) gives D₁=We₁+pWe₂ and Fil¹=ke₁; slopes both 1/2 do not give the ordinary Newton Levi decomposition | Correct frame normalization |
| 6.2 | Central Levi filtration | In diagonal Levi, diag(z,1) is central and fixes Fil¹=ke₁; arbitrary GL₂ off-diagonal endomorphism E₂₁ does not preserve this line | Centrality is precisely what the lift uses |
| 6.3 | Central height-one modification | F=Se₁+ESe₂ has quotient O_K e₂; for E=u−p the normalized Frobenius diag(−E,1) reduces to diag(p,1) | Rank and specialization agree |
| 6.4 | Ordinary adapted lift | μ_{p∞}⊕Q_p/Z_p lifts as the same product over O_K and has the prescribed filtration; zero group has its unique zero lift | Existence covers ordinary endpoint and rank zero |
| 6.5 | Rational σ-centralizer right action | On two étale lines, (gh)ᵗ=[[2,1],[1,1]] while (hg)ᵗ=[[1,1],[1,2]]; p⁻¹ is a quasi-isogeny, not an integral automorphism | Composition order and rational domain correct after R01 |
| 6.6 | Specified Levi filtration | Diagonal Levi inside GL₂ with Fil¹=ke₁ gives the same product lift under extension of structure group; the opposite line gives a different marked filtration | Specified filtration cannot be inferred from Levi membership alone |

### Lean declaration inventory

| File region | Section variables / instances | Declarations and values | Conclusion |
|---|---|---|---|
| Suggested.lean lines 1–60 | No variable or instance block; one namespace | 0 definitions, 0 structures, 0 instances, 0 axioms, 0 theorems, 0 examples; import Mathlib only | No signature can lose a binder; no padding or sorry'd data. No Lean command run. |

### README Check ledger

The entries follow the bullets in each Checks block. Counts include multi-case bullets once. Values below supplement the 92-target table; they do not assert that an ambient matrix example is an actual local-model datum.

| Section | Bullets | Computation / discriminatory outcome in bullet order |
|---|---:|---|
| 0.1 | 3 | R=k: kernel 0 and I=pW; constant ε sequence does not tend to 0 while finite support does; a unital k→W(k) would give 0=p≠0. |
| 0.3 | 3 | φ₁(V1)=1; φ₁(pu)=uᵖ≠puᵖ; multiplier 2 gives 2 instead of 1. |
| 0.4 | 3 | b=0 leaves I; logarithmic ε maps to 0; generic additive law is restated, R06 supplies the nonzero carry −x²y−xy². |
| 0.5 | 3 | (F,V)=(p,1) and (1,p) both multiply to p; zero object gives 0, disconnected example ranks (0,1). |
| 0.6 | 3 | d=0: IM; d=h: M; E₂₁ sends e₁ outside Se₁+Ie₂ since 1∉I. |
| 0.7 | 3 | B=R gives I_B; ε direction gives φ₁=0; B=F₃[x]/x⁴ with kernel (x) admits no PD structure since x³≠0=3!γ₃(x). |
| 0.8 | 3 | Upper 1 maps to p; lower Vε maps to ε; scalar reduction of j=diag(1,p) has kernel ke₂ while tilde remains k². |
| 0.10 | 3 | j=p at d=0; j=1 at d=h; p:k→k is 0 while source dimension is 1, and φ₁(p)=1 prevents a strict descent. |
| 0.11 | 3 | Étale F=1,M₁=pM; multiplicative F=p,M₁=M; ordinary product has (height,Fil¹ rank)=(2,1). |
| 0.12 | 3 | Identity fixes Ψ=1; constant rank-one module over R/m² is free rank 1; both reduction paths give Ψ=1. |
| 1.1 | 3 | Parameter counts 0 at (1,0),(1,1); count 1 at (2,1); (3,1) has dimension 1 and quotient rank 2. |
| 1.2 | 3 | I=I′ gives id; ε-logarithmic direction is 0 after enlarged-frame φ₁; a two-step enlargement and direct enlargement both send it to 0. |
| 1.3 | 3 | Constant c=1; graph Vε gives lower entry ε≠0; diag(1,0)(1+εE₂₁)=diag(1,0), so the square also accepts a wrong lower entry. |
| 1.4 | 3 | Constant section sends 1 to 1; p⁻¹∉Ŵ(A) although p⁻¹∈Ŵ(A)[1/p]; an ordinary nonconstant filtration graph(e₁+a e₂), a≠0, differs from the residual line after evaluation. |
| 1.5 | 3 | (1−εE₂₁)(1+εE₂₁)=1; O/(π²) versus O/(π)=k; ε↦0 gives Ψ₀·1=Ψ₀. |
| 2.0 | 3 | G_m fixed points Q_p× contain p⁻¹; off-diagonal valuation equation v=p-shift forces zero; trivial group has one element. R01 repairs the general input. |
| 2.1 | 4 | Empty stabilizer GL₂; E₁₁ centralizer diagonal even on dual numbers; full O₂ has two components whereas SO₂ has one; scalar 2 gives 2·(1/2)=1 on a dual tensor but 2·2=4 under the wrong rule. |
| 2.2 | 3 | F=EM; F=M; S²/(Se₁+ESe₂)=O_K, whereas replacing E by p gives k[[u]]. |
| 2.3 | 3 | GL₂ yields O_Ĕ[[t]] and graph(e₁+te₂); torus quotient t=0 rejects t↦π≠0; ramified π_E survives O_Ĕ and is absent from W(k) as a uniformizer of valuation 1. |
| 2.6 | 3 | p/p=1 versus 1/p∉O_K; x/p at π²=p has valuation −1 versus 1 of norm 1; GL_h flattening ideal 0, while Z_p→Q_p sends the closed point to no point. |
| 2.7 | 3 | Identity gives id=id; E₁₁ gives E₁₁+εE₂₁≠E₁₁; third bullet repeats first via End≅Λ⊗Λ∨, R05. |
| 2.8 | 3 | GL gives the ordinary pair of ranks h,d; on a square-zero p-killed Witt direction, rationalization kills ε and cannot distinguish 1 from 1+εE₂₁; commuting with E₁₁ forces off-diagonal entries 0. |
| 2.9 | 3 | Empty family imposes only Hodge ranks; an incorrect lattice tensor with coefficient p⁻¹ lacks the required integral frame; multiplicative Fil¹ has rank 1, inverse label has weight −1. |
| 2.10 | 3 | Empty family makes all equations empty; E₁₁ versus E₁₁+εE₂₁ detects the wrong isomorphism; third bullet has no value or geometric instance, R06. |
| 2.13 | 3 | One term gives Λ; e↦pe is a basis isomorphism Λ→pΛ; paired terms p⁻ⁱW² dualize to pⁱW², reversing i. |
| 3.10 | 3 | n=0 has kernel G_m; n=1,2 have kernel 1 and inter-copy commutation gives a=b; 2≠1/2 in Z₃ excludes opposite weights. |
| 3.14 | 3 | Balanced quaternion traces −2=−2, wrong reversal gives 2≠−2 in Q₃; split pairings 1 and −1; multiplicity zero gives nonfaithful zero representation. |
| 3.15 | 3 | Cross pairings −1 and 1; same-index pairs W² and p⁻¹We⊕pWf are incomparable, inverse-index pairs are nested; diag(1,2) produces multipliers 1 and 2. |
| 3.16 | 3 | δ=1 fixes standard dual W²; quadratic example gives W e+p⁻¹W f on both corrected sides and W² without δ⁻¹; dual index is −i. |
| 3.17 | 3 | Scalar pair has multiplier ab, also when a≠b; a non-scalar SO transformation gives a nonscalar cross-pairing matrix; l(xd)=(lx)d, whereas x(dl−ld) can be nonzero. |
| 4.6 | 3 | cE₁₁c⁻¹−E₁₁=εE₂₁ prevents membership; empty-tensor choice Ψ=Ψ₀c⁻¹ works; 1 and 1+pX have the same first reduction. |
| 4.9 | 3 | Residual 1 and 2 differ in F₃, so cannot glue; equal endpoints use constant Ψ; (0,1) has residues 0≠1. |
| 4.13 | 3 | O_Ĕ[[t]]/(t)=O_Ĕ; t↦ε keeps ε≠0 while every map to a reduced DVR kills it; T^m∈(T^n) iff m≥n, hence intersection 0. |
| 5.2 | 6 | W(k) cover has p^(1/p), absent from W(k); closure isomorphism conjugates g to hgh⁻¹; k[ε] fails normal-domain input; φ(t)=pt; θφ([p♭]−p)=pᵖ−p≠0; θ(p)=p≠0 so p∈J but p∉Fil¹. |
| 5.4 | 3 | Empty tensors give all prescribed-type lifts; E⁻¹ has a pole at E=0 and is not integral; dual Tate of μ is Z_p(−1) with F=p, whereas untwisted Cartier-dual Tate has F=1. |
| 5.5 | 3 | Étale comparison 1; multiplicative comparison t, θ(t)=0 so nonunit; zero matrix 0→0 and ordinary diag(t,1). |
| 5.7 | 3 | Weight zero F=1, cokernel 0; weight one F=E/a, cokernel S/(E); residual E(0)=ap versus (E/a)(0)=p. |
| 5.9 | 3 | Kernels mod p of 1 and p are 0 and k; permutation changes ker diag(p,1)=ke₁ to ke₂. |
| 5.10 | 3 | h(0)=0; empty family has ideal 0; N(0)=−E₂₁, commutator −E₂₁, h=t+…, (h)=(t), and dt pulls back to 0 on t=0. |
| 5.13 | 3 | Reference tensor coefficient 1; disconnected example coefficients 1 and p⁻¹; dual Tate line of μ has Frobenius p, matching the crystal. |
| 5.16 | 3 | g=1 gives standard W lattice; g=p gives pW and κ=1; ghW=gW for h∈G(W). |
| 5.17 | 3 | Reference filtration permits g=1; g=p gives a lattice of nonzero index; unramified Frobenius r=[[0,p],[p⁻¹,0]] preserves L₀=pZ_p e₁+Z_p e₂ but sends L=Z_p² to pZ_p e₁+p⁻¹Z_p e₂≠L; r²=1 makes L stable after residue degree 2, while purely ramified extension leaves r. Supplier range: R02. |
| 6.0 | 4 | Adapted G_m representative p has (κ,ν)=(1,1), wrong p⁻¹ gives (−1,−1); GL₂ determinant valuation/length/Hodge rank all 1; Newton (1/2,1/2)≠(1,0); torus swap gives λ+σλ=(1,1), trivial group gives 0 and {1}. |
| 6.1 | 3 | D₁=We₁+pWe₂ gives ke₁; supersingular Newton (1/2,1/2) fails ordinary; O₂/SO₂ has two components so these models differ. |
| 6.3 | 4 | Slope zero F=1; slope one F=E/a; off-diagonal E₂₁ sends e₁ outside Se₁+ESe₂; c_E(0)=p versus E(0)=ap. |

### Declared-gap audit

All 14 slugs occur in both the plan's top-level gaps and the README supplier subsections, with a named earlier supplier. No supplier is `none`.

| Slug | Supplier | Precision/minimality and boundary test |
|---|---|---|
| perfect-residue-bt-realization | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.20 | Explicit perfect-residue extension; K=Frac W(F̄_p) is outside finite-Q_p R07.4.20 and inside the request. |
| relative-crystalline-constants | PadicPeriodRings 4.3 | Specifies normal cover, filtration and φ-fixed constants; Q_p is the claimed fixed field, not all K₀. Absolute field case is already imported. |
| tensor-isomorphism-flatness-descent | SchemeAndStackFoundations 4.12 | RG71 I.4.1.2 has the henselian/local/finite-type hypotheses used. Z_p→Q_p is not a pointed local closed-fibre test; its empty pullback cannot imply flatness at the original closed point. |
| formal-dvr-point-detection | SchemeAndStackFoundations 4.7–4.8 | Precise point range, but compound and partly supplied at the pins: R03. Nonreduced k[ε] shows why reducedness is retained. |
| punctured-disc-torsor-patching | SchemeAndStackFoundations 1.15 | Specifies overlap and completion. For f=u, D(p)∪D(u) is the punctured spectrum; requiring (p,f) primary excludes f=p, whose opens miss the height-one prime (p). |
| full-fixer-cutting-tensors | ReductiveGroupsPartII RG2.3.5 | Integral scheme-theoretic tensors and arbitrary faithful realization are explicit; E₁₁ over dual numbers detects a failure invisible at reduced points. |
| parahoric-disc-purity | ReductiveGroupsPartII RG2.3.3 | Source gives extension for arbitrary perfect residue; algebraically closed residue is needed separately for the trivialization used here. |
| full-fixer-component-reduction | ReductiveGroupsPartII RG2.3.3 | Finite étale component torsor and its triviality are explicit; trivial component class is 0, while a nonzero Γ-class does not supply a reduction. |
| ordinary-levi-full-fixer | ReductiveGroupsPartII RG2.3.3 | Ordinary normalization and connected ambient fixer are retained; diagonal ordinary GL₂ gives M(W)=W××W×, exactly M(K₀)∩GL₂(W). |
| scheme-local-model-representative | GeometricSatakeAndFusion GS0 | Scheme representation/normalization is separate from the existing v-sheaf target; source's p>2/classical/tameness hypotheses retained. |
| scheme-local-model-hodge-immersion | GeometricSatakeAndFusion GS0 | Repetition m≥1 and quasi-parahoric versus full-fixer cases retained; m=0 produces rank 0 and cannot be faithful for G_m. |
| schubert-curve-spanned-tangents | GeometricSatakeAndFusion GS0 | Prime-to-p fundamental group and absence of Dᴴ retained; source conclusion is spanning, not lifting every vector as a single curve. |
| local-model-curve-spanned-tangents | GeometricSatakeAndFusion GS0 | Minimal-stratum versus all-points cases distinguished; no unrestricted tangent theorem requested. |
| integral-hodge-realization-extension | ShimuraVarieties 7.0i | Despite its slug, the needs sentence asks only rational comparison for a given abelian scheme. Factor projector gives E₁₁ in both realizations; no integral-model existence is an input. |

## Not verifiable

- RZ96 Proposition 1.21 is the settled uncertified, locator-only reference. Its text was not requested again. The use in §5.3 was checked against the accessible Kisin17 proof at line 1455; this does not certify the unread proposition's entire wording.
- No Lean elaboration was run, as required by the read-only brief. There are zero declarations, so there is no elaborated signature to compare or binder-loss test to execute.
- Ownership against additional open roadmaps without supplied files was not independently checked. The roadmap index search was used as a lead; the detailed sibling comparison covers the 55 supplied heads. No claim of exhaustive review of every indexed open roadmap is made.
- The tables are explicit falsification tests and source/supplier checks, not completed formal proofs of the 92 targets. In particular they do not turn declared supplier contracts into proved library theorems.

## Source issues

- **Misprint** in KPZ26 at §3.3.1, printed p.20, KPZ26 line 904: the source says the H-model is over O_F and the restriction-of-scalars G-model over O_K; it should be H over O_K and G over O_F; affects nothing.
- **Misprint** in KPZ26 at §5.1.2, printed p.48, KPZ26 line 2115: the source says the general tilde module is free over Ŵ(R); it should be free over the frame ring S; affects nothing.
- **Misprint** in KPZ26 at Remark 5.3.8, printed p.56, KPZ26 line 2440: the source says goodness at x suffices for the repeated embedding to be very good; it should be very-goodness at x, as in Lemma 5.3.7(b); affects a stated result.
- **Misprint** in KPZ26 at proof of Theorem 6.1.9, printed p.66, KPZ26 lines 2913–2914: the source says the descended inverse-different lattice dualizes another inverse-different-scaled lattice; it should be the dual of the original πᵐ-scaled descended lattice; affects the proof.
- **Error** in KPZ26 at proof of Corollary 6.3.5, printed p.71, KPZ26 lines 3139–3140: the source says the paired terms can each be selfdual while forming the indicated lattice chain; it should be a chain stable under duality with the dual index reversed; affects the proof.
- **Gap** in KP18 at Lemma 3.1.9 and its proof, printed p.166, KP18 lines 1921–1932: the source says chosen normal decompositions produce the canonical first-order comparison; it should be constructed invariantly through the relative frame; affects the proof; corrected in print at KPZ26 Lemma 5.1.15 and Remark 5.1.17, pp.51–52.
- **Error** in KP18 at proof of Lemma 3.1.17, printed p.169, KP18 lines 2019–2040: the source says the ghost-coordinate topology supplies the completeness needed for the convergent section; it should be the complete topology defined by the integral p-adic lattice; affects the proof; corrected in print at KPZ26 §7.3.1(2), p.86.
- **Gap** in KP18 at §3.2.12, printed p.173, KP18 lines 2192–2196: the source says the prescribed first-order tensor section lifts using smoothness; it should be required first to preserve tensors, through very-goodness; affects the proof; corrected in print at KPZ26 Remark 7.1.4(1), p.73.
- **Misprint** in KZ25 at §2.2.2, preprint printed p.9, KZ25 line 408: the source says σ-conjugates of w are u⁻¹wσ(w); it should be u⁻¹wσ(u); affects nothing.
- **Misprint** in KZ25 at §3.2.5, preprint printed p.23, KZ25 line 1035: the source says c has its source reduced modulo a_G but its target over the unreduced base; it should reduce both source and target to Ŵ(A_G/a_G); affects nothing.
- **Misprint** in KZ25 at Proposition 3.3.2(1), preprint printed p.25, KZ25 lines 1083–1087: the source says the Tate-side isomorphism takes s_α,0 to the lifted crystal tensors; it should take the étale tensors s_α,ét to those lifted tensors; affects nothing.
- **Misprint** in KZ25 at §3.4.2, preprint printed p.26, KZ25 lines 1161–1164: the source says the fundamental-group kernel is generated by roots outside the Levi; it should use the omitted simple coroot classes in the cocharacter quotient; affects the proof.
- **Misprint** in Kisin17 at Corollary 1.1.7 and Proposition 1.1.13, author printed pp.8–9, Kisin17 lines 340–346 and 413: the source says the comparison tensors and fixer are on the Tate module; it should use its linear dual, equivalently Cartier-dual Tate module twisted by −1; affects nothing.
- **Misprint** in Kisin17 at §1.1.15, author printed p.10, Kisin17 line 450: the source says the localized normal covers are finite étale over R; it should say finite étale over R[1/p]; affects nothing.
- **Misprint** in Kisin17 at proof of Lemma 1.2.18, author printed p.16, Kisin17 lines 708 and 718: the source says the quasi-isogeny comparison matrices lie in G(O_L) and G(𝔖); it should allow G(L) and G(𝔖[1/p]), as scalar p shows; affects the proof.
- **Misprint** in Kisin17 at Corollary 2.2.5, author printed p.33, Kisin17 line 1478: the source says μ_T induces the lifted Hodge filtration; it should be μ_T⁻¹, consistently with the preceding proof at line 1455; affects a stated result.
- **Misprint** in vanHoften24 at Theorem 3.1.4's local-model diagram, printed p.26, vanHoften24 line 1184: the source says q is the torsor and π the smooth local-model map; it should say π is the torsor and q the smooth local-model map; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e5dbe2ce852ad7dc0bfb3c1275d3db8364f52199", "job": "RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
