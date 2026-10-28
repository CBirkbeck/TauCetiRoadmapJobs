## H01 (CBirkbeck) — applied

Replaced `4j ↦ 1` by `ξ ↦ 1`, with `ξ² = j` and order eight, in `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:139,400`; lines 396, 409, 427, 552, 560, 1210 and 1229 retain the recorded normalized representative through the local and global companions and the exact type comparison. BCDT line 897 and BCDT line 1012 give the fourth root of −1, and the exclusion Checks at lines 420, 566 and 1235 compute `N(ξ) = −1`, distinguish inertia orders three and six, and exclude `y² = x³ − 27x − 108` until twisted back, consistently with Manoharmayum line 883 and Manoharmayum line 888.

## H02 (CBirkbeck) — applied

Expanded the ordinary branches in `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:1288,1336` from an immediate lifting application to a split multiplicative quadratic twist, the ordered local sequence with unramified quotient, distinct residual inertia characters, preservation of residual modularity, and the matching ordinary cuspidal seed from OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10. The supplier contract at line 93 and the layer dependencies at line 1366 now include that seed refinement; ClassicalSerreModularity §I.1 remains the full lifting input, with the required irreducibility over ℚ(√−3) at three and `p = 5 ≠ 3` at five, and the new Checks at lines 1292 and 1340 evaluate the ordered characters as `(2,1)` rather than `(1,2)`.

## H03 (CBirkbeck) — applied

Named `F = K^{⟨σ⟩}` for an order-eight Frobenius lift, with `[F : ℚ₃] = 3`, and in the abelian case identified it with `ℚ₃(E[2])`, in `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:436`; line 440 now explicitly assigns all three displayed norm subgroups to `N_{F/ℚ₃}(F^×)`. Manoharmayum line 796 distinguishes the degree-24 field `K`, Manoharmayum line 848 introduces the cubic fixed field, and Manoharmayum line 863 identifies its two-torsion interpretation before the norm list at Manoharmayum line 875; the Check at README line 446 computes each norm index as `9/3 = 3`, against index 24 for abelian `K`.

### Sources, citations and ownership

The revisions use the existing source keys BCDT, CDT and Manoharmayum; no new work or source record is needed. The ordinary theorem statements themselves agree with CDT line 1608, CDT line 1631 and CDT line 1765. BBM remains uncertified and Serre remains waived; neither status was reopened, and no missing text is needed for these repairs.

Compared the main ClassFieldTheory, EllipticCurves and ModularForms roadmaps, the supplier heads returned by the roadmap index, the board packages, and every supplied sibling roadmap folder by the objects involved. Ordinary seed construction stays with OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10; full rational ordinary lifting stays with ClassicalSerreModularity §I.1, and GL2ModularityLifting §5.9 retains its matching-quotient condition. General local norm-index and class-field correspondence stay with ClassFieldTheory Layer 8. The explicit BCDT character normalization, its companion application and the identification of the three particular cubic fields belong to this roadmap's existing §§0.3, 1.9–1.11, 1.16 and 6.3–6.4: these are arithmetic specializations, with no new generic carrier or competing construction. The supplied EllipticCurveModularityPartII head has dimension, rationality and torsion-comparison targets, not these local wild calculations. No ownership move or new declaration was introduced.

