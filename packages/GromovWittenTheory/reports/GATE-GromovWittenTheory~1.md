# GATE-GromovWittenTheory~1: answers to the review of `c0b92ea`

One review, by CBirkbeck, with findings F01–F12. They are numbered H01–H12 here, in the review's order. The repairs are in the commit `GromovWittenTheory: review repairs (…)` on top of `c0b92ea`. Files: `TauCetiRoadmap/GromovWittenTheory/README.md`, `TauCetiRoadmap/GromovWittenTheory/Suggested.lean`.

## H01 (CBirkbeck) — applied

§6.2 Check: the old "`⟨pt, pt, H⟩_ℓ ⟨1, H, H⟩_0 = 1 · 1 = 1`" is replaced. The Check now says that `I_(0,4,ℓ)(pt, pt, H, H)` has degree 2, so its restriction to the point is 0, and the surviving Casimir term is `g^(H,H) ⟨pt,pt,H⟩_ℓ ⟨H,H,H⟩_0 = 1 · 0`. A nonzero control is added: insertions `pt, H, H, H`, where only `(ℓ, 0)` with `(Δ_a, Δ_b) = (pt, 1)` contributes, `1 · ∫H² = 1`. The same pattern is repaired in §6.5 (old: capped trace "equals the splitting value 1"; new: 0 by degree 14 ≠ 12, and 1 for `pt, H, H, H`, degree 12), in the §6.6 node-matching Check (both values given) and in the Layer 6 Examples.

## H02 (CBirkbeck) — applied

§6.6 Check: the old "the fibre over the diagonal is empty, as a line is embedded" is now restricted to the smooth-domain locus with distinct marks. On `M̄_(0,2)(ℂP², ℓ)`, of complex dimension 4, the fibre is the collision-bubble stratum (a line with a point on it), of complex dimension 3 rather than the expected 2. The Check now says the intersection is excess and that neither emptiness nor transversality is used. It also records that the matching emptiness Check in AnalyticStableMaps §12.1 holds only on the smooth-domain locus; that supplier is not edited. This also agrees with the roadmap's own §8.2 Check on `M̄_(0,2)(ℂP¹, ℓ)`, where the diagonal is the bubble locus.

## H03 (CBirkbeck) — applied

§8.1 Check: the old "`∫ ψ̄₁² = 0 + ∫[D_(1,5)] ⌣ ψ̄₁ = 1`" is replaced by `ψ̄₁ = a + D` with `∫a² = 0`, `∫aD = 1`, `∫D² = −1`, which gives `∫ψ̄₁² = 0 + 2 − 1 = 1`. The Check also gives `∫ψ̄₁ ⌣ D = 1 − 1 = 0`, as the restriction law requires. The value `D² = −1` agrees with Kock2001, Remark 1.3.2, p. 12 (`D² = −π*ψ · D`), and `ψ_i · D_(i,0) = 0` is Kock2001 p. 12.

## H04 (CBirkbeck) — applied

§0.1 Check: the claim that genus-one realized classes on `T² × T²` "are the combinations `aF₁ + bF₂`" is deleted. The Check now says only that covers of the factor fibres realize `aF₁` and `bF₂`, with areas `a` and `b√2`. The diagonal of `E × E` is added as a mixed-class control: its class has a nonzero `H₁ ⊗ H₁` Künneth part, pairs to 1 with a suitable `α₁ ⌣ β₂`, and has area `1 + √2`. No classification is asserted.

## H05 (CBirkbeck) — applied

§0.1: `Eff(g, n, J)` is now "the set of classes represented by a stable map … with `0` adjoined", and the name "realized effective set" is dropped throughout (§§0.1, 4.1, Scope, How to read). The bullet "`0 ∈ Eff` … realized by the constant maps" now says that `0` is represented exactly when `2g − 2 + n > 0` and `X ≠ ∅`, with the unstable signatures and `X = ∅` named. §1.1 Check: "`d = 2(m − 3) + 4 − 2m = −2`" → "`d_(0,2,0) = 2m − 2`; for `ℂP¹`, empty carrier, `d = 0`, numerical operation 0; emptiness from stability, not dimension".

