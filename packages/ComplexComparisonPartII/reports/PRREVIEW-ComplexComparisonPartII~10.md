# Review of ComplexComparisonPartII (pull request #848 at 1a0a82d)

**Verdict:** needs changes

Incremental re-review of the 34 changed lines since fa9bfa5 (README only; `Suggested.lean` is byte-identical to the head read at 1b08d06). The B1.5 attribution finding of the previous review is repaired: what SmoothBundlesConnections B1.5 supplies is now stated as pullback and restriction of the Ehresmann connection and its splitting, the chart pullback is C5.2's own clause on Mathlib's `Bundle.Trivialization.pullback`, and that declaration exists at the pin with the form the clause and its first Check describe. The gate, the dependency check and the elaboration pass. One finding remains, unchanged since the two previous reviews: the citations of DifferentialGeometry Layers 6, 8 and 9 name layers that the open revision of DifferentialGeometry drops, and neither the README nor the pull-request description says how that is reconciled (P2, carried).

## R01 (P2) — DifferentialGeometry Layers 6, 8 and 9 are cited, and the open revision of DifferentialGeometry drops them

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:697–699` ("Layer 6: `deRhamCohomology`; Layer 8: the de Rham theorem `deRhamEquiv`; Layer 9: Poincaré duality and `finiteDimensional_deRhamCohomology`"), `:2861–2862` (*Needs:* "TauCetiRoadmap.DifferentialGeometry (Layers 5, 6, 8 and 9)"), `:3620` ("DifferentialGeometry Layer 8's `deRhamEquiv`"), `:3631` (*Needs:* "DifferentialGeometry Layers 6–8"), `:4236–4237` (Dependencies: "Layers 0–2, 5, 6, 8, 9 and 12").

**Claim:** De Rham cohomology, the de Rham theorem and Poincaré duality are DifferentialGeometry Layers 6, 8 and 9.

**Witness:** True on main (eaf17b1: `TauCetiRoadmap/DifferentialGeometry/README.md:782` "Layer 6: the de Rham complex and cohomology", `:816` "Layer 8: the de Rham theorem", `:862` "Layer 9: Poincaré duality", `:874` `finiteDimensional_deRhamCohomology`). At the head of pull request #886 (a revision of DifferentialGeometry, a565de6, unchanged since the previous two reviews) the layer headings are 0, 1, 2, 3, 4, 5, 5.6 and 12 only (its README:289–1205), and its README:263 and :1379 say that de Rham cohomology is DeRhamCohomologyAndDuality's, "none of them is a target here". The overlap check at today's index still lists Layer 6 (line 3631) and Layer 8 (line 3620) as ids #886 no longer defines. DeRhamCohomologyAndDuality is in the merge order at line 381, after this roadmap at line 39, so it cannot be cited here (that would be an UPWARD edge); at its own head (#1768, now 1b57dbe) it still consumes "DifferentialGeometry 6 and 8" (its README:196), so the two open pull requests disagree with each other about the owner, and the only owner this roadmap may cite is DifferentialGeometry as it stands on main. Nothing in this change set addresses it, and the pull-request description's merge-order paragraph names neither DifferentialGeometry nor DeRhamCohomologyAndDuality. Six roadmaps on main cite the same layers (SmoothBundlesConnections, LocalVariationalFieldTheory, LieGroupoidsPoisson, HeegaardFloer, SymplecticGeometry, Orbifolds; for example `TauCetiRoadmap/Orbifolds/README.md:566` "DifferentialGeometry 8.4–8.5"), so #886 breaks those at its merge whatever this roadmap does; that does not remove this roadmap's duty to say so.

**Repair:** No README change: the citations are correct against main, and no earlier owner exists. Add one sentence to the pull-request description's merge-order paragraph: the README consumes `deRhamCohomology`, `deRhamEquiv` and `finiteDimensional_deRhamCohomology` from DifferentialGeometry Layers 6, 8 and 9 as they stand on main; the open revision #886 of DifferentialGeometry removes those layers in favour of DeRhamCohomologyAndDuality, so #886 (or DeRhamCohomologyAndDuality, if the objects move there and it moves ahead of this roadmap in the merge order) must be reconciled with these citations before both merge. Do not add DeRhamCohomologyAndDuality to any *Needs:* line, supplier entry or Dependencies list. Carried from the previous review (its R01) and the one before (its R02), unchanged in substance.

## Previous findings

- R01 — not repaired: README:697–699, 2861–2862, 3620, 3631 and 4236–4237 are unchanged, and the pull-request description is silent on DifferentialGeometry and #886. Carried as R01 above.
- R02 — repaired: README:143 ("locally trivial smooth fibre bundle with product charts; pullback and restriction of the Ehresmann connection"), :706–709 ("pullback and restriction of the Ehresmann connection and its horizontal–vertical splitting"), :3004–3008 (the same) and :3029–3032 (*Needs:* "product charts; pullback and restriction of the connection") now attribute to B1.5 exactly what `TauCetiRoadmap/SmoothBundlesConnections/README.md:518–519` states ("pullback and restriction preserve that splitting"); the chart pullback stays C5.2's own clause at :3022–3028, now on `Bundle.Trivialization.pullback`, which is in the *Needs:* line at :3032. No new problem introduced (see the adversarial row below).

## Verified sound

**Gate and dependency check.** My own run of the gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, agreeing with the worker's (which adds `build=0`). The dependency check with `--movable`, complete output:

```text
depcheck: 240 roadmaps, 2370 edges, 0 problem(s)
```

No UPWARD, CYCLE, `moved:` or `not movable` line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. No declared gaps (no readable `design/plan.json`); nothing in the change set should have been one.

**Elaboration, signatures and padding.** `lake env lean` on `Suggested.lean` from the worktree: exactly three `declaration uses sorry` warnings (lines 66, 77, 92), exit 0. `git diff 1b08d06..HEAD -- Suggested.lean` is empty, so the worker's elaborated signatures of `montelTheorem`, `schwartzFiniteness` and `nonempty_sheafSingularComparison` are those of the previous two rounds, with no section binder lost, and equal the README statements at :1652–1659, :1677–1680 and :2826–2832. The one-tactic probe and the headline/padding assessment of the previous reviews stand unchanged (no declaration closes in one tactic, nothing restates a definition or mirrors a Check; the unstatable headlines are named in the module docstring with the missing analytification carrier).

**Changed passages read in full.** README:138–146 (ownership table row for Ehresmann), :696–711 (DifferentialGeometry and SmoothBundlesConnections supplier entries), :2999–3046 (C5.2 `ehresmannFibration`: the consumed smooth statement, the holomorphic application, the base-change clause, its *Needs:* line and its four Checks), :3047–3055 (`relativeBettiLocalSystem`, which consumes it). The base-change clause's "submersion fibre-product manifold" and the Deligne 1970 I.2.24–2.25 locator predate this change set and were read by the previous full review. The InverseGaloisAndArithmeticFundamentalGroups consumer of `ehresmannFibration` (#850) is unaffected: the target's name and statement are unchanged.

**Library declarations opened at the pins (file and line).** `Bundle.Trivialization.pullback` (`Mathlib/Topology/FiberBundle/Constructions.lean:305`, inside `namespace Bundle.Trivialization`, so the README's fully qualified name is the pin's): for `e : Trivialization F (π F E)` and a continuous `f : B′ → B` it is a `Trivialization F (π F (f *ᵖ E))` with `toFun z = (z.proj, (e (Pullback.lift f z)).2)`, `baseSet = f ⁻¹' e.baseSet`, and `invFun y = TotalSpace.mk' F y.1 (e.symm (f y.1) y.2)`; it is topological only (continuity in both directions, no smooth structure), under `[∀ b, Nonempty (E b)]`. `FiberBundle.pullback` (`:345`) gives the pulled-back atlas `{e.pullback f}` with `trivializationAt x = (trivializationAt F E (f x)).pullback f`. Mathlib pin `1b1ccf4b`, Tau Ceti pin `2fd255d9` (`lake-manifest.json`).

**Cross-roadmap citations resolved (copy named each time).** SmoothBundlesConnections B1.5 on main (`README.md:498–537`: the connection, "pullback, restriction and local horizontal lifts" at :505–506, the API bullets at :518–523 including "pullback and restriction preserve that splitting" and "local transport gives smooth product charts and diffeomorphisms between fibres on each connected component", the disconnected-base and non-proper Checks at :533–536) and B1.0 (`:221`); DifferentialGeometry Layers 6, 8, 9 on main (`README.md:782, 816, 862, 874`) and their absence at the #886 head (a565de6, `:289–1205`); DeRhamCohomologyAndDuality at the #1768 head (1b57dbe, `:196`) and in the merge order (`ORDER.txt:381`; this roadmap `:39`; SmoothBundlesConnections `:8`); Orbifolds on main (`README.md:566`). The citations lead lists no cross-roadmap citation found nowhere; its 39 Lean-name leads are supplier declarations of roadmaps still in pull requests, resolved by the earlier full review and untouched here.

**Ownership against open pull requests.** The change set introduces no new object and moves none: it corrects the description of what B1.5 supplies and names the Mathlib declaration the base-change clause uses. The overlap file lists no other open pull request changing this roadmap and no id only an open revision defines; the two dropped ids it lists are R01. The closest roadmaps in vocabulary are the five open ComplexKahlerGeometry revisions (#1234, #1398, #1807, #1808, #1854), all of a roadmap on main that this README cites as on main. Open pull requests whose files the brief does not list were searched only through the tool.

**Seeded sample.** None of the fifteen seeded targets' statements or locators is in the change set (the only C5.2 change is `ehresmannFibration`, not `holomorphicConnectionDictionary`); the earlier full review's sample table, which read each locator in the cached texts, carries forward unchanged. The one locator in the changed lines, tom Dieck Theorems 2.2.1, 2.2.3 and Corollary 2.2.4 (README:3007–3008, cited "for the statement consumed"), is as before under *Not verifiable*.

**Computed adversarial pass.** The row for the changed statement is new (base change with the pinned pullback); the others carry the previous reports' values (r9 for the two C5.2 rows, r8 for the rest).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `ehresmannFibration`, base change through `Bundle.Trivialization.pullback` | `g = id`; `g` constant at `s`; `g = h ∘ k`; `P¹ × S → S` pulled back along `g`; `g : S′ → S₁` into one component of `S₁ ⊔ S₂` | pin's `toFun z = (z.proj, (φ (lift g z)).2)` on `baseSet = g⁻¹(V)`, i.e. `(v′, t) ↦ (v′, pr₂ φ(t))` as the Check at :3036–3037 says; `g = id` gives `φ` itself (`lift id = id`); constant `g` gives `S′ × f⁻¹(s)` with `baseSet = S′` when `s ∈ V`, `∅` otherwise; `(h∘k)^* = k^* h^*` since `lift (h∘k) = lift h ∘ lift k`; the fibre is `S₁`'s model `f⁻¹(s₁)`, never `S₂`'s; the pin gives continuity only, smoothness is `(v′, t) ↦ (v′, pr₂ φ(t))` on the fibre-product manifold, which the clause proves itself ("prove the identity and composition comparisons") and does not attribute to Mathlib | Pass |
| `ehresmannFibration`, what is consumed from B1.5 | product connection on `M × F`; `∂_x + y²∂_y` on `ℝ² → ℝ`; `pr₁ : ℝ² ∖ {0} → ℝ` | horizontal–vertical sum is the identity, pullback of the product connection along any `g` is the product connection on `g^*(M × F)`; transport `y ↦ y/(1 − xy)`, incomplete, so the connection pullback carries no chart; non-proper fibres `ℝ ∖ {0}` and `ℝ`, so properness is needed for the charts, which B1.5's third bullet supplies | Pass (attribution now matches `SmoothBundlesConnections/README.md:518–523`) |
| `ehresmannFibration`, holomorphic application | r9: `P¹ × S → S`; `z ↦ zⁿ` on `ℂ*`; `z ↦ iz`; `S₁ ⊔ S₂` with `P¹` and elliptic fibres; `pr₁` on `ℂ² ∖ {0}` | r9: product chart; real derivative `n|z|ⁿ⁻¹ · rotation`, fibre `n` points, deck group `ℤ/n`; `[[0,−1],[1,0]]`, determinant `1`; `χ(P¹) = 2 ≠ 0 = χ(E)`; non-proper fibres `ℂ*` and `ℂ` | Pass (r9) |
| Riesz theory as cited | r9: `ℓ²(ℂ)`, `K = diag(1/n)`, `C = 1` | r9: kernel and cokernel of `1 − K` of dimension `1`, range closed; estimate with `C = 1` by the triangle inequality | Pass (r9) |
| `snc_exists_polydiscChart` | r9: `xy = 0` in `ℂ²`; `(u,v) ↦ (u + v², v)`; `b = 0`; dimension `0` | r9: Jacobian determinant `1`, inverse `(u − v², v)`; plain polydisc; the point | Pass (r9) |
| `riemannSurfaceAtlas C` | r8: `P¹`; `G_m`, `A¹` with `z ↦ z²`; nodal cubic; doubled origin | r8: `z ↦ 1/z` biholomorphic on `ℂ*`; derivative `2z`, zero at `0`; node not smooth; non-Hausdorff excluded | Pass (r8) |
| `T_C` connected for proper connected `C` | r8: `P¹`; `P¹ ⊔ P¹` | r8: `H⁰ = ℂ` resp. `ℂ²` | Pass (r8) |
| codimension-one points = closed points | r8: integral curve | r8: coheight `1` versus `0` | Pass (r8) |
| `functionFieldToMeromorphic C` | r8: `P¹`, `z`; `E : y² = x³ − x` | r8: `ord_0 z = 1`, `ord_∞ z = −1`; `ord_{(0,0)} x = 2`, `ord_∞ x = −2`, `ord_∞ y = −3` | Pass (r8) |
| injectivity / surjectivity | r8: `1/z` on `P¹`; `exp` on `A¹` | r8: `L([0]) = span{1, 1/z}`; `exp ∉ ℂ[z]` | Pass (r8) |
| `picardAnalytification` | r8: `P¹`, `D = ∞, 0`, `O(−1)`; `E ∖ {∞}` | r8: `h⁰ = 2, 1, 0`; non-injective without properness | Pass (r8) |
| `O_{T_C}`-linearity of `divisorSheaf D^an` | r8: `D(p) > 0`, `f(p) = 0` | r8: `ord(fg) ≥ −D(p)` | Pass (r8) |
| universes | r8: `u = 0`, `u > 0` | r8: `ULift.ringEquiv` | Pass (r8) |
| `montelTheorem` | r8: `Ω = ∅`; `dim E = 0`; `f_n = n`; `ℓ²`; `zⁿ` | r8: `g = 0`; Bolzano–Weierstrass; `hb` fails; excluded by `FiniteDimensional`; `rⁿ → 0` | Pass (r8) |
| `schwartzFiniteness` | r8: `h = 0`; `g = id, h = −K`; `pr₁`; `ℓ¹ ↪ ℓ²`; `h = −id` | r8: quotient `0`; Riesz; codimension `0`; not surjective; compact only in finite dimension | Pass (r8) |
| `nonempty_sheafSingularComparison` | r8: point; `∅`; Cantor set; 5-point space | r8: `A`/`0`; `0`/`0`; `C(K,A) ≠ A^K`; isomorphism holds | Pass (r8) |
| `IsDifferentialOperator` | r8: `k[z]`, `m = 1`; `p = 2`; `p = 3` | r8: `[d/dz, z] = id`; `(z+t)² = z² + t²`; `t³`-coefficient of `(z+t)⁴` is `z` | Pass (r8) |
| `holomorphicConnectionDictionary` | r8: `e′ = eg`; `h = g⁻¹`; `d + z dw`; rank `0` | r8: `A′ = g⁻¹Ag + g⁻¹dg`; curvature `dz ∧ dw`; zero | Pass (r8) |
| `artinDeRhamBetti` | r8: `A = ℂ`; `ℂ[ε]/ε²`, `P¹_A`; `Spec A` | r8: lengths `2, 0, 2`; `A` in degree `0` | Pass (r8) |
| `CurrentCalculus` signs | r8: `T_α`; `[Z]`; `α ∧ η`; `[a]` | r8: `(dT)(η) = (−1)^{k+1}T(dη)`; `d[Z] = (−1)^{2n−dim Z+1}[∂Z]`; mass `1` | Pass (r8) |
| `realComplexCurrentComparison` | r8: disc; segment; `q = 0` | r8: `dJ₂[D] = −J₁[∂D]`; `dJ₁[a,b] = J₀(δ_b − δ_a)`; `0` | Pass (r8) |
| `AnalyticLogDifferentials` | r8: `ℂ{z,ε}/(ε²)`; log point; algebraic derivation | r8: `ε dε = 0`; `ℂ·dlog t`; chain-rule violation | Pass (r8) |
| `complexAlgebraicTopology` | r8: node; `A¹`; doubled origin | r8: contractible cone; contractible noncompact; non-Hausdorff | Pass (r8) |
| `riemannExistence` | r8: `z ↦ zⁿ`; nilpotent thickening | r8: deck group `ℤ/n`; same finite étale site | Pass (r8) |
| `artinComparisonMap` on `G_m` | r8: `Λ = ℤ/n`, `K = Λ(1)`; `n = 2`; degree `0` | r8: `H¹_ét ≅ ℤ/n`; `ζ_n` versus `ζ_n⁻¹` differ iff `n ≥ 3`; `μ_n(ℂ)` | Pass (r8) |
| `IsIso (artinComparisonMap)` ⇔ `IsIso (etaleAnalyticUnit)` | r8: affine étale `U → X`; degree `0` | r8: cover-dense `AffineEtale`; `ε^*` exact | Pass (r8) |
| `artinComparisonCompactSupport` | r8: `A¹`; conjugation on `P¹` | r8: `H^•_c = (0, 0, Λ(−1))`; `−1` on `H²_c` | Pass (r8) |
| `artinSmoothTrace` | r8: `P¹ → pt`; `A¹ ⊔ A¹`; `A² → A¹ → pt` | r8: `tr c₁(O(1)) = 1`; `Λ² → Λ` addition; iterated trace | Pass (r8) |
| `adicArtinComparison` | r8: reductions; torsion object; `P¹` | r8: mod `ℓⁿ` recovers the finite case; `⊗ ℚ_ℓ = 0`; rank `1`, trace `1` | Pass (r8) |
| `properSchemeGagaEquivalence` | r8: dual-number points; `A¹` | r8: `ε` retained; `exp z` not algebraic | Pass (r8) |
| `globalSectionsEquivRiemannRochSpace` | r8: smooth proper curve over `ULift ℂ` | r8: all seven hypotheses hold | Pass (r8) |

**Policy.** The change set adds no copied passage, algorithm, `set_option`, sorry'd data, `lemma`, pull-request number, process word or machine path. The one *Needs:* line it touches names a roadmap on main (SmoothBundlesConnections B1.5), ComplexManifolds on main, this roadmap's §C-1.1 and four pinned Mathlib declarations.

## Not verifiable

- tom Dieck, *Differential Manifolds* (lecture notes, January 2009), Theorems 2.2.1, 2.2.3 and Corollary 2.2.4, pp. 52–53 (README:3007–3008, 3054): as in the previous review, the sources service finds no legal copy; recorded in the job's `needs-references.toml` by the previous review. The statement it is cited for is the one consumed from SmoothBundlesConnections B1.5, whose own locator is Kolář–Michor–Slovák Lemma 9.2.
- Kato 1989 (C5.5), Katz–Oda 1968 (C5.2), Hironaka 1975, Bochnak–Coste–Roy, Dimca, Whitney, Knutson, Hatcher: as in the previous reviews, untouched by this change set.
- Deligne 1970 II.5.3 print misnumbering (README:4052): not checked, as before.

## Source issues

- none
