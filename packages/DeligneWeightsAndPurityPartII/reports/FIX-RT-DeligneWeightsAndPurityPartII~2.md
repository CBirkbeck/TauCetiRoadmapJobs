# FIX-RT-DeligneWeightsAndPurityPartII~2

Two reviews, eight findings. Files changed: `packages/DeligneWeightsAndPurityPartII/README.md` and `packages/DeligneWeightsAndPurityPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no new supplier gap was needed.

## RT-DeligneWeightsAndPurityPartII~2a/F01 (P1) — applied differently

Verified. RAM05 line 1020 (Lemma 2.1.10(ii)) gives |disc| ≥ |d|^d, which says nothing when char K divides d. The Artin–Schreier cover T = w²/(1−w) in characteristic 2 has integral discriminant of norm r at radius r (basis 1, w/c with |c|² = r; trace-form discriminant (T/c)²). So ITO20 line 2342 is wrong in characteristic p.

Change (§3.4, "Finite étale covers of small annuli"): the old single bullet is now two bullets.
- **Covers of degree d invertible in K** (every cover in characteristic 0). The Ramero-bound route is kept, now valid because d ≠ 0 in K: convexity plus integer slopes plus the bound make the discriminant function eventually constant, and ITO20 Prop. A.8 then gives the annuli.
- **Algebraic covers, in either characteristic.** The cover is the restriction of a finite morphism φ of smooth proper curves over a punctured disc around a K-point. The new route needs no discriminant. At each point y′ over y, T∘φ = S^e·u with u a unit of constant norm on a small disc. So the preimage of B(a,b) is an annulus in S, and it is Kummer when e is invertible in K.

Supporting edits:
- The uniform annular direct-image route now invokes the algebraic form. That is the only consumer, and its cover is the analytification of the normalization W → Y_K, exactly as in ITO20 Theorem 6.10, Step 2.
- New negative-control Check: the Artin–Schreier discriminant computation.
- The Scope sentence is updated, AdicSpacesPartII §§R1.3–R1.6 is added to the Needs, RAM05 is added to the manifest (Numdam, certified) and to the References, and the ITO20 reference notes the restriction at line 2342.

Why "differently": the review asked for an unnamed separate route for the general positive-characteristic statement. ITO20's proof does not support that statement, so the positive-characteristic target is narrowed to exactly what its consumer uses. The roadmap's endpoints (§3.4 uniform theorem, §3.6) keep their either-characteristic scope.

I considered and rejected a claim that the general characteristic-p statement is false. An Artin–Schreier cover with an essential singularity has inseparable residue extensions along the skeleton, hence genus 0, so it does not refute the decomposition. The README therefore asserts nothing about non-algebraic characteristic-p covers whose degree is divisible by p.

## RT-DeligneWeightsAndPurityPartII~2a/F02 (P3) — applied

Three Checks added after the coefficient-uniform alteration Checks, each verified:
- ℙ¹ over k[[s]] with D = {0, ∞}: adapted.
- Marking x² = s with char k ≠ 2: not adapted. Any étale D would be finite étale, so the integral closure Spec k[[x]] would equal a component of D, yet it is ramified.
- C × S with C nodal and S° = S: not adapted, because the curve is not smooth over S°.

They realise the truth pairs (T,T), (T,F) and (F,T).

## RT-DeligneWeightsAndPurityPartII~2a/F03, RT-DeligneWeightsAndPurityPartII~2b/F01 (P3) — applied

Overlap: the duplicate §3.1 Checks (old lines 571 and 575).

**Deletions (2a/F03).** Six Check bullets removed:
- §0.3 "formula of §0.2";
- both §3.1 section-domain bullets;
- the two repeated §4.2 bullets;
- the §4.6 scope negation.

The section-domain identification is now a §3.1 API bullet, citing AnalyticToricGeometryPartII §5.1, with its reason: integral generators change by norm-one units. Remaining Check counts: §0.3 five, §3.1 three, §4.2 four, §4.6 three.

**Relabelling (2b/F01).** The head (rev/1647, 4c15f2ec) has no NT labels, and its line 752 names §§3.4–3.6, 4.2, 5.3 and 6.4 for this roadmap. Every NT label was replaced:

| Old label | New citation |
|---|---|
| NT.0 | §§0.3–0.5 |
| NT.1 | §§1.1–1.2 |
| NT.3 | §§3.4–3.6 |
| NT.4 | §4.2 |
| NT.5 (section domains) | §5.1 |
| NT.5 (hypersurface approximation) | §§5.2–5.3 |
| NT.6 | §6.4 |
| NT.0–NT.6 | Layers 0–6 |

Places changed: Scope, the contract, §3.1 Needs, §4.1 Check and Needs, §4.2 Check and Needs, §4.3, §4.6 and §4.7 Needs, and the Layer 4 Dependencies.

## RT-DeligneWeightsAndPurityPartII~2a/F04 (P3) — applied

- `sources.toml`: the HUB96 locator now also lists "Corollary 7.5.5 (as used in ITO20, proof of Lemma 7.1, pp. 45–46)". The key and its `uncertified` status are kept.
- README HUB96 reference: now lists Corollary 7.5.5 (ITO20 lines 2009 and 2038) for the §3.4 duality gap, together with the Lemma 2.7.11 and Theorem 5.7.8 locators.

## RT-DeligneWeightsAndPurityPartII~2a/F05 (P3) — applied

Verified on main: LocalFieldsRamification README line 707 places "Totally ramified is equivalent to Eisenstein" in Layer 3. Three edits:
- The contract reads "Layers 0–4", naming the Layer 3 item.
- §2.1 Needs now adds "Layer 3 (totally ramified is equivalent to Eisenstein)".
- §0.5 Needs gets the same item. This is the same pattern: §0.5 uses Eisenstein for the p-power Kummer tower.

## RT-DeligneWeightsAndPurityPartII~2b/F02 (P3) — applied

Verified at the ClassicalAdicEtaleCohomology head (`roadmaps show`, #875): neither `OrientedEtaleProduct.nearbyCycles_stalk` nor `PlurinodalAlteration.exists` occurs. Its §5.4 does contain `OrientedEtaleProduct`, the nearby-cycle stalk formula, the plurinodal alteration theorem and the bound q ≤ 2N.

The two names were replaced by these descriptions at four places: the contract, the §3.4 sliced nearby-cycle API, the alteration route and its Needs. `resolve` now reports no unresolved names.

## RT-DeligneWeightsAndPurityPartII~2b/F03 (P1) — applied

Verified. SchemeAndStackFoundations §4.19 (main, README line 6374) gives a regular projective source and no smoothness or geometric irreducibility over an imperfect k. Also, §0.7 is dimension theory plus `geometric_irreducible_components` (finite separable extension), not "geometric components after finite extension" in general.

New §4.1 route:
1. Approximate over the perfect field k₀ = 𝔽_q(t)^perf (AnalyticToricGeometryPartII §6.4).
2. Use §0.7 to reach a finite separable k₂ where a d-dimensional component W₂ is geometrically irreducible.
3. Apply the alteration theorem over k₂. Since W₂ is projective, the alteration source is proper, hence a component of its regular compactification. The review's text missed this step.
4. The source is regular over a perfect field, hence smooth (§4.13 `regularLocus_eq_smoothLocus`).
5. Use §0.7 again to get a geometrically irreducible smooth component over k₃.
6. Descend to a finite stage k₁ with k₃/k₁ purely inseparable (§0.9).

Supporting edits:
- The contract sentence for §§0.7, 4.13, 4.16 and 4.19 is rewritten.
- §4.13 is added to the Scope, §4.1 Needs and the Layer 4 Dependencies.
- Same pattern in §3.4: the reduction step now cites §4.13 for "regular output is smooth", and §4.13 is added to its Needs.
- New Check: the §4.18 conic X² + sY² + tZ² over 𝔽₂(s,t) is regular but not smooth.

## Checks run

- `lake env lean packages/DeligneWeightsAndPurityPartII/Suggested.lean` from the content checkout: exit 0, no output. The file has no declarations, so the scratch `#check @name` comparison was empty and nothing changed.
- Dependency check: `depcheck: 201 roadmaps, 1425 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citations and no Lean names found nowhere.
- No machine path in any package file.

## Gate failures repaired

- Warning "imports `Mathlib` ... designed for use with the module system; consider adding `module`": `packages/DeligneWeightsAndPurityPartII/Suggested.lean` now opens with the `module` header line, followed by the unchanged `import Mathlib`. The file declares nothing, so private-by-default visibility changes no statement. Re-elaborated with `lake env lean` from the content checkout: exit 0, no output. The gate's import scan treats `module` as no command, so `import Mathlib` is still the first import and in the header. Nothing else changed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Annular decomposition, d invertible | identity, d=1; Kummer T↦T^m, char 0, m=p | bound −d log|d| = 0 for d=1; for m=p in char 0, |p|^p>0, finite bound; preimage B(a^(1/m),b^(1/m)) | holds; route valid |
| Same, d divisible by char K | AS T=w²/(1−w), char 2 | disc norm r, δ(ρ)=ρ unbounded; Ramero gives ≥0 | excluded from this bullet; negative-control Check |
| Algebraic annular form | AS cover (e=2, u=1/(1−w), |u(0)|=1) | preimage {(a)^(1/2)≤|w|≤b^(1/2)}, degree 2, not Kummer since 2=0 | matches existing Check |
| Algebraic form, Kummer case | T↦T³, residue char 2 | one point over 0 with e=3 invertible; u=1, S′=S; one Kummer annulus B(a^(1/3),b^(1/3)) of degree 3 | holds |
| Algebraic form, unramified fibre | φ étale at y′ (e=1) | T∘φ=S·u, annulus maps isomorphically | holds; d components when φ is étale of degree d over y |
| Algebraic form, char 0, e divisible by p | e=p, u=1+S | binomial series for (1+S)^(1/p) converges for |S|<|p|^(p/(p−1)); shrink disc | Kummer after shrinking |
| Adapted Checks | three tuples | (smooth over S°, étale D) = (T,T),(T,F),(F,T) | added |
| §3.1 section-domain API | f=t on ℙ¹ chart, c=1 | N₁ = {|t|≤|ϖ|} = T(V(t),|ϖ|) | holds; c restricted to |ϖ|^c ∈ |Kˣ| |
| §4.1 perfect-field route | elliptic curve y²=x³−x over 𝔽₃(t) | W₂ already smooth and geometrically irreducible, k₂=k₃=𝔽₃(t)^perf, identity alteration, descends to k₁=𝔽₃(t), deg g=2 | holds |
| §4.1 route, imperfect pitfall | conic X²+sY²+tZ² over 𝔽₂(s,t) | regular; over 𝔽₂(√s,√t) a double line, so not smooth | old route could stop here; new route alters over perfect k₂ only; Check added |
| §4.1 route, d=0 | Y a point | W₂ = Spec of a finite extension, alteration identity, Z′=Spec k₁ | holds |
| §4.1 proper source | W₂ projective, alteration X₁→W₂ proper | X₁ proper ⇒ closed and open in the regular compactification | step added |

## Notes for the maintainer

- No Lean names were changed. The NT-label relabelling and the ClassicalAdicEtaleCohomology name fixes touch citations only.
- ITO20's proof of Theorem 6.2 (Appendix A, line 2342; also the published version, as the reviewer reports) states the discriminant bound in both characteristics. The roadmap now uses that bound only for degree invertible in K, and covers the characteristic-p consumer with an elementary local argument.
- No new supplier gap was added. The algebraic annular argument and the perfect-field alteration route use only SchemeAndStackFoundations §§0.7, 0.9, 4.13, 4.19, AdicSpacesPartII §§R1.3–R1.6 and pinned or elementary facts.
- Ownership: simultaneous semistable reduction for finite morphisms of curves is owned only by TropicalAndBerkovichArithmetic, an open pull request that is not earlier in the merge order. The new route avoids it, so no ownership change follows. Ownership against open pull requests outside the brief's index was not checked.
- Sources: RAM05 was added (Numdam copy, certified). An arXiv copy of Amini–Baker–Brugallé–Rabinoff was fetched while exploring an alternative route; it is not cited and its manifest entry was removed. No `needs-references.toml` was written.