## H06 (CBirkbeck) — applied

§2.3 Check: "`z ↦ z` and `z ↦ z²` on ℂ … classes `1` and `0`" → "`x ↦ x` and `x ↦ x²` on ℝ, classes 1 and 0", which is the pair the cited ImplicitAtlases §5.2 Check actually uses. The Check adds that on ℂ the classes are 1 and 2, the multiplicity given by AnalyticStableMaps §10.2 Checks for `z ↦ z^r`.

## H07 (CBirkbeck) — applied

§6.4: the API bullet "the transfer degree is the order of the generic branch-swap stabilizer" is replaced by the weighted count `Σ_x |Aut(y)|/|Aut(x)|` over coarse preimages. "On the stratum where the maps are embeddings" → "near the one-node stratum, in local ordered-branch charts". The Checks now give:
- genus two: `(E,p,q) ≅ (E,q,p)`, so the map is coarsely injective, degree `1·2/1 = 2`;
- generic `M̄_(3,2) → M̄_(4,0)`: `2·1/1 = 2`;
- non-isomorphic elliptic components: `2·4/4 = 2`, replacing "the factor swap is a target automorphism";
- `M̄_(0,3) × M̄_(1,1) → M̄_(1,2)`: `1·2/2 = 1`.

The degree-2/1 rule itself is unchanged.

## H08 (CBirkbeck) — applied

§0.2: "prove that `Λ_ω` is a graded ring" is replaced. The section now defines closed homogeneous pieces `Λ_ω^D` and `(V ⊗̂ Λ_ω)^D` by the condition `v_A ∈ V^(D − 2c₁(A))`. Their direct sums are an ordinary graded ring and module, and `Λ_ω` and `V ⊗̂ Λ_ω` are the filtered completions of those sums. Every element is the convergent sum of its components, because only finitely many components meet each `{ω < C}`. The false sentence about a homogeneous element with infinitely many distinct `c₁` is replaced by: its Chern numbers lie in `{(D − k)/2 : V^k ≠ 0}`. A Check is added: on `S²`, `Σ q^k` has degrees `0, 4, 8, …` and is not homogeneous, while the `c₁ = 0` series on `T² × T²` is homogeneous. The convention is carried into §7.1, in its prose and in the `Ω_(g,n)` homogeneity bullet.

## H09 (CBirkbeck) — applied

The unsupported enumerative deductions are removed, which is the review's second alternative. §7.2 Check: associativity now reads `qN₁H = qN₁H`, every structure constant being a line count, and a class `2ℓ` would need insertion degree 16 > 12. §6.2: the conic Check is replaced by the computation that `(pt, pt, H, H)` in class `2ℓ` has operation degree −4 (`d = 18`), so that identity contains no conic count. The `N₂`/`N₃` claims are removed from the Layer 6 and Layer 7 Examples; Layer 7 now gives `QH^*(ℂP²) = ℚ((q))[x]/(x³ − q)`. The higher-point WDVV recursion is not added as a new target, so the scope is not widened.

## H10 (CBirkbeck) — applied differently

- §3.4: CharacteristicClasses C2 item 3 is now cited for `e(TX)[X] = χ(X)` (checked on main: C2 item 3 states it), with AlgebraicTopology Stage 7 kept only for `χ = Σ(−1)^i dim H^i`. The supplier contracts, Scope and *Needs* are updated to match.
- §§8.1–8.6 now carry exact locators to two legal sources, each marked as algebraic-setting. KM1998 (arXiv:alg-geom/9708024v1): eqs. (1)–(2) p. 2; Thm 1.2 eq. (4) p. 2; Cor 1.3 eq. (4a) p. 3; eq. (11) p. 5; Lemma 1.5.2 eq. (12) p. 5; Lemma 1.5.3 p. 6. Kock2001 (*Notes on psi classes*, author page): Lemmas 1.2.6, 1.3.1, 1.4.2, 1.5.1, 1.5.2, 1.6.2 and (5.1.7.1)–(5.1.7.3), Prop 5.1.8, Lemmas 5.1.9 and 5.2.1, pp. 10–53. The analytic and finite-isotropy constructions are labelled as this roadmap's own: §8.2 descent, §8.5 `[D_i]_(supp,vir)`, and the already-labelled §3.2 Hodge family and §6.5 capped trace.
- No locator is invented for §3.2 or §6.5. These are constructions extending the sources' setting, and the README already says so.
- Both new works are cited in References. They could not be entered in `sources.toml`: the folder has no manifest, and this job may edit only README.md and Suggested.lean. The worker should record `KM1998` (arXiv, open-repository) and `Kock2001` (author page); both were fetched through the sources service.

