# Review of SmoothBundlesConnections (pull request #887 at c610088)

**Verdict:** needs changes

Incremental re-review of the 110 lines changed since fb494e6 (README B1.4, B3.2, B4.2, B5.2, B6.1, B8.1, B8.3, References; Suggested.lean docstring and the new quotient headline). The previous review's findings were checked first; the changed passages were reviewed in full against their sources and the pinned libraries; the gate, the dependency check and the elaboration were run again.

## R01 (P1) — The ComplexKahlerGeometry supply cycle is unchanged

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:178`, “K5a: … the linear elliptic and Sobolev theory and the compact real Hodge theorem (consumed only by B8)”; the K5a `*Needs:*` items at lines 1884, 1937 and 1971; the K7.1 consumption at lines 1625 and 1651.

**Claim.** ComplexKahlerGeometry K5a and K7.1 are suppliers of this roadmap.

**Witness.** On main (9c6e95d), `TauCetiRoadmap/ComplexKahlerGeometry/README.md:571` says K5a “uses DifferentialGeometry, SmoothBundlesConnections B2–B4”, and line 580 “Consume SmoothBundlesConnections B2's RCLike L² section construction”. Here B8.1–B8.3 consume K5a. The two roadmaps supply each other: a directed two-cycle. The dependency check (`depcheck: 208 roadmaps, 1452 edges, 0 problem(s)`) reads only this README's edges and treats a roadmap on main as earlier than every open pull request, so it cannot see the reverse edge; the cycle is nonetheless real in the two READMEs.

**Repair.** As in the previous review: move the K5a-dependent Yang–Mills layer B8 and the K7.1-dependent `ℂP¹` Hopf normalization of B6.2 into a later roadmap, “SmoothBundlesConnections, Part II”, whose introduction says where this roadmap stops; keep B1–B7 (minus the K7.1 use) here, with the Hopf normalization stated there on ComplexKahlerGeometry's carrier. Delete the K5a and K7.1 row entries, the “B8 consumes … K5a” sentence of the build description (line 192), the Scope deferral clause at line 57 and the three K5a `*Needs:*` items. The resulting graph is SmoothBundlesConnections → ComplexKahlerGeometry → Part II, with no reverse arrow. `Re-raised: R01 of the previous review` (not marked not actionable by any repair report).

## R02 (P1) — The DGFloer supply cycle is unchanged

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:176`, “DGFloer | Layer 1.1: the degree-one Hurewicz isomorphism”; `*Needs:*` items at lines 1619 and 1699; the Layer 6 dependencies sentence at line 1778.

**Claim.** DGFloer Layer 1.1 is an earlier supplier of the B6.1 and B6.4 comparisons.

**Witness.** On main, `TauCetiRoadmap/DGFloer/README.md:158` lists “SmoothBundlesConnections B1.4. Proper free-action smooth homogeneous quotients, principal projections and tangent quotients” as a supplier of its Layer 1 item 7, and line 453 owns “Hurewicz in degree one” (AlgebraicTopology line 108 also consumes it from DGFloer, so there is no earlier owner to repoint to). SBC B1.4 → DGFloer 1.1 → SBC B6.1 is a directed two-cycle.

