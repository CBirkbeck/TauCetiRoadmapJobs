# FIX-RT-CrystallineCohomologyPartII~1: repair of red-team round 1 (passes a and b)

Seventeen findings, two reviews. One pair overlaps (1a/F03 and 1b/F05, the Ser58Top locator) and is settled in one section. Files changed: `packages/CrystallineCohomologyPartII/README.md`, `Suggested.lean` (module docstring only), `sources.toml`, `design/plan.json` (top-level `gaps` only: two new supplier gaps).

## RT-CrystallineCohomologyPartII~1a/F01 (P2) — applied differently

Changed: the module docstring's "Not statable at the pins" list now names Ax's criterion (§6.3) in its point-count form. Congruences of `|X(F_{q^r})|` modulo `q^r` are equivalent to equality of slope `< 1` zeta factors, but the pins have only the zeta function of a Weierstrass curve and no slope factors. No arithmetic theorem was added.

Why differently: the proposed Lean statement is about polynomials P, Q ∈ ℤ[t] and integers N_r. It mentions none of the roadmap's objects, and its conclusion is algebra on its hypotheses. The brief's rule is to state such a theorem on the actual carriers or name it as not statable. On the actual carriers (zeta functions of schemes over F_q and their slope factors) it is not statable at the pins. §6.3 is an input lemma, which BBE07 itself calls a "well-known result" (BBE07 line 1472). The point-count headlines it feeds (§§6.4, 6.6, 6.9, 6.14 (i)) are already stated.

## RT-CrystallineCohomologyPartII~1a/F02 (P3) — applied

Changed in §3.4 step 3: "CT03, Proposition 11.2.5" → "CT03, Corollary 11.2.6, p. 197, which rests on the coskeleton identity of CT03, Proposition 11.2.5, pp. 196–197". The References entry and the CT03 manifest locator are updated to match.

Evidence: CT03 line 5340 (Proposition 11.2.5, coskeleton identity) and CT03 line 5381 (Corollary 11.2.6, smoothness of the induced morphisms of coskeleta); the page marker at CT03 line 5345 places both on printed pp. 196–197.

## RT-CrystallineCohomologyPartII~1a/F03, RT-CrystallineCohomologyPartII~1b/F05 (P3) — applied

Changed: "Ser58Top, sections 1 and 3, pp. 24–53" (§6.8) and "§§1, 3, pp. 24–53" (References, manifest) → "Ser58Top, n° 3 (Opérations de Bockstein) of §1, pp. 27–29". The new §6.8 route cites "n° 3 of §1, p. 28" for the criterion and the degree-0 and dimension-0 examples. The vanishing for abelian varieties stays attributed to Ser58, Théorème 2.

Evidence: Ser58Top line 1041 opens §1 ("Cohomologie à valeurs dans les vecteurs de Witt"). Line 1127 is n° 3, "Opérations de Bockstein", on printed p. 27, running to line 1200 on printed p. 29. Line 1475 opens §2 (curves). The words "of §1" come after the n° because the citation resolver read "Ser58Top, §1" as a citation of a roadmap named Ser58Top.

## RT-CrystallineCohomologyPartII~1a/F04 (P2) — applied

Changed (§4.3): "ĉl(D) … i.e. the first Chern class of O(D)" → the supported class ĉl(D) ∈ H¹_D is the class of −d log[t]; only its forget-supports image ĉl(D)|_X equals c_1(O(D)), which is 0 for principal D; for A¹, D = {0}, the class −dt/t is nonzero. The notation ĉl(Z)|_X, an API bullet and route criterion (2) are added.

Other places: the P¹ rational-equivalence Check (§4.3), the §4.5 Check ((∫α)·ĉl(x)|_{P¹}) and the §4.6 point-inclusion Check.