Re-resolving the README against main `ae2562c` and the indexed open heads found no unresolved cross-roadmap citations. The resolver did not inspect pinned packages in this invocation, so its clean result is not evidence about native library declarations: those were read in the supplied Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` trees, whose revisions match the supplied manifest. In particular `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84,91,104` requires coprimality for eigenvalues and bundles the actual newform. The earlier citation lead `BarsottiTate.extend_genericFibre` is the named target in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, not a claim that the pinned libraries already implement it.

### Adversarial mathematics: revised statements and conventions

Each row evaluates a changed statement or a mathematical assertion used by its repair. These computations test the conventions and negative controls; they do not replace proofs of the admitted headline theorems.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: `ξ² = j` in the unramified quadratic field | Residue field `𝔽₉ = 𝔽₃[j]`, `ξ̄ = 1 − j`; the two lifts of its square root | `(1−j)² = j`, `(1−j)⁴ = −1 = 2`, `(1−j)⁸ = 1`; derivative `2(1−j) ≠ 0`, so Hensel lifts it; `ξ⁴ = −1 ≠ 1` | Order exactly eight, not four | Named ξ and its defining relation |
| §0.3: order-three unit character for τ₋₁ | `ξ, 4, 1+3j`; competing character with tame sign | Normalized images `(1,1,ζ)` have unit-image order 3; replacing the first by −1 gives unit-image order `lcm(2,3) = 6` | The order-three condition already excluded the extra sign in §0.3 | Corrected the root notation and added its witness |
| §1.9: normalized tag 3, determinant and tame factor | Normalized character and its ramified quadratic twist η | `det(ρ̄⊗η) = det(ρ̄)η² = det(ρ̄)`; `θ(ξ)` changes `1 → −1`, while `θ(3) = 2` stays 2 | Determinant alone does not select the type | Require ξ ↦ 1 on the tagged representative |
| §1.9: norm exclusion Check | `3, 4j, 4, 1+3j, ξ` in `ℚ₃(j)^×` | Norms `(9,16,16,10,−1)`; η-values `(1,1,1,1,−1)`; `10 ≡ 1 mod 3` | The four old values admit both twists; the new one separates them | Added the full negative control |
| §1.10: the normalizing twist | Tame factor ±1 on ξ; unramified quadratic twist on 3 after restriction to `ℚ₃(j)` | The determinant forces `θ(ξ)^6 = 1`; its order also divides 8, hence `θ(ξ)² = 1`. Multiplication by `η(Nξ) = −1` kills the negative sign. The unramified quadratic value is `η_nr(N3) = η_nr(9) = (−1)² = 1` | The extra tame normalization is attainable and is not an unramified sign choice | Recorded the representative and its use in every consumer |
| §1.11: full splitting field and cubic fixed field | Abelian `C₃ × C₈`; nonabelian `C₃ ⋊ C₈` with inversion | Both groups have `3·8 = 24` elements; the Frobenius subgroup has 8 elements, hence fixed-field degree `24/8 = 3`. In the nonabelian group `στσ⁻¹ = τ² ≠ τ` | Cubic fixed field is cyclic only in the abelian case | Named F separately from K |
| §1.11: the three norm subgroups | Cube classes of 6, 3 and 12 | `6 = 3·4²·(1/2)³`; coordinate generators `(1,2),(1,0),(1,1)` span respectively `{(0,0),(1,2),(2,1)}`, `{(0,0),(1,0),(2,0)}`, `{(0,0),(1,1),(2,2)}`. Each index is `9/3 = 3`; abelian K has norm index 24 | All three fields are distinct and degree three | Named norm source and target and added an index Check |
| §1.11: abelian F equals the two-torsion field | `y²=x³−3x+8` and `y²=x³−3x+4` | Cubic discriminants `−1620 = 3⁴(−20)` and `−324 = 3⁴(−4)` have unit residues 1 and 2 modulo 3. The first polynomial becomes `z³+3z²+6` after `x=z+1`, an Eisenstein cubic; the second has nonsquare discriminant | First field is cyclic cubic; second two-torsion splitting field has degree six, so the stated abelian qualification matters | Restricted F = ℚ₃(E[2]) to the abelian case |
| §1.16: local companion and its ramified twist | `E₀: y²=x³−3x+4`, `d=−3` | Twisted coefficients `(d²·(−3),d³·4) = (−27,−108)`; inertia subgroup `⟨ζ⟩` has 3 elements and `⟨ζ,−I⟩` has 6; at `ω(g)=2 ∈ 𝔽₃`, diagonal values `(1,2)` become `(2,1)` | The same companion orientation cannot be demanded after the excluded ramified twist | Applied §1.11 only to the normalized e = 3 representative |
| §6.3: global twist realizing the local normalization | The four local quadratic square classes | Representatives `1,−1,3,−3 ∈ ℚ^×` exhaust `ℚ₃^×/(ℚ₃^×)²`; each global quadratic character restricts to the corresponding local one, including η for −3 | A global normalized representative exists; it is the input used for both α and β | Made the global-to-local twist choice explicit |
| §6.4: exact inertial type | Case 3, and E₀'s −3 twist | On ξ the type values are `I` and `−I`; on wild inertia both retain order-three image, giving total inertia orders 3 and 6 | τ₋₁ and τ₋₁⊗η differ; cross-prime transfer preserves the distinction | Used the exact representative from §6.3 and added the exclusion Check |
| Supplier contract: selected ordinary quotient | Residual Tate flags at p = 3 and 5; reversed flag | Ordered inertia values `(2,1)` have quotient 1; reversal has quotient 2, a different label. At three the restriction hypothesis is retained; at five `5 ≠ 3` is true | Seed theorem's range and quotient both match | Added §5.10 and its actual hypotheses |
| §6.9: ordinary local sequence and seed at three | Split Tate curve; scalar quadratic twist; good reduction branch | `0→ℚ₃(ε₃)→V₃→ℚ₃→0` gives inertia diagonal `(2,1)`, determinant 2, quotient 1. Multiplication by η gives `(1,2)`; twisting twice restores `(2,1)` and `det` since η²=1 | Distinguishedness survives the correct choice of split representative; global irreducibility and modularity survive scalar twisting | Seed before full ordinary lifting, then untwist |
| §6.12: ordinary local sequence and seed at five | Split Tate curve; p = 2 negative control | At five, inertia diagonal `(2,1)` has determinant 2 and quotient 1; mod-five cyclotomic inertia has order 4. At two its order is 1 and values are `(1,1)` | Distinguishedness holds at five, not at two | Seed before lifting, using p ≠ 3 |
| Layer W3.6 dependencies and full ordinary scope | The two applications and the imaginary-quadratic induced case | Primes are 3 and 5, both greater than 2; determinant exponent is `k−1 = 1`, hence k = 2. Neither application imposes the restricted supplier's exclusion of imaginary quadratic induction | Full §I.1 remains the lifting contract; the seed is the imported refinement | Updated exact contracts and layer dependencies |

### Mechanically elaborated Lean signatures and unchanged headline controls

Compared all 16 `#check @name` outputs supplied with the job with the README statements. Mechanically compared the scratch file containing those 16 checks with `TauCetiRoadmap/EllipticCurveModularityWild3Adic/Suggested.lean`: its declaration source is identical, its checked names match all 16 declarations, and every name occurs in the README. No section binder was lost, no hypothesis or Lean signature changed, and no stand-in was added for the missing local-type, companion-curve or ordinary-seed carriers.

