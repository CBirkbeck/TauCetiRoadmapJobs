# FIX-DESIGN-DynamicalDegreesOfRationalMaps~8: repair report

Review settled: `REV-DESIGN-DynamicalDegreesOfRationalMaps~7`, with four findings, all P3. All four were verified and applied.

## F01 (P3) — applied

Old → new: Layer 6 had no bound on `d`. It now opens with "Throughout, `d ≥ 1`". New §6.1 Check: on `ℙ⁰ = Spec K` the identity reduces to `(1)`, of degree `0`, and is dominant. New §6.4 Check: the empty tuple. In `plan.json`, `d ≥ 1` is added to targets 6.2–6.4, with tests in 6.1 and 6.4.

Verification: `Proj K[x_0]` is `D_+(x_0) = Spec K[x_0, x_0^{−1}]_0 = Spec K`. The 1-tuple `(x_0)` has gcd `x_0`, so its reduced form is `(1)`, of degree `0`. The identity of a point is dominant. So the §6.1 iterates item ("a morphism of degree `0` is constant, not dominant"; `deg(f^n) = (deg f)^n`) fails at `d = 0`, as the review says.

Pattern search beyond the review: §6.3's Frobenius ("a morphism of degree `p`") also fails at `d = 0`, so target 6.3 gets the hypothesis too. Target 6.2 gets it for uniformity; at `d = 0` that target is vacuous, because there are no reduced forms of degree `≥ 1`. Layers 4 and 5 already assume `d ≥ 1`. Layers 2 and 3 deliberately allow `d = 0`, as the Conventions say.

## F02 (P3) — applied

Old → new: the Scope bullet for §§3.3–3.6 now ends with a clause. AlgebraicModuliForArithmeticGeometry §9.10 proves log-concavity of `(H^p · L^{n−p})` for ample `L` and nef `H` on smooth, geometrically integral varieties in characteristic zero. §3.5 covers integral projective varieties over every field, all nef real classes and mixed `C_j`, and does not use §9.10.

Verification: I read AlgebraicModuliForArithmeticGeometry at its open head (README §9.10, the "Prove `nefMixedIntersectionBound`" paragraph). It assumes smooth, projective and geometrically integral varieties over a field of characteristic zero ("All varieties in this paragraph…"), and its route uses the displayed log-concavity. That statement is the special case `A = H`, `B = L` of the consequence of §3.5. AlgebraicModuliForArithmeticGeometry is earlier in the merge order and cannot cite this roadmap. So the general statement stays here as a variant that differs from §9.10 in the way the clause says. No supplier edge is added.

Ownership by object: I searched main and the 475 open heads for `Khovanskii`, `Teissier`, `Siu`, `log-concav`, `mixed intersection` and `dynamical degree`. The only hit on this roadmap's objects is §9.10.

## F03 (P3) — applied

Old → new: §3.3 "Prove also that a nef `A` with `(A^r) > 0` is big" becomes an imported remark: big, with `vol(A) = (A^r)`, by ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) read through §2.2; not a target and unused by the route. The route's bigness sentence is deleted. Its (2′) citation now names the roadmap. The bigness clause leaves `plan.json` target 3.3.

Verification: ArakelovGeometryAndAbelianHeightsPartII §0.3 at its head defines geometric volume and bigness, and its (1′) gives `vol(L) = L^d` for nef `L`. AlgebraicModuliForArithmeticGeometryPartII §1.6 also states that nef `L` is big iff `(L^n·V) > 0`. Every other use of "big" in the README is in the Conventions' sense ("big and nef" means nef with `(L^d) > 0`: §§3.1, 4.2, 4.4 and the Checks). So nothing consumed the volume statement. The route closes on (2′) alone (recomputed below). I found no other "Prove" item that only restates an import with no consumer.

## F04 (P3) — applied differently

Old → new: "Correspondences and resolution of singularities. No statement here uses either." becomes a bullet that leaves out the dynamics of dominant correspondences and defines them (truong2020 lines 77–89; Theorem 1.1, lines 143–145). Rational maps are the multiplicity-one, birational-onto-`X` case, the only one composed here. `W_{f,g}` is described exactly. Resolution is unused.

Why it differs from the suggested text: Truong counts every dominant rational map as an irreducible dominant correspondence (truong2020 lines 85–86 and 600). So "no statement here iterates or composes a correspondence" would be false. The new text says which correspondences are composed. "A common model of the three graphs" would also be wrong for `Γ_g`: `W_{f,g} → Γ_g` has degree `e(f)` and is not birational. The new text says "birational onto `Γ_f`, `Γ_{g∘f}`; generically finite of degree `e(f)` onto `Γ_g`", as in §1.3.

