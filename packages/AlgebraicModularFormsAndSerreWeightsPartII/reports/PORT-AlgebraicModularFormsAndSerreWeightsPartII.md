# Port report: AlgebraicModularFormsAndSerreWeightsPartII

Branch `roadmap/algebraic-modular-forms-and-serre-weights-part-ii`, created from `c9a16a0`; head commit `c6dbce7c` (`AlgebraicModularFormsAndSerreWeightsPartII: roadmap (README, Suggested.lean, metadata)`). Folder `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder was touched.

## Build

`lake build TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII.Suggested`, run from the port worktree:

```text
warning: TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/Suggested.lean:71:8: declaration uses `sorry`
Build completed successfully (8958 jobs).
```

Warning count: 1 (the intended `sorry`). Pins read from `lake-manifest.json`: Mathlib `f6090c70`, Tau Ceti `358314d4`.

## Gate

```text
gate AlgebraicModularFormsAndSerreWeightsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

(run with `--order` pointing at the board merge-order file, as the brief's memory of the rate-limited `gh` fetch advises).

## Draft pull request body

Integral genus-two Siegel modular forms with arbitrary coefficient modules (finite torsion and K/O) are the characteristic-p and p-adic input to the nonregular GSp₄ modularity-lifting arguments of Calegari–Geraghty and to Pilloni's higher Hida theory, and nothing in Mathlib, Tau Ceti or the roadmaps on main builds them. This roadmap extends AlgebraicModularFormsAndSerreWeights from modular curves to the spherical, Klingen and paramodular genus-two models: the all-component Fourier expansion and integral q-expansion principle with module coefficients; the rank strata, simple zeros of the primary Hasse invariant and the secondary Hasse invariant with its normal-base extension, duality and polarized square root; characteristic-zero Hasse lifts, canonical powers modulo pⁿ and the two-affine cover of the rank-at-least-one locus; the formal coefficient operators U, V, Z, Z₂, X₂ with the determinant-p coset calculus at arbitrary tame level, the rational Hecke decomposition and the corrected integral operator Q₂; binary quadratic neighbor multisets with their projective-zero counts and oriented reciprocity; the integral geometric T and Q₂ actions on torsion and K/O forms through normalized finite and lci correspondences and formal Hartogs; the scalar and vector theta operators with superspecial nonvanishing, negative-weight vanishing and low-weight injectivity; and the full-frame ordinary Igusa function spaces with their saturated expansions, classical comparison and marked Klingen operator. Suggested.lean states the one headline statable at the pins, the arbitrary-tame-level degree identity for the determinant-p double coset, and names the geometric headlines that lack carriers.

Written with Claude (Fable 5.1) from the accepted board package and its review.

## Roadmaps this one depends on that are still pull requests

AlgebraicModularFormsAndSerreWeights, AutomorphicBundles, ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, AbelianSchemesAndArithmeticModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArithmeticGaloisRepresentations, AdelicAlgebraicGroups (all earlier in the merge order; sections checked at their indexed heads #928, #1069, #1053, #1084, #849, #879, #856, #792). On main: AlgebraicVectorBundles, ModularForms, ClassicalArithmeticCompletion, SchemeAndStackFoundations, ReductiveGroupsPartII. OverconvergentAutomorphicForms (later in the order) and GSp4NonregularModularityLifting (later) are named only as non-owners/consumers in Scope and ownership and Downstream consumers; neither appears in a Needs line, a supplier heading or a Dependencies block.

Merge-order position: line 239; every supplier is above it (AdelicAlgebraicGroups 31, AbelianSchemesAndArithmeticModuli 41, ArithmeticGaloisRepresentations 42, FiniteFlatGroupsAndIntegralPadicHodgeTheory 46, AlgebraicModularFormsAndSerreWeights 87, ShimuraCompactifications 150, AutomorphicBundles 170, HodgeTateAndCanonicalSubgroups 171).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the acceptance-test rule (one headline theorem, no definitions, single `import Mathlib` plus one `TauCeti.*` module, no `set_option`). The only change is the line `@[expose] public section` after the module docstring, so that a non-module importer sees the declaration (the form of `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` on main). The scratch probe

```lean
import TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII.Suggested
#check @TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII.relIndex_conj_diag_eq_tameIndex_mul
```

elaborated with `lake env lean` from the worktree; the printed type carries the binders `(N p : ℕ) (hp : Nat.Prime p) (hpN : p.Coprime N) (Γ : Subgroup SL(2, ℤ))`, the hypothesis `CongruenceSubgroup.Gamma N ≤ Γ` and the two `relIndex` sides, exactly as README §5.2 states; the file has no section `variable`s, so no binder can drop. Nothing changed.

Headline theorems not statable at the pins are listed in the module docstring (expansion principle, rank geometry, secondary Hasse extension and root, torsion shifts and cover, integral coefficient operators and Q₂, neighbor reciprocity, integral T/Q₂ actions, theta operators and injectivity, Igusa comparison), each with the carrier it lacks. The §4.2 congruence is a Mathlib lemma (below), so it is not a headline; the symmetric-power irreducibility of §8.3 is ArithmeticGaloisRepresentations' theorem.

## Supplier replacements and citation repairs

- **Mathlib `dvd_sub_pow_of_dvd_sub`** (Mathlib/NumberTheory/Basic.lean:32, `(p : R) ∣ a - b → (p^(k+1) : R) ∣ a^(p^k) - b^(p^k)` in a commutative ring): the elementwise congruence that §4.2's proof route derived by hand is now cited from Mathlib (From Mathlib contract, §4.2 route and Needs, Layer 4 Dependencies); the ramified ϖ-variant, which the lemma does not cover, stays a target.
- **AutomorphicBundles letter labels → its own numbering**, using the dictionary that roadmap prints before its supplier contracts (B2 = Layer 3, B3 = Layer 5 with B3.3 = 5.2 and B3.2 = 5.3, B4 = Layer 11, B5 = Layer 12 with B5.n = 12.(n+1)): B2.1 → 3.1, B3.2–B3.4 → 5.2–5.4, B3.10 → 5.10, B4.19–B4.20 → 11.19–11.20, B5.10–B5.11 → 12.11–12.12, B5.14–B5.15 → 12.15–12.16, B5.19 → 12.20. Each target heading was read at #1069 (3.1 automorphic coefficient functor; 5.2 gluing, 5.3 canonical, 5.4 subcanonical extension; 5.10 integral canonical coefficients on good-prime PEL models; 11.19 qcqs section colimits; 11.20 integral forms with arbitrary coefficient modules; 12.11–12.12 geometric Hecke operators and convolution law; 12.15–12.16 vector Fourier–Jacobi expansion and expansion principle; 12.20 Hecke action on Fourier–Jacobi coefficients). The resolver's four leads (B2.1, B5.10, B5.14, B5.19) are gone.
- **AlgebraicModularFormsAndSerreWeights R15.n → Layers**, using that roadmap's own statement (R15.1–R15.5 = Layers 1–5, R15.5A = Layer 6, R15.6 = Layer 7): "R15.1–R15.6" → "Layers 1–7", "R15.1–R15.3 … R15.4–R15.6" → "Layers 1–3 … Layers 4–7" with the layer titles read at #928.
- **OverconvergentAutomorphicForms**: the Scope sentence cited "Layers 5–6" for analytic Siegel coefficient sheaves; at #1422 the Siegel and toroidal analytic coefficients are Layer 8, the Hilbert ones Layer 5 and compact Hecke operators Layer 6, so the sentence now reads "Layers 5 and 8 … Layer 6".
- **Gap contracts** rendered as on main: "What X must provide (gap:slug)" → "What X must provide (the <name> contract)", and every "(gap:slug)" tag in Needs/Dependencies → "(the <name> contract)". Slug → name: siegel-parahoric-models → Siegel parahoric models contract (ShimuraCompactifications); siegel-rank-one-deformations → Siegel rank-one deformations contract, siegel-isogeny-trace-ideals → Siegel isogeny trace ideals contract, siegel-logarithmic-de-rham → Siegel logarithmic de Rham contract (AbelianSchemesAndArithmeticModuli); siegel-igusa-full-frames → Siegel Igusa full frames contract (HodgeTateAndCanonicalSubgroups); open-formal-milnor → open formal Milnor contract, lci-fundamental-class → lci fundamental class contract, reduced-section-propagation → reduced section propagation contract (SchemeAndStackFoundations). These are the eight `conditional_gaps` of review.json, unchanged.
- **Line locators**: the 104 "SRC line N" tokens into the worker-side extractions were dropped (no README on main carries them); every theorem, equation and page locator was kept. Before dropping them, 41 of the line numbers were opened in `sources/<sha256>.txt` and each sits at the stated theorem or page marker (CG20 Lemma 8.4 at 2306, Lemma 8.12 at 2501, Definition 8.19 at 2773; P20 Lemma 6.3.1.1 at 1338, Remark 6.4.1 at 1652, Lemma 10.3.2 at 2760, §14.9.2 at 4738; Y16 (4.5) at 2126; K75 Lemma 13 at 1676 and §11 at 1712; B15 Theorem 6.2.2 at 4724; Stacks Lemma 47.9/0CNF at 5242; page markers for the rest). The References' "extracted line numbers" sentences were shortened to "Locators refer to this version."
- **Downstream consumers** now names GSp4NonregularModularityLifting, which consumes Layer 3, Layer 8 and §6.3 (see duplication below).
- **Pinned declarations**: all 22 file:line citations (Mathlib `Matrix.det`, `det_mul`, `legendreSym`, `SpecialLinearGroup.map`, `CongruenceSubgroup.Gamma`, `toGL`, `mapGL`, `ZMod.unitOfCoprime`, `Subgroup.pointwiseMulAction`, `Subgroup.relIndex`, `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`; Tau Ceti `Representation.symmetricPower`, `Module.Basis.symmetricPower`, `TauCeti.stdSLRep`, `BinaryQuadraticForm` with `discrim`, the SL₂ action and `discrim_smul`, the three HeckeRing.GL2 declarations, `TauCeti.diagGL`) were opened at the pin and sit at the stated lines. The imported module `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic` exists at the pin.

## Duplication sweep

`roadmaps grep` over main and the 451 indexed heads for the roadmap's objects (secondary Hasse invariant, Klingen/paramodular models, superspecial points, Siegel theta operators, full-frame Igusa tower, binary neighbors, tame coset index, Hasse square root, genus two). No roadmap on main or earlier in the merge order plans any of them; SiegelModularForms (#1714, not in the merge order) defines complex half-integral index matrices over ℂ, a different object from the tame-denominator p-integral index lattice of §1.2, and is not cited. Nothing was removed.

**Flag for the maintainer.** GSp4NonregularModularityLifting (#1817, merge-order line 267, later than this roadmap at 239) restates in its §3.2 "Secondary Hasse geometry" the construction of Layer 3 here (secondary determinant section from v^(p−1), Cartier duality, normal-base extension, the Cohen–Macaulay divisor and the square root of weight (p²−1)/2) and, before its scalar vanishing argument, the neighbor multisets and oriented reciprocity of §§6.1–6.3 with the same tame-level analysis. Since that roadmap is the later one, this roadmap is the owner and GSp4NonregularModularityLifting should import these by section; no edit was made here beyond naming it as a consumer.

## Dependency check

```text
depcheck: 234 roadmaps, 2159 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line (command of the brief with `--movable`, run after all edits). Citation resolver after the edits: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Adversarial mathematics pass

Values computed independently (hand computation and the enumeration script `scratch/enum.pl`: exhaustive SL₂(𝔽_q) and subgroup enumeration, exact rational arithmetic).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Headline `relIndex_conj_diag_eq_tameIndex_mul` | N=1; N=0; N=p; Γ=SL₂(ℤ), p=3 | N=1: Gamma 1 = ⊤, H′ trivial in the trivial group GL₂(ℤ/1), tame index 1, LHS [SL₂(ℤ):Γ₀(3)]=4=(3+1)·1. N=0: `p.Coprime 0` forces p=1, excluded by primality. N=p: coprimality fails, so diag(p,1) mod p is never formed. Finiteness: g⁻¹Γ(Np)g ⊆ Γ(N) (entry Np·x₁₂/p = N x₁₂), so no junk value 0 | Hypotheses exclude every junk instance; conjugation direction gKg⁻¹ and relIndex = [K : K ∩ gKg⁻¹] match README | None |
| §5.2 degree e(p+1) | Γ̄=Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩, p=3; Γ̄=Γ(5)∩red₇⁻¹⟨[[0,−1],[1,−1]]⟩, p=3 | |SL₂(𝔽₅)|=120, |Stab|=20, |Stab∩gStabg⁻¹|=4, e=5; |SL₂(𝔽₃)|=24, |B|=6, index 4; degree 20. Order-3 group: intersection with its diag(3,1)-conjugate is {1}, e=3, degree 12 | Matches README | None |
| §5.2/§6.2 projective zero counts | p=2,3,5; Q=0,x²,x²+y²,xy | p=2: 3,1,1,2; p=3: 4,1,0,2; p=5: 6,1,2,2 | Literal counts e× these; p=2 counts 3,1,1 as stated | None |
| §5.4 X₂, U₂ | p=3; x²+y², 3(x²+y²), x² | (−4/3)=−1 → (−1,−4); nonprimitive → (3,8); Δ=0 → (0,−1); residues (2,2),(0,2),(0,2) | Discriminant symbol, not determinant ((1/3)=+1 would differ) | None |
| §5.7 corrected Q₂ | p=3,5; (j,k)=(2,2),(3,3),(4,2),(5,3) | Exact expansion of (pT₂+(p+p³)S)p^(2−k) gives (X₂,Z₂,V₂,1) coefficients (p^(j−2),1,p^(j+k−3),p^(j−1)) in all eight cases; at p=3: (1,1,3,3),(3,1,27,9) | Cancellation exact; Q₂≡Z₂ except (2,2) | None |
| §7.5 C_r−Q₂ | (2,2),(3,3), p=3 | C_r−Q₂=(1+p+p²+p³)p^(j−3)−(1+p²)p^(j−3)=(1+p²)p^(j−2): 10 and 30; residues 1, 0 | Matches | None |
| §6.3 orientation witness | Γ(5), p=3, M=[[3,5],[30,51]], Q=x² | det M=153−150=3; M=[[1,5],[10,51]]·diag(3,1), left factor ≡I mod 5; M⁻¹·Q=(1/3)adj(M)Q adj(M)ᵗ=(867,−1020,300)=3(17x−10y)² ≡ (2,0,0) mod 5 | Forward relation not symmetric | None |
| §3.7 polarization dependence | p=5, Λ→2Λ, 4Λ | 2^((p−1)/2)=4=−1, 2^(p−1)=16≡1; 4²=16≡1 | Root flips, h′ fixed; (2/5)=−1 | None |
| §2.3 crystalline sign | Fe₂=−pe₃, Fe₃=e₂, ⟨e₂,e₃⟩=1 | ⟨Fe₂,Fe₃⟩=⟨−pe₃,e₂⟩=p | Sign consistent with ⟨Fx,Fy⟩=pσ⟨x,y⟩ | None |
| §4.2 congruences and Mathlib lemma | p=3,n=2; p=2,n=2; ϖ²=3,m=2 | 4³−1=63≡0 mod 9; 3²−1=8≡0 mod 4; (1+ϖ)³−1=6ϖ+9, ϖ-order 3≥2. `dvd_sub_pow_of_dvd_sub` with k=n−1 gives p^n ∣ a^(p^(n−1))−b^(p^(n−1)) | The p-case is the pinned lemma; ϖ-case stays a target | Citation added |
| §8.1 contraction | d=2: x²⊗y²; highest-weight tensor at general d | (2·2)/12=1/3; terms 2d(d−1), 4(d−1), 4 sum to 2d(d+1), so the normalized value is x^(d−2); d=2: 4,4,4 | Normalization exact; 2d(d+1)≡0 at d=p−1 | None |
| §8.4 first-order coefficients | p=11, (j,k)=(6,2); p=7 | 20⁻¹≡5: −12/20≡6, −6/20≡3, −2/20≡1; −3/5≡5 mod 7; 6/9≡3 mod 7 | Matches README; k≡1 kills the factor 1−k | None |
| §8.6 weight range | p=5, k=2..6 | k(2k−1) mod 5 = 1,0,3,0,1; k=4 excluded as Hasse weight | Permitted 2, 6 | None |
| §8.7 degrees | p=7 (j=4,5); p=11, j=6 | 7·4−2=26, 7·5−2=33 < 50; after h: (−4,−8), pa−b=−36 | Matches | None |
| §9.4 marked degree | p=2, exhaustive count of isotropic L⊂(ℤ/4)⁴ of type (4,2,2) with the pairing x₁y₃+x₂y₄−x₃y₁−x₄y₂ | 30 such L, 16 with L∩H₁=0 (=p⁴ of p⁴+p³+p²+p=30); U^ord(1)=16/8=2 | Matches README (p=3 count 81 of 120 not re-enumerated here; it is the review's record) | None |
| §9.1 frames | p=3; d=2, r=1 at diag(2,1) | |GL₂(𝔽₃)|=48, diagonal 4; 2²·2=8 vs reversed 2 | Matches | None |
| §1.2 Legendre witness | p=3, Q=x²+y² | Δ=−4≡2: (2/3)=−1; det=1: (1/3)=+1 | Symbols differ as stated | None |
| §3.1/§4.4 weights | p=3 | (p−1)(p+1)=8; (p−1)N(p+1)=8N | Matches | None |

No statement was found false; the only change from the pass is the Mathlib citation in §4.2.

## Unresolved

- GSp4NonregularModularityLifting (#1817) duplicates Layer 3 and §§6.1–6.3 of this roadmap at its head (above); it is later in the merge order, so the repair belongs there.
- The P12 page locators (pp. 351–354) are the journal pages; the extraction's page markers are offset by the cover page, as the package manifest notes. The locators were kept as reviewed.
- Ownership against open pull requests outside the roadmap service's index and the sibling checkouts listed in the brief was not checked.
- The eight supplier contracts (the former gaps) remain requests on ShimuraCompactifications, AbelianSchemesAndArithmeticModuli, HodgeTateAndCanonicalSubgroups and SchemeAndStackFoundations; nothing at the pins or on main supplies them.


Pull request: #1822 (roadmap/algebraic-modular-forms-and-serre-weights-part-ii at c6dbce7)