| Declaration | Instances and elaborated context | Computed values / comparison | Result and change |
|---|---|---|---|
| Q3 | Native `ℚ_[3]` | `3 ≠ 0`, residue characteristic 3, characteristic zero | Matches Conventions; unchanged |
| Q3bar | Native algebraic closure of Q3 | Includes solutions to `j²+1=0`; `j=0` gives `1 ≠ 0` and is excluded | Matches fixed closure; unchanged |
| cubeClass_coordinates | `y ≠ 0` retained; y = 1, 3, 4, 12, 0 | Coordinates `(0,0),(1,0),(0,1),(1,1)`; at y = 0 cube factor 0 permits all 9 pairs, so nonzero hypothesis is essential | README §1.1 and Lean agree; unchanged |
| cyclicCubicField | Arbitrary π, with no defining-polynomial hypothesis needed for the definition | π = 0 gives `Q3⟮0⟯ = Q3`, degree 1, while a root of §1.3 gives degree 3 | Real adjoin definition has the intended domain; unchanged |
| nonabelianCubicSplittingField | Arbitrary π, j; root equations belong to its theorem | π = j = 0 gives Q3; admissible roots give degrees 3 and 6 | No root hypotheses silently attached to the definition; unchanged |
| degreeTwelveSplittingField | Arbitrary s, j, α, β | All zero gives Q3; the field-generation definition alone promises no degree 24 | Field hypotheses occur in each theorem; unchanged |
| cyclicCubic_galois | hπ retained; substitution in `Q3[x]/(x³−3x²+3)` | `f(π²−2π)=0`; second image `3+π−π²`; third image π; `f(0)=3 ≠ 0` | Degree-three Galois target and generator match §1.3; unchanged |
| nonabelianCubic_finrank | hπ and hj retained | Eisenstein root degree 3; discriminant `−324 = −18²` has nonsquare unit −1; unramified quadratic gives `3·2=6` | Degrees 3, 6 and failure of normality match §1.4; unchanged |
| positiveQuadratic_finrank | hs, hj, hα, hβ retained | `v₃(α)=1/3`, `v₃(β)=1/4`, `v₃(α/β)=1/12`; residue degree at least 2 from j; upper bound `3·4·2=24` equals lower bound `12·2=24` | Exact degree 24 matches §1.5; unchanged |
| negativeQuadratic_finrank | hs = −3, hα = 4 and hβ = −s retained | `α−1` satisfies `X³+3X²+3X−3`, hence valuation 1/3; β⁴ = −3 gives valuation 1/4; `(α−1)/β` has valuation 1/12; upper and lower degree bounds both 24 | The negative sign and exact degree match §1.6; unchanged |
| extendedTypeField_finrank | i : Fin 3, and all four root equations retained | i = 0,1,2 gives radicands 3,12,21 of valuation 1; β has valuation 1/4; π = α/β has valuation 1/12; `−3(1+3i)⁴` gives −3, −768, −7203 | Three admissible indices, degree bounds both 24; unchanged |
| levelFiveConjugate | Unit t and x ∈ SL₂ retained | t = 2 sends `(1,1;0,1)` to `(1,2;0,1)`; t = 1 fixes `(1,1;1,2)` with determinant `2−1=1`; −I stays −I | Correct conjugation direction and real proof; unchanged |
| matrixHilbert90 | Field K, n ≥ 1, discrete-target continuity and cocycle law retained | Over ℝ, `B=(i,1;0,−i)` gives `B⁻¹B̄=(−1,−2i;0,−1)` and `c·c̄=I`; opposite order gives +2i instead. At n = 1 this is scalar Hilbert 90 | Actual matrix carriers and topology match §1.15; unchanged |
| specialLinearHilbert90 | Same retained context, SL rather than GL | For the same B, `det B=1`, `det c=1`; at n = 1, SL₁ has only 1, giving c = B = 1 | Determinant-one trivialization matches §1.15; unchanged |
| equivariantIcosahedralLift | Field, characteristic zero, injectivity and equivariance retained | Center −I has order 2 and projectivization 1; b(1)=I, so negating all values gives b(1)=−I and fails the homomorphism law | Central normalization, arbitrary compatible χ and native carriers match §1.15; unchanged |
| ellipticCurve_modular | Rational-fibre IsElliptic, NeZero N, prime and coprimality retained | For `y²=x³−x`, Δ = 64: at 3, `#E=4`, `a₃=3+1−4=0`; at 5, `#E=8`, `a₅=5+1−8=−2`; p = 2 is excluded | Good-index newform formulation matches §6.13, distinct from its stronger conductor and parametrization target; unchanged |

### Validation

Commit: `de00219` — `EllipticCurveModularityWild3Adic: review repairs (normalize case three, supply ordinary seeds, identify cubic norm fields)`. Only `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md` changed; no push was made.

`lake build TauCetiRoadmap.EllipticCurveModularityWild3Adic.Suggested` exited 0, with the ten expected admitted-theorem warnings and no errors. Exact outcome:

```text
Build completed successfully (9096 jobs).
```

The prescribed dependency-direction check exited 0, with no UPWARD or CYCLE line and no move:

```text
depcheck: 40 roadmaps, 410 edges, 0 problem(s)
```

The prescribed gate against origin/main exited 0 after the commit. Exact summary:

```text
gate EllipticCurveModularityWild3Adic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