Evidence: CR12 line 2543 states cl(D) = c_1(O(D)) only in H¹(X, W_•Ω¹), without supports. The supported class comes from CR12 line 2524 (cl(Z) = i_*(1)) and the Gysin formula at CR12 line 1940, which carries the sign (−1)^c = −1 for a divisor; the reviewer's "boundary of d log[t]" omitted that sign, and the Check now records it. Consistency: excision identifies H¹_x(P¹) with H¹_x(A¹). If the supported class on A¹ were 0, then π_*ĉl(x) would be 0, contradicting the existing §4.3 Check π_*ĉl(x) = 1.

## RT-CrystallineCohomologyPartII~1a/F05 (P3) — applied

Changed (§2.5 Check): "For the nodal cubic X … P¹ ⊔ two points" → "For a split nodal cubic X … P¹ ⊔ two k-points", plus the nonsplit case: the off-diagonal part is Spec k′, with q + 3 versus q + 1 rational points over F_q.

Other places:
- §2.6 Check and its Examples copy: H¹ = K²/K or W(k′)_K/K, Frobenius ±1.
- §1.5 Check (preimage of the node).
- §1.6 Check and Examples ("two branches" → two components defined over k).
- §3.6 Check (Frobenius ±1, a unit).

Evidence (computed): y² = x²(x − 1) over F_3 has the tangent cone y² + x² = 0, with −1 a nonsquare, so the node is nonsplit. Its points are (0,0), (1,0), (2,±1) and ∞: five in all, which is q + 2. The split cubic has q points. The Frobenius trace on Witt cohomology gives 1 − 1 ≡ q and 1 − (−1) ≡ q + 2 mod q, matching both counts.

## RT-CrystallineCohomologyPartII~1a/F06 (P3) — applied

Changed: in References and the Ax64 manifest locator, "BBE07 Proposition 6.1" → "BBE07 Proposition 6.3, p. 35". Ax64 keeps its settled uncertified status.