In `sources.toml`, the `truong2020` locator is now "Introduction, notation for correspondences; Theorem 1.1; §6.3; §6.4". Its `cited_for` already included "Scope".

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 6 standing `d ≥ 1`; §6.1 iterates item | `d = 0` identity; `d = 1` constant `[0:1]`; `d = 2` constant `[0:0:1]` | `d = 0`: reduced form `(1)`, degree 0, dominant, `deg(id^0) = 0 ≠ 1`. `d = 1`: `f^0 = id` has degree `1 = 0^0`, `f^1` has degree `0 = 0^1`, image a point (not dominant). `d = 2`: forms `(0,0,1)`, image a point (not dominant) | false at `d = 0`, true for `d ≥ 1` | `d ≥ 1` added; `d = 0` non-example Check |
| §6.3 Frobenius is a morphism of degree `p` | `d = 0`; `d = 1`, `p = 2` | `[x_0^p] = [1]`, degree 0; `[x_0² : x_1²]`, gcd 1, degree `2 = e` | needs `d ≥ 1` | covered by the layer line, plan 6.3 hypothesis |
| §6.4 `a ≥ 1` for dominant `F` | `d = 0`; `d = 1`, `F = (x²)`; `F = (x+1)`; `F = (c)` constant | empty max gives junk `0`; extension `[x_0² : x_1²]`, `a = 2 = e`; `[x_0 : x_1 + x_0]`, `a = 1`; `{c}` is algebraically dependent, so excluded | holds for `d ≥ 1` | Check and plan 6.4 hypothesis |
| §3.3 remark: nef `A`, `(A^r) > 0` ⇒ big | `ℙ¹×ℙ¹`: `O(1,1)`, `O(1,0)`; non-nef `O(1,−1)`; blow-up `π^*O(1)` | `vol = lim 2(m+1)²/m² = 2 = (A²)`; `vol = lim 2(m+1)/m² = 0 = (A²)`; `h⁰ = 0`, `vol = 0 ≠ −2 = (A²)` (nefness needed); `vol = 1 = (A²)` | holds as imported | moved to remark |
| §3.3 route without bigness | `ℙ¹×ℙ¹`, `A = O(1,1)`, `B = O(1,0)`, `C = O(0,1)`, `r = 2` | condition `2p > 2q`; (2′) bound `2p² − 2pq` = actual `vol(O(p−q, p)) = 2(p−q)p > 0`; `m(p − q) ≥ 0`; `p/q → 1 = r(A·B)/(A²)`; `2 ≤ 2` | closes | none |
| §3.3 route edge `(A^{r−1}·B) = 0` | `B = O` on `ℙ¹×ℙ¹` | every `p/q > 0` is allowed; `(B·C) ≤ (p/q)(A·C) → 0`; `(A²)(B·C) = 0 ≤ 0` | holds | none |
| Scope clause: §9.10 is a special case of §3.5 | `ℙ¹×ℙ¹`, `H = O(1,0)`, `L = O(1,1)`; `E×E` real `A`; quadric cone; `ℙ²` over `𝔽_p` | `s_0 = 2`, `s_1 = 1`, `s_2 = 0`: `1 ≥ 0`; `9 ≥ 0·2` (real class, outside §9.10); `4 = 2·2` (singular, outside §9.10); char `p` is outside §9.10 | the clause is accurate | clause added |
| Scope bullet: `W_{f,g}` maps onto the three graphs | `σ, σ`; `z², z²`; `ℙ¹_ℂ/ℝ` identities | degrees `1, 1, e(σ) = 1`; onto `Γ_g`: `2 = e(f)`, not birational; triple diagonal, degrees `1, 1, 1` | birational onto two of the graphs only, so "common model" was wrong | wording fixed |
| Scope bullet: a rational map is the multiplicity-one, birational-onto-`X` case | `Γ_{z²}`; `2Γ_{z²}`; `{x = y²} ⊆ ℙ¹×ℙ¹` | `π_1` birational, multiplicity 1, so a rational map; multiplicity 2, not a map; `π_1` of degree 2, multivalued | the characterisation is exact | none |

Every other Check of §§3.3, 6.1 and 6.4 is unchanged and was recomputed against the edited text, with no conflict. The §3.3 Checks (`2 ≤ 2`, `0 ≤ 2`, `2 > 0`, `24 ≤ 30`) do not use bigness. The §6.1 Checks use `d = 1, 2`, and the §6.4 Checks use `d = 2, 3`.

## Checks

- **Dependency check**, full output:

      candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2235 edges, 0 problem(s)

  There is no UPWARD or CYCLE line. At the design stage, "not in the merge order yet" is expected.
- **Citation resolver** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name was found nowhere.
- **Lean `#check` comparison**: not run. This design-stage package has no `Suggested.lean`, so there was no declaration to elaborate.
- **Gate failures listed in the brief**: none.

## Notes for the maintainer

- No section, layer, target id or Lean name changed. Other roadmaps' citations of this roadmap are unaffected.
- AlgebraicModuliForArithmeticGeometry §9.10 is now named in Scope as a narrower statement. It is not a supplier, and the supplier contracts are unchanged. That roadmap is already a supplier here (§§1.4, 5.4), so the dependency graph is unchanged.
- No source was fetched and `scratch/needs-references.toml` was not created. The only manifest edit is the `truong2020` locator string.
- Ownership: checked by object on main and on the 475 open heads that the tools index. No suspicious instruction was found in the review or the sibling texts.