**Repair.** Move the targets of B6.1 and B6.4 that use the degree-one Hurewicz isomorphism (the Čech–singular comparison's identification of `H¹(M;ℝ/ℤ)` with `Hom(π₁(M),ℝ/ℤ)` and the flat-dictionary comparison) into the Part II of R01, importing DGFloer 1.1 there by name; keep B1.4 and the Hurewicz-free parts of B6 here so that DGFloer's own supplier (B1.4) does not depend on the moved targets. Delete the DGFloer row, the Scope clause at line 53, and the two `*Needs:*` items. `Re-raised: R02 of the previous review`.

## R03 (P3) — Delete the auxiliary calculus acceptance file

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/TransportDerivativeTargets.lean:1–3` (three `Mathlib.<submodule>` imports) and line 22, `hasDerivAt_inverse_transport_section`.

**Claim.** This file states a headline theorem of the roadmap.

**Witness.** The statement quantifies over a function `P : ℝ → F ≃L[ℝ] F`, a section `σ : ℝ → F` and an operator `A`, none of which is a bundle, connection or transport functor; it is the B5.1 Check “for P(t)=exp(−2t), σ(t)=3+5t the derivative at 0 is 11 = 5 + 2·3” (README lines 1161–1163), and its imports are the submodule lines the Lean form rules refuse for a listed `.lean` file. Unchanged since the previous review.

**Repair.** Delete `TransportDerivativeTargets.lean`; the README keeps the calculation as a Check. Do not prove it in place. `Re-raised: R05 of the previous review`.

## Previous findings

- R01 — not repaired: README 178 still lists ComplexKahlerGeometry K5a/K7.1 as suppliers and B8.1–B8.3 still carry K5a `*Needs:*` items; CKG main 571/580 still consumes SBC B2–B4. Re-raised as R01.
- R02 — not repaired: README 176, 1619, 1699 and 1778 still consume DGFloer Layer 1.1; DGFloer main 158 still consumes SBC B1.4. Re-raised as R02.
- R03 — repaired: README 988–990 now reads “the inverse-pullback left action is `u·A=Ad(u)A−du·u⁻¹` and `F_(u·A)=Ad(u)F_A`”, the pullback right action keeps `Ad(u⁻¹)`, B8.1 line 1879 agrees, and the SO(3) torus Check (lines 1018–1022) computes `Ad(g)X=Y`, `Ad(g⁻¹)X=−Y` with equal norms. Freed (1.18)–(1.19) support the right-action formulas (freed lines 376–378).
- R04 — repaired: `Suggested.lean:99` `exists_freeProperQuotient_isSubmersion` states the native-carrier existential quotient theorem at the generality the previous review verified; README 417–424 describes exactly its hypotheses and conclusion; two degenerate Checks (trivial group, empty source) were added at lines 445–449.
- R05 — not repaired: `TransportDerivativeTargets.lean` is unchanged. Re-raised as R03.
- R06 — partly repaired: the Donaldson locator now reads “§2.2, p. 3” (lines 1943, 2033–2035); the refinement homotopy is displayed with the convention `T_s−T_r=δh+hδ` and the Check `hδ(2,5)=5−2=3` (lines 1465–1470, 1482–1485); B3.2 now cites KMS Theorem 10.18(1)–(2), §11.1 and the proof of Theorem 11.2 (lines 885–888); the countability paragraph cites KMS proof of Theorem 9.11, Step 4, p. 85 (lines 1203–1206). No `sources.toml` was added; no roadmap folder on main carries one (0 of 125), so this is noted, not re-raised.

## Verified sound

**Gate and build.** The worker's gate at this head ends `build=0 OK` with every scanner at 0. `lake env lean` on `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean` succeeds with exactly six `declaration uses 'sorry'` warnings (lines 70, 99, 156, 163, 206, 216) and nothing else. The diff outside the folder against origin/main is empty. The dependency command returned exactly

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; SmoothBundlesConnections is at merge-order line 7. R01–R02 are the manual counterexamples to that output, through edges in main's READMEs that the check does not read.

**Signatures.** The worker's elaborated signatures of the 11 declarations show no dropped section binder; the “on” entry at line 47 is a parser false positive inside the module docstring. For the new theorem the elaborated type carries `FiniteDimensional` on both models, `Boundaryless` on both, `IsManifold I ⊤ M`, `T2Space`/`SecondCountableTopology` on M and G, `LieGroup IG ⊤ G`, `MulAction`, `ProperSMul`, the smoothness and freeness hypotheses, and concludes with an existential `ChartedSpace (Fin (finrank E − finrank EG) → ℝ)` on `MulAction.orbitRel.Quotient G M` under which `IsManifold` holds and `Quotient.mk''` is `Manifold.IsSubmersion I 𝓘(ℝ, Fin _ → ℝ) ⊤`; this matches README 417–424 word for word (quotient topology is the instance `instTopologicalSpaceQuotient` on the setoid quotient).

**One-tactic probe on the new headline** (scratch copy, same pins): `simp` makes no progress; `rfl`, `infer_instance`, `exact ⟨inferInstance, inferInstance, inferInstance⟩` and `constructor <;> infer_instance` all fail, the failure being “failed to synthesize ChartedSpace (Fin … → ℝ) (MulAction.orbitRel.Quotient G M)”. The pinned `MulAction.instChartedSpaceQuotient` (`Mathlib/Geometry/Manifold/Instances/Quotient.lean:49`) requires `ProperlyDiscontinuousSMul`, `ContinuousConstSMul`, `IsCancelSMul`, `T2Space`, `LocallyCompactSpace` and only models the quotient on the same `H`; it does not fire for a positive-dimensional group and does not give the dimension drop. The theorem is not padding and not already in the library. The five previously admitted theorems are unchanged and were probed in the previous review.

**Adversarial computations.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the previous review (PRREVIEW-SmoothBundlesConnections~3), whose table of 87 rows stands for them.

| Statement / location | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Free proper quotient headline, Suggested.lean 99 / README 417 | G = 1 on M | orbit space ≅ M; `Quotient.mk''` bijective; dimension `dim M − 0 = dim M`; submersion = local diffeo | Statement true | None |
| Same | ℤ (0-dimensional Lie group, model `Fin 0 → ℝ`) acting on ℝ by translation | stabilizers trivial; `(g,x) ↦ (g•x, x)` proper (preimage of `[−R,R]²` meets finitely many g); quotient ℝ/ℤ; dimension `1 − 0 = 1`; projection a covering, hence submersion | Satisfies the existential conclusion | None |
| Same, empty source | M = ∅ of model dimension 0, G of dimension 1 | orbit space ∅; natural subtraction `0 − 1 = 0`; ChartedSpace with empty atlas; IsManifold and IsSubmersion vacuous | Natural subtraction harmless; matches README Check 448–449 | None |
| Same, dimension bookkeeping | M nonempty, free smooth action | orbit map `g ↦ g·x` has derivative kernel `Lie(G_x) = 0`, so `dim G ≤ dim M`; natural subtraction exact | No hidden hypothesis needed | None |
| Same, properness negative control | irrational linear ℝ-flow on T² | stabilizer 0 (free); orbits dense; `(g,x) ↦ (g•x,x)` has non-compact preimage of a compact set, so `ProperSMul` fails; quotient non-Hausdorff | Hypothesis excludes it; README Check 455–456 | None |
| Same, wrong model | discrete-case instance `instChartedSpaceQuotient` | requires `ProperlyDiscontinuousSMul`, models quotient on H with `dim = dim M`; for Hopf `Circle ↷ S³` it gives nothing, while the headline demands `3 − 1 = 2` | Headline is the general theorem, not the pinned instance | None |
| Gauge left action, README 988–990 | constant g, `A = sin(x) X dy` on trivial SO(3) bundle | `F_A = cos(x) X dx∧dy` (`[A∧A] = 0`); left action `Ad(g)A − dg·g⁻¹ = Ad(g)A`, so `F = cos(x) Ad(g)X dx∧dy`; at x = 0, g = rotation π/2 about z: `Ad(g)X = Y`; pullback `Ad(g⁻¹)X = −Y`; squared norms 1 and 1 | Both formulas and the Check agree; the wrong `Ad(u⁻¹)` of fb494e6 is gone | None |
| Left action as inverse pullback | u arbitrary | `(Φ_{u⁻¹})^*A = Ad(u)A + u·d(u⁻¹) = Ad(u)A − du·u⁻¹` since `d(u⁻¹) = −u⁻¹ du u⁻¹` | Agrees with the stated formula | None |
| Gauge generators, README 990–991 | `u = exp(tξ)` | pullback: `d/dt(Ad(u⁻¹)A + u⁻¹du) = −[ξ,A] + dξ = d_Aξ`; inverse pullback: `[ξ,A] − dξ = −d_Aξ` | Consistent | None |
| Freed (1.18)–(1.19) versus README | right pullback by gauge ϕ with `g_ϕ = u` | source: `ϕ^*Θ = Ad(g⁻¹)Θ + g^*θ`, `ϕ^*Ω = Ad(g⁻¹)Ω`; README: `Ad(u⁻¹)A + u⁻¹du`, `Ad(u⁻¹)F` | Locator and formulas match (freed lines 376–378, PDF/printed p. 9) | None |
| Torus example, README 1030–1035 | `u = exp(i(mx+ny))`, real potential `A = a dx + b dy` | pullback adds `u⁻¹du = i(m dx + n dy)`, i.e. `A ↦ A + m dx + n dy`; `a = 1`: holonomy `exp(−2πi) = 1` | “Under the pullback right action” is the correct label | None |
| B8.1 gauge invariance Check, README 1879–1882 | SO(3) example at x = 0 | `|Ad(g)X|² = |Y|² = 1 = |−Y|²`; `|F|²` unchanged under either action | Energy invariant; sign distinguishes the actions | None |
| Refinement homotopy, README 1465–1468 | degree 0: `α ∈ C⁰(U)`; h = 0 on degree 0 | `(hδα)_{j₀} = (δα)_{r j₀, s j₀} = α_{s j₀} − α_{r j₀} = (T_s α − T_r α)_{j₀}` | `T_s − T_r = δh + hδ` holds in degree 0 | None |
| Same, degree 1 | `α ∈ C¹(U)` | `δhα = α_{r j₁ s j₁} − α_{r j₀ s j₀}`; `hδα = α_{s j₀ s j₁} + α_{r j₀ s j₀} − α_{r j₁ s j₁} − α_{r j₀ r j₁}`; sum `= α_{s j₀ s j₁} − α_{r j₀ r j₁}` | Equals `T_s α − T_r α`; convention consistent | None |
| Refinement Check, README 1482–1485 | `U = (X,X)`, `V = (X)`, r = 0, s = 1, `α = (2,5)` | `hδα = (δα)_{0,1} = 5 − 2 = 3`; `T_s α − T_r α = 5 − 2 = 3`; `T_r − T_s = −3` | Check true; discriminates the sign | None |
| Stacks Tag 09UY displayed equation | same instance with Stacks' `c = r`, `c′ = s` | source equation `γ − γ′ = dh + hd` gives `γα − γ′α = −3` but `hdα = 3` | Source sign slip, recorded below; README states the correct sign | None |
| Atiyah bracket defect, README 882–888 | horizontal X^h, Y^h; KMS proof of 11.2 | KMS: `R(X,Y) = ζ_{ω([X,Y])}` and `Ω(X,Y) = −ω([X,Y])` for horizontal X, Y; so `Φ[X^h,Y^h] = −ζ_{Ω(X^h,Y^h)} = −V_{F(X,Y)}`; `[X^h,Y^h] = [X,Y]^h − V_{F(X,Y)}` | Identity and locator agree (kms lines 4678–4679, printed p. 101) | None |
| Atiyah sequence constructions, README 885–887 | KMS 10.18(1)–(2) | (1) `(TP, Tp, TM, TG)` principal; (2) `VP ≅ P × 𝔤` (kms lines 4577–4580, printed pp. 98–99); §11.1 lines 4612–4636 printed pp. 99–100 | Locators correct | None |
| Countability locator, README 1203–1206 | KMS Theorem 9.11 proof Step 4 | kms lines 3936–3940, header “85” at line 3924: `Hol/Hol⁰` countable since `π₁(M)` countable by Morse theory | Locator correct; README owns the cover argument it says KMS does not give | None |
| Countability cover argument, README 1193–1203 | torus with two-chart cover; Hawaiian earring | torus: cover members simply connected, overlaps with finitely many components, words in finitely many connecting paths surject onto ℤ²; earring: not locally simply connected, π₁ uncountable | Hypotheses necessary and sufficient as stated | None |
| Conformal invariance locator, README 1943 | `g′ = e^{2φ}g`, n = 4 | energy density factor `e^{(4−4)φ} = 1`; Donaldson states it at §2.2 (donaldson-gauge line 209, PDF p. 3) | Locator corrected | None |
| Quotient-manifold B1.4 Checks, README 445–449 | trivial group; ℤ on ℝ; empty source | `dim M − 0 = dim M`; `1 − 0 = 1`; `0 − 1 = 0` | All three values correct | None |
| Carried rows (untouched statements) | as in the previous report's table | regular fibres, Ehresmann, L², connections, curvature, transport, holonomy, good covers, Čech coordinates, augmentation, coefficient sequences, circle classification, Chern–Weil, torsors, Yang–Mills variations, symbols, spectral realization | Unchanged at this head | None |

**Pinned-library declarations opened this round** (paths relative to the library repository):

| Declaration | File and line at the pin | What was verified |
|---|---|---|
| `MulAction.instChartedSpaceQuotient` | `Mathlib/Geometry/Manifold/Instances/Quotient.lean:49` | Needs properly discontinuous, cancellative, continuous action with T2 locally compact M; model stays `H`. Not the free proper theorem. |
| `Manifold.IsSubmersionAt`, `IsSubmersion` | `Mathlib/Geometry/Manifold/Submersion.lean:171`, 538 | Existential complement and product charts in the two maximal atlases; argument order source model, target model. The headline's order `I`, `𝓘(ℝ, Fin _ → ℝ)` is right. |
| `ProperSMul` | `Mathlib/Topology/Algebra/ProperAction/Basic.lean:54` | Properness of `(g,x) ↦ (g•x,x)`, as in the previous review. |

Searches by object in both pinned trees (`ProperSMul` in `Mathlib/Geometry`, `orbitRel.Quotient` in Tau Ceti) found no smooth-quotient theorem for positive-dimensional groups: Tau Ceti's hits are combinatorial orbit quotients.

**Ownership.** `roadmaps grep` for `ProperSMul`, `orbitRel` and `free proper` across the 440 open pull requests and main: the only roadmaps naming a free proper smooth quotient theorem are consumers citing SmoothBundlesConnections B1.4 (TangentialBordism lines 43, 123, 406, 2122; DGFloer main 158; LieGroups #1051 line 731 uses it for `G/H`). SymplecticGeometry, PseudodifferentialOperators, RiemannianGeometry and FuchsianOrbifolds use only the discrete properly discontinuous case. This roadmap is the owner of the quotient headline; no `Suggested.lean` elsewhere declares a name in `TauCetiRoadmap.SmoothBundlesConnections`. Open pull requests not among the brief's sibling checkouts were read only through `roadmaps grep`.

**Seeded sample.** The five seeded targets (“Sheaves and exactness”, “Native fixed-cover complex and the displayed coordinates”, “Augmentation is a separate, conditional comparison”, “Raw refinement maps and homotopies”, “Coefficient maps and the connecting morphism”) are unchanged at this head except the refinement-homotopy passage, re-verified above against stacks lines 1066–1079 (Tag 09UY, PDF p. 24). Their other locators were verified in the previous review and the cited texts are unchanged. No locator is flagged unverified in the README.

**Sources read this round** (line-numbered extractions of legal copies): stacks (Stacks Project cohomology chapter) lines 1066–1079; kms (Kolář–Michor–Slovák, author page) lines 3834–3960 and 4569–4720, printed page = PDF page − 3; freed (arXiv hep-th/9206021) lines 363–385; donaldson-gauge (author-hosted copy) lines 188–215; meinrenken (author page) lines 293–313, Theorem 1.21: proper free action gives a unique smooth structure with submersive quotient map and a principal bundle.

## Not verifiable

- **lee-sm, lee-rm, kobayashi-nomizu:** unchanged from the previous review; no legal text was found and no changed passage depends on them.
- The absence of a `sources.toml` was not treated as a defect: no roadmap folder on main (0 of 125) carries one.

## Source issues

- **Misprint** in stacks at §15, Tag 09UY, printed p. 24: the source says the displayed insertion homotopy satisfies γ−γ′=dh+hd; it should be γ′−γ=dh+hd, or the displayed h should be negated; affects the proof.