Evidence: BBE07 line 1426 is the numbered paragraph 6.1 (Newton polygons); line 1475 is Proposition 6.3 (Ax's criterion, "well-known result [1]", line 1472); the page marker at line 1470 gives p. 35.

## RT-CrystallineCohomologyPartII~1a/F07 (P2) — applied

Changed: two bullets added to the docstring's not-statable list:
- Ekedahl duality and the action of proper correspondences on relative Hodge–Witt cohomology (§§4.1, 4.5): no de Rham–Witt complex or Witt canonical sheaves of a scheme, no Witt dualizing complexes, no Hodge–Witt cohomology with supports.
- Serre's Bockstein vanishing (§6.8): no sheaves `W_n 𝒪_X` and no Verschiebung on their cohomology.

No replacement declaration was added.

## RT-CrystallineCohomologyPartII~1b/F01 (P2) — applied differently

Changed (§1.5 steps 2–3, *Needs:*): "arrange X → Y to be the blowup" → generic flatness plus a U-admissible flattening blowup Y_1 (BS17, proof of Lemma 2.6), X_1 → Y_1 a proper fppf cover, cancellation down to Bl_J Y → Y, and dim V(J) < d because U is dense. New gap: gap:reduced-flattening-by-blowup. New Check: two crossing lines.

Other places: the `properSurjective_inductiveLevel` citation is dropped from §1.5, the Layer 1 Dependencies and the EnhancedDerivedSheaves contract, because its statement gives only "an isomorphism outside Z". The ArcTopologyAndDescent contract sentence now names the flattening input. Step 2 now treats reduced Y and dim 0 explicitly.

Why differently: BS17 line 2467 obtains the blowup "by the proof of Lemma 2.6". That proof (BS17 lines 226–234) uses generic flatness and Raynaud–Gruson flattening on a reduced, not necessarily integral, base. SchemeAndStackFoundations §4.12 on main states `generic_flatness`, `flattening_by_blowup` and `modification_domination` only over integral Noetherian bases, so the reducible case is declared as a supplier gap. That is the reviewer's own fallback, applied to the flattening statement the source actually uses. The reviewer's first repair (`modification_domination` plus closed-cover gluing) needs a modification, meaning a dense preimage of U, and an extra gluing argument whose base changes leave the integral case. The reviewer's instance (Y = V(xy), X = the two lines, Z = the point) is now a Check: Bl_pt Y = X, X_1 = Y_1 = X.

## RT-CrystallineCohomologyPartII~1b/F02 (P2) — applied differently

Changed (§6.8): the one-line citation route → four steps with owned inputs: (1) Serre's Bockstein criterion, a target here; (2) degree-one surjectivity through primitive lifts on A ×_k A; (3) all degrees by cup products; (4) degree g − 1. New API bullets, two new Checks, updated *Needs:*, and a new gap: gap:quasi-coherent-kunneth.

Detail of step 2: H¹ classes are primitive. A primitive class of H² vanishes, because ∧²H¹ → H¹ ⊗ H¹ is injective in every characteristic. The obstruction to lifting is primitive, hence 0. Every lift is automatically primitive.

Why differently: the reviewer's derivation formula (Ser58Top formula (5)) is not needed. The reviewer's bullet 3 would have rested the core step ("H¹(A, W_nO_A) → H¹(A, O_A) onto") on the uncertified Ser58, Théorème 2; it is proved here instead. Inputs:
- §0.1.
- AbelianSchemesAndArithmeticModuli §A4.4 `exteriorCohomology` (at its head: H^\*(A, O_A) is the exterior algebra on H¹ via cup product, squares zero also for p = 2).
- Coherent Künneth over a field. No owner exists at the pins, on main or at the open heads searched, so it is declared as a gap on SchemeAndStackFoundations §2.6. Locator: Stacks, Lemma 33.29.1, tag 0BED, read in the newly fetched Varieties chapter.

The criterion is Ser58Top line 1156: it suffices that the maps H^q(X, W_n) → H^q(X, O) be surjective.

## RT-CrystallineCohomologyPartII~1b/F03 (P3) — applied

Changed (§4.2 statement, API bullet, route step 3): "a finite morphism f: X → Y of connected smooth k-schemes" → "a finite surjective morphism … (equivalently, f finite and dim X = dim Y, so r = 0)". The route notes that such an f is flat. New Check: a k-point in P¹, where f_*f^*(1) = ĉl(x)|_{P¹} in bidegree (1, 1). The §4.3 route criterion is restated the same way.

Evidence: CR11 line 562 (Theorem 1.2.3 (1)) has "smooth connected schemes of equal dimension"; CR12 line 1928 (Proposition 2.3.4) omits it.

## RT-CrystallineCohomologyPartII~1b/F04 (P3) — applied

Changed: in §6.4 (iv) (route and *Needs:*), "SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`" → Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`. The proper X is quasi-compact and separated, hence has affine diagonal. The declaration is added to "From Tau Ceti".

Evidence: at the pin, `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:185` (namespace `TauCeti.AlgebraicGeometry`) has hypotheses `[Module.Flat R R'] [CompactSpace X] [IsAffineHom (pullback.diagonal …)]`, M quasi-coherent, and every n. SchemeAndStackFoundations §2.6 on main says `qcoh_higherDirectImages` "uses no flat base change" and points to the same declaration. No other occurrence: the remaining §2.6 citations are for quasi-coherence.

## RT-CrystallineCohomologyPartII~1b/F06 (P3) — applied differently

Changed (§0.5 (ii) ⇐, step 3): "reducing modulo a maximal ideal m … A/m = B/n" → a p-power argument at every point. The Witt isomorphism forces A → B injective and `b^{p^N}` ∈ A for every b, so g is integral, surjective and universally injective, i.e. a universal homeomorphism. New Check: k[t] ⊂ k[t, s]/(s² − t) for p odd, against F_p[t] ⊂ F_p[t^{1/p}].

Why differently: the proposed constructibility step cites SchemeAndStackFoundations §0.23. On main, §0.23 (Universal homeomorphisms) lists Tau Ceti's universal-homeomorphism API and criteria and has no constructibility statement. The p-power argument needs only the criterion `isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` named there. NT20 line 668 argues at maximal ideals only.

## RT-CrystallineCohomologyPartII~1b/F07 (P3) — applied

Changed: docstring bullet added. "Esnault's point count for rationally chain connected, in particular Fano, smooth projective varieties (§§6.11, 6.12, 6.14 (i)): no families of rational curves and no notion of rational chain connectedness." It points to `card_rationalPoints_modEq_one_of_universallyCH0Trivial` as the stated form.

Evidence: no rational-chain-connectedness or rational-curve-family carrier in pinned Mathlib or Tau Ceti. The only hits are expository mentions in `TauCeti/AlgebraicGeometry/Curves/DualGraph/Cycle.lean` and `…/StableMaps/Basic.lean`.

## RT-CrystallineCohomologyPartII~1b/F08 (P3) — applied

Changed: References entry for HW23 → "§2; Corollary 4.6 and proof (arXiv v2; Corollary 4.7 in the published version). Corollary 1.3 and pp. 19–20 are locators of the published version." The words "Certified text" and "not certified by this extraction" are gone. The manifest's `version_note` is unchanged (manifest metadata).

## RT-CrystallineCohomologyPartII~1b/F09 (P3) — applied

Changed:
- Deleted the two §0.3 Checks that repeated the first two (A perfect; A = F_p[ε]/(ε²)).
- §6.9: "(… q + 1 − q = 1 ≢ 0 points' difference)" → "BBE07, Remarks 6.6 (ii), p. 36: on P¹ the divisors D = 2{0} and D′ = {0} + {∞} have h⁰ = 3, but 1 and 2 rational points".

Evidence: BBE07 line 1553.

## RT-CrystallineCohomologyPartII~1b/F10 (P3) — applied

Changed: new supplier subsection "From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII". It cites §1.1, ferrand geometric pushouts, compared in a Check of §1.3 and consumed by no route.

Evidence: the heading "1.1 ferrand geometric pushouts" exists at that roadmap's head (its README line 271). The roadmap is earlier in the merge order, and the dependency check shows no UPWARD line.

## Checks

- **Elaboration.** `lake env lean packages/CrystallineCohomologyPartII/Suggested.lean`, run from the content checkout, exited 0. The only messages are five `declaration uses 'sorry'` warnings, at lines 91, 107, 119, 141 and 174. The only Lean change is the module docstring.
- **Signatures.** All eight declarations went through `#check @name` in one scratch copy of the file, which elaborated cleanly. Each elaborated type matches its README statement and is unchanged from the elaborated signatures supplied with the job, with every binder explicit:
  - §6.4 (ii): K finite field; πX, πY proper; f ≫ πY = πX; bijectivity for every i.
  - §6.6: d_j ≥ 1, ∑ d_j ≤ n; `[Finite σ]`, ∑ totalDegree < `Nat.card σ`.
  - §6.9: `IsThetaDivisor` on `AbelianVariety K`, `IdealSheafData`.
  - §6.10: `[IsProper π]`.
  - §6.14 (i): `IsProjectiveOver K`, `Smooth`, `GeometricallyConnected`.

  No binder was lost and none changed.
- **Dependency check.** Output:

  ```
  depcheck: 237 roadmaps, 2150 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** The first run flagged "Ser58Top, §1" as a roadmap citation. That is a false positive: Ser58Top is a source key. After rewording, both lists ("cross-roadmap citations found nowhere", "Lean names found nowhere") read "None."
- **Sources.** One fetch through the sources service: Stacks, Varieties chapter (tag 0BED, Lemma 33.29.1 at Stacks line 2460 of that chapter's text), recorded under the existing key `Stacks`. The service rewrote that entry. Its original weil.pdf locator, URL and sha256 were restored, and tag 0BED was appended to the locator with the chapter URL and sha256, following the entry's existing 02RH precedent. `cited_for` now includes §6.8. No `needs-references.toml` was produced; no text is missing.
- **Gap consistency.** Both new gaps (`reduced-flattening-by-blowup`, SchemeAndStackFoundations §4.12; `quasi-coherent-kunneth`, SchemeAndStackFoundations §2.6) have the same slug and the same `needs` sentence in `design/plan.json` (with `id`, `slug`, `supplier`, `section`, `needs`, `neededBy`) and in README "Exact supplier contracts". The JSON and TOML both parse.
- **Gate failures.** One was listed: `tex=12`, twelve TeX-only fragments (`_{`, `^{`) outside code spans in the README. All twelve are fixed and a rescan finds 0. The mathematics is unchanged.
  - Exact supplier contracts, From Tau Ceti (flat base change): the map `R′ ⊗_R H^n(X, M) → H^n(X_{R′}, g^*M)` is now in a code span.
  - Exact supplier contracts, From TauCetiRoadmap.SchemeAndStackFoundations, gap:quasi-coherent-kunneth: the external cup product `⊕_{a+b=n} … → H^n(X ×_k Y, F ⊠ G)` is now in a code span.
  - §0.5 Checks: B = `F_p[t^{1/p}]` is now in a code span.
  - §4.2, §4.3 (two lines), §4.5 and §4.6: `ĉl(x)|_{P¹}` → `ĉl(x)|_P¹`, the notation `ĉl(Z)|_X` that §4.3 defines. `H¹_{{0}}(P¹, WΩ¹)` and `H¹_{{∞}}` → "H¹_Z(P¹, WΩ¹) for Z = {0}" (and Z = {∞}), the supported-cohomology notation `H^c_Z` of §4.3.

  After the edits the dependency check still reads `depcheck: 237 roadmaps, 2150 edges, 0 problem(s)`. `Suggested.lean` was not touched, so the elaboration result above still holds.

## Adversarial pass on changed or new statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.5 (ii) ⇐ p-power step | A=k[t]⊂k[t,s]/(s²−t), p odd; A=F_p[t]⊂F_p[t^{1/p}]; F_q⊂F_{q²}; A reduced vs k[ε]/ε²; Y=∅ | `s^{p^N}=t^{(p^N−1)/2}s∉A` for all N, so not onto, 2 geometric generic points; (t^{1/p})^p=t∈A, UH; a generator b of F_{q²}: all `b^{p^N}` conjugates ∉F_q, so not onto; nilpotent kernel removed by §0.4; empty trivial | holds at every point, including the generic one; p=2, s²=t is purely inseparable and correctly a UH |
| §1.5 step 3 | Y=V(xy); Y=A², X=Bl_0; cuspidal Y, X=normalization; dim 0 | Bl_pt V(xy)=two disjoint lines=X_1=Y_1; Z=point, dim 0<1; Bl_0A²: Z=point, dim 0<2; cusp: one blowup gives A¹, X_1≅Y_1; dim 0: fields, X flat | reducible base needs the gap; integral bases use §4.12 as stated |
| gap:reduced-flattening-by-blowup | V(xy) with X=⊔ lines | X not flat at the node (fibre length 2 vs 1); blowup flattens | true (Raynaud–Gruson needs no integrality) |
| gap:quasi-coherent-kunneth | P¹×P¹; E×E; X=Y=Spec k | H¹=0=0⊕0, H²=0; H¹=k², H²: 1+0+0=1=dim ∧²k²; k⊗k=k | true; affine-diagonal hypothesis kept |
| §4.2 degree formula | point→P¹; F_{A¹}; id; Spec k⊔A¹ | f_*f^*(1)=ĉl(x)\|_{P¹}, bidegree (1,1), trace 1 ≠ deg·1; p; 1; excluded (not connected) | surjectivity needed, now stated |
| §4.3 supported class | A¹, D={0}, n=1; P¹, D={0}; affine X, D=V(t) | −dt/t ∉ k[t]dt, nonzero; image c_1(O)=0; image c_1(O(1)), trace 1; sign (−1)^1 from (2.4.1) | supported ≠ unsupported, consistent with π_*ĉl(x)=1 via excision |
| §6.8 criterion | curve X (q=0,1); Igusa surface (q=1) | degree 0 lifts (f,0,…); H²=0 makes degree-1 maps onto; Igusa has a nonzero Bockstein in degree 1 | both directions hold; abelian hypothesis needed |
| §6.8 degree one | g=0; g=1; E₁×E₂ (g=2), p=2 | no H¹; obstruction group H²(E,O)=0; cross term a₁⊗a₂−a₂⊗a₁ ≠ 0 (a₁⊗a₂+a₂⊗a₁ ≠ 0 at p=2) | primitive H² classes vanish in every characteristic |
| §6.8 lift primitivity | i₁^*e with e=m^*y−p₁^*y−p₂^*y | i₁^*m^*y=y, i₁^*p₁^*y=y, i₁^*p₂^*y factors through H¹(Spec k)=0, so 0; V^n injective as W_{n+1}(k)→W_n(k) onto | lifts automatically primitive |
| §6.8 conclusion | g=0, 1 | V^i: k→W_{i+1}(k) injective; W_{i+1}(k)→W_i(k) onto | matches the existing Checks |
| nodal Checks §§1.5–3.6 | split and nonsplit over F_q; y²=x²(x−1)/F_3 | P¹×_X P¹: q+3 vs q+1 points; X(F_3)=5=q+2; H¹ Frobenius +1/−1; 1−ε ≡ q, q+2 | consistent with §6.4's split-node count q |
| §6.4 (iv) flat base change | K→F_{q²}; ℙ¹ | flat; ℙ¹ quasi-compact separated; H¹=0 after base change | hypotheses of the pinned declaration met |
| §6.9 Remarks 6.6 (ii) | D=2{0}, D′={0}+{∞} on P¹ | h⁰(O(2))=3 for both; 1 vs 2 points; difference 1 ≢ 0 mod q | matches BBE07 line 1553 |

## Ownership and overlaps

- **Coherent Künneth.** Searched by object (`roadmaps grep` for Künneth in coherent and quasi-coherent forms; Tau Ceti `AlgebraicGeometry`; main). It has no owner: CrystallineCohomology uses it inside a proof sketch only, and SchemeAndStackFoundations §2.6 has quasi-coherent cohomology and flat base change but no Künneth. It is declared as a gap on that section rather than stated here.
- **Flattening by blowing up.** Owned by SchemeAndStackFoundations §4.12 for integral bases. AlgebraicModuliForArithmeticGeometry's `universalFlatteningProperSupport` is the flattening stratification, a different object.
- **Overlaps.** The overlap check lists no other open pull request changing this roadmap and no dropped ids. The closest roadmaps (CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, ArcTopologyAndDescent) were not affected by these edits.

## Notes for the maintainer

- **New supplier gaps on SchemeAndStackFoundations.** gap:reduced-flattening-by-blowup (§4.12) and gap:quasi-coherent-kunneth (§2.6). The first also affects EnhancedDerivedSheaves §E2.8 `properSurjective_inductiveLevel`. Its own proof route applies `flattening_by_blowup` to reduced, possibly reducible, bases after Noetherian approximation, where §4.12 assumes integrality.
- **No longer consumed.** EnhancedDerivedSheaves §E2.8 `properSurjective_inductiveLevel` is not cited by this roadmap any more.
- **Not addressed in this round.** BS17's proof of Proposition 11.41, which the §1.5 route follows, uses the cancellation law for universal descent with a blowup whose base changes are not blowups ("by the same argument it is of universal F-descent"). The route inherits that bookkeeping, and this round did not change it.
- **Source issues.**
  - NT20, Lemma 2.17, proof (NT20 line 659): argues at maximal ideals only. It needs the passage to all points, which the §0.5 route now supplies. Affects the proof.
  - CR12, Proposition 2.3.4 (CR12 line 1928): omits "of equal dimension", which CR11 Theorem 1.2.3 (1) has. Affects a stated result.
- **No name changes.** No declaration of `Suggested.lean` changed name or type; no other roadmap's citation of this one is affected.