## H11 (CBirkbeck) — applied

API bullet lists are added, separate from the Checks:
- §8.1: equivariance and relabelling, the forgetful comparison with `ψ̄_i ⌣ D = 0`, the clutching restriction, and the genus-zero boundary expression and integrals;
- §8.2: independence and relabelling, the map-level forgetful comparison, the clutching restriction, and `X = pt`;
- §8.3: multilinearity with Koszul sign, degree selection, and the comparison with §2.2 including the ancestor/`∫^wt` identity.

The §3.2 negative control "independent residues would give dimension 2" on the irreducible nodal curve is removed: there the residue theorem already forces opposite residues, so the space is `ℂ·dz/z`. The control moves to the two-sphere, two-node curve: 2 unmatched, 1 matched. "From the remaining roadmaps on main" is split into named subsections: GeometricTopology, DifferentialGeometry, ComplexKahlerGeometry, HeegaardFloer, PDE. The HamiltonianFloerOperations consumer line was removed from the supplier contracts; it stays under Downstream consumers.

## H12 (CBirkbeck) — applied

`Suggested.lean` docstring: "roadmaps still in pull requests" is deleted. "only the constant, negated and product constructors, so no Riemann surface is a domain at the pin" → "`SmoothAlmostComplexStructure` accepts any smooth `J` with `J² = −1` on a native manifold, so what is missing is the nodal-domain and stable-map moduli carrier". This was checked at the pin: `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean:67` is the bare structure, with `neg`, `const`, `constSmooth` and `product` at lines 158–263. The same overclaim in the README supplier contract (From Tau Ceti) is repaired the same way.

## Build and gate

- `lake build TauCetiRoadmap.GromovWittenTheory.Suggested`: `Build completed successfully (8976 jobs).` The file has no declarations, so no `#check @name` comparison was possible; the elaborated-signature check has zero subjects and nothing changed there.
- Gate at the repair commit: `gate GromovWittenTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, with the only problem `depcheck: NOT IN ORDER: GromovWittenTheory (insert it after its last supplier)`.
- Direction check (`--movable`):

```text
NOT IN ORDER: GromovWittenTheory (insert it after its last supplier)
depcheck: 208 roadmaps, 1460 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. GromovWittenTheory is not in `ORDER.txt` (a design-stage roadmap), so the NOT IN ORDER line is the expected placement message, not a defect. The edge count rose from 1458 to 1460 because the suppliers previously grouped under one heading now have named subsections.

## Ownership

No new construction was introduced. The cotangent-line and ψ-class targets were already in §§8.1–8.2; `roadmaps grep` for psi/cotangent-line classes finds no other owner on main or at the open heads. No cross-roadmap citation was added except CharacteristicClasses C2 item 3, which was checked on main.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §6.2 restriction, `pt,pt,H,H`, `{12|34}` | ℂP², A = ℓ; decompositions (ℓ,0), (0,ℓ) | deg I = 12 − 10 = 2 on a point → 0; RHS g^(H,H)=1: 1·∫H³ = 0; (0,ℓ): first factor degree 8+deg Δ−4 > 0 → 0 | both sides 0 (was 1) |
| §6.2 control `pt,H,H,H` | ℂP², ℓ | deg = 10 − 10 = 0; RHS (ℓ,0), Δ_a = pt, Δ_b = 1: ⟨pt,H,pt⟩_ℓ·∫H² = 1·1; (0,ℓ): degree 6+deg Δ−4 ≥ 2 → 0 | c = 1, added |
| §6.2 conic negative control | ℂP², 2ℓ | d_(0,4,2ℓ) = 2(−1+6+4) = 18; r = 12 − 4 − 12 = −4 | operation 0, added |
| §6.5 capped trace | `pt,pt,H,H` vs `pt,H,H,H` | degrees 14 ≠ 12 → 0; 12 = 12 → 1 (one line through pt and H₃∩H₄) | corrected |
| §6.6 diagonal fibre | M̄_(0,2)(ℂP²,ℓ) | dim_ℂ = 4; diagonal codim 2 → expected 2; bubble stratum: line (2) + point on it (1) = 3 | excess; emptiness only on smooth locus |
| §8.1 ψ̄₁² on M̄_(0,5) | a = π*ψ̄₁, D = D_(1,5) | a² = 0, aD = 1, D² = −1 → 1; ψ̄₁·D = 1 − 1 = 0; (n−3)!/∏k! = 2!/2! = 1, 2!/(1!1!) = 2 | values unchanged, derivation fixed |
| §0.1 T²×T² | E×E diagonal; generic E₁×E₂ | Δ area 1 + √2; ⟨[Δ], α₁⌣β₂⟩ = ±1; ⟨aF₁+bF₂, α₁⌣β₂⟩ = 0 | classification deleted |
| §0.1 zero in Eff | (0,2), (1,0), X = ∅, (0,3) | constant stable maps need 2g−2+n > 0: none for (0,0),(0,1),(0,2),(1,0); (0,3): M̄_(0,3) × X ≠ ∅ | bullet restated |
| §1.1 d_(0,2,0) | m = 1, m = 2 | 2((m−3)+0+2) = 2m−2 → 0, 2 | was −2 |
| §2.3 atlases | x, x² on ℝ; z, z² on ℂ | signed degree 1, 1−1 = 0; complex 1, 1+1 = 2 | matches ImplicitAtlases §5.2, AnalyticStableMaps §10.2 |
| §3.2 residue controls | ℂP¹ poles 0,∞; two spheres two nodes | dim ℂ·dz/z = 1 with or without matching; 2 unmatched → c₂ = −c₁ → 1 = b₁ | control moved |
| §6.4 transfer degree | ξ: g=1→2; ξ: g=3→4; φ: (1,1)²→(2,0) non-iso; φ: (0,3)×(1,1)→(1,2); ξ: (0,3)→(1,1) | 1·2/1 = 2; 2·1/1 = 2; 2·4/4 = 2; 1·2/2 = 1; 1·2/1 = 2 | rule kept, explanation replaced |
| §0.2 homogeneous pieces | S², V = ℚ; T²×T², c₁ = 0; V = H*(T²) | Σq^k degrees 0,4,8,… inhomogeneous; homogeneous deg D ⇒ single monomial q^(D/4); c₁ = 0 series homogeneous of degree 0; c₁ ∈ {(D−k)/2} finite | grading restated as completion |
| §0.2 convergence of components | sublevel-finite f | for each C finitely many A with ω(A) < C ⇒ finitely many components meet {ω < C} | true, stated |
| §7.1 Ω homogeneity | (g,n) = (0,3), ℂP¹ | Ω_(0,3)(pt,pt,pt) = q: total degree 0 + 4 = 6 + 2(−1)(1) = 4; r ∈ [0,t] ⇒ finitely many c₁ | consistent |
| §7.2 small QH ℂP² | H⋆H, H⋆H², H²⋆H² | A=ℓ needs Σdeg = 10: H⋆H none; H⋆H²: e_j = H², ⟨H,H²,H²⟩ = 1 → q; H²⋆H²: e_j = H → qH; 2ℓ needs 16 > 12 | associativity qH = qH, N₂ claim removed |
| §8.3 ancestor/∫^wt API | X = pt, n = 4, k₁ = 1 | ∫ψ̄₁·I_(0,4,0)(1,1,1,1) = ∫ψ̄₁ = 1 = ⟨τ̄₁τ₀³⟩ | consistent with §8.6 Check |
| §3.4 χ citation | ℂP¹, T², pt | e(T)[X] = 2, 0, 1 = χ | citation added |

## Suspicious text

None. The review contains no instructions beyond its mathematical claims.
