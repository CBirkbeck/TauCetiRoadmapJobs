<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7642#issuecomment-6721641428 -->
Review (claude) of f39b441

Verdict: accepted

No finding. Round 4 of the design review. Files read in full: `packages/VirtualFundamentalClasses/design/README.md`
(2160 lines), `packages/VirtualFundamentalClasses/design/plan.json` (11 layers, 61 targets, 130 tests, no
definition under three tests, `gaps: []`), `packages/VirtualFundamentalClasses/sources.toml` (22 entries,
no local path). The two findings of round 3 were checked one by one against the repaired text and the plan;
the adversarial pass was run, with computed values, on every passage the repairs changed or added and on the
fifteen sampled targets; the sampled locators were read at the cited lines. The verdict is accepted because
there is nothing to repair: the repairs are mathematically right (both were applied differently from the
proposed repairs, and in both cases the fix worker's reason holds, as recomputed below), the sample verifies,
every citation resolves, and no second owner exists.

## Repairs of the previous review, finding by finding

- **F01 (P3, the corrected invariance has a published source) — repaired, differently and correctly.**
  README 4.4, lines 865–869: "`β` is not invariant under all of `T_Y`, which behrend-fantechi1997
  Proposition 3.5 (line 889) asserts (Checks; the error is recorded at kresch1999b lines 41–47 and
  340–343)". README 8.5, lines 1519–1524: "For `𝔐 = Spec k`, kresch1999b Theorem 3.1 (line 334) proves
  this invariance for the rational equivalence of its Proposition 2.3 (line 242), which has the boundary of
  `β` (line 304), by extending the action to the double deformation space (lines 377–405); its notation
  exchanges the roles …; and its statement prints the acting bundle as `T_{Y'}` while its proof (line 400)
  acts by the tangent bundle of the smooth substack." The plan's 4.4 and 8.5 locators, the 8.5 API bullet,
  the References and the manifest entry (`locator_scheme = "theorem"`, the locator naming Theorem 3.1,
  Proposition 2.3, lines 304, 41–47, 340–343, `cited_for` split into 4.4 and 8.5, `version_note` on the v2
  numbering) match. The fix worker declined to call Kresch's element Vistoli's `β`, and that is right:
  kresch1999b line 334 speaks of "the rational equivalence … produced in the proof of Proposition 2.3",
  which is the element `ω` of its Corollary 1.10 on the double deformation space (lines 259–304), not
  Vistoli's normalised blow-up (vistoli1989 lines 1465–1470). The boundary claim was recomputed: with
  Kresch's `X` our `Y'` (smooth, regular) and Kresch's `Y'` our `X` (lines 321–323), line 304 reads
  `∂ω = [C_{X_K ×_Y C_{Y'_K}Y} C_{Y'_K}Y] − [C_{C_{X_K}Y ×_Y Y'_K} C_{X_K}Y]`; the first cycle is
  `[C_{u^*C/C}]` since `X_K ×_Y C_{Y'_K}Y = C ×_Y Y' = u^*C`, and the second is
  `[N|_{X'} ×_{X'} C_{X'/Y'}] = [ρ^*C_{X'/Y'}]` since `C_{X_K}Y ×_Y Y'_K = N|_{X'}` and the cone of
  `N|_{X'}` in the vector bundle `N → Y'` is the flat pullback of `C_{X'/Y'}`. These are the two terms of
  4.4's `∂β`. The misprint stands as recorded (lines 331–336 use `Y'` for the smooth substack; the proof at
  line 400 acts by `𝔸^m = T_X`). Repaired.
- **F02 (P3, 10.7's route covered only a regular local embedding) — repaired, differently and
  correctly.** README 10.7, lines 1852–1883, now forms Vistoli's rational equivalence in the graph ambient:
  `Y := Z' ×_𝔐 Z ×_𝔐 W ⊇ Y' := Z' ×_𝔐 W` (the graph of `v` times `W`, a section of the smooth
  projection `Y → Y'`, so a regular local embedding with normal bundle the pullback of `v^*T_{Z/𝔐}`),
  with the local embedding `Z' ×_𝔐 U → Y` and fibre product `U' = U ×_Z Z'`; `β(Y', Z' ×_𝔐 U)` is
  descended along `T_{Y'/𝔐} = T_{Z'/𝔐} ⊕ T_{W/𝔐}` by the second statement of 8.5, the quotient is a
  `g^*𝔑_v`-torsor over `u^*C_{X/𝔐}` identified with `𝔉 ×_{u^*𝔈} u^*C_{X/𝔐}` by the compatibility datum,
  and the class is pulled back to `K_1 := F_1 ×_{u^*𝔈} u^*E_1` and closed by 5.1 and
  `Γ_v^! q^* = v^!`. `*Needs:*` gains 4.5 and 10.1; the plan's 10.7 statement, locator and prerequisites
  match. The fix worker refuted the repair proposed in round 3 (a theory `pr^*Ω_{Z'/𝔐} ⊕ pr^*E` on
  `Z' ×_𝔐 X` compatible with `E` over the projection and with `F` over the graph) and, with it, the
  general case of behrend-fantechi1997 Proposition 5.10's proof (lines 1489–1498). I recomputed the conic
  Check independently (table below): the refutation holds, the proposed repair was wrong, and the new route
  uses only the compatibility over `v` itself. The new route was checked step by step on the
  `(s, t) ↦ st` Check and in general (table). Repaired.

## Verified sound

**Principles.** Arbitrary field `k`; no route-specific shortcut (the integral/rational split is justified
by `A_0([𝔸¹/μ₂]) = ℤ/2` versus `0`); no re-planning (stacks, scheme Chow theory, cones on schemes,
cotangent complexes of rings, derived functors on sites, curve families are imported by section); no copied
passage, no algorithm. Greps for `$`, `\(`, `\[`, `http`, `pull request`, `#NNN`, `TODO`, `handoff`,
`checkpoint`, `removed`, `so far`, `deferred`, `optional`, `uncertified`, `round N`, `PR`, `to be checked`,
`current`, machine paths and `lemma`: no hit.

**Dependency gate.** Output:

```
candidate: VirtualFundamentalClasses is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2342 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is
dropped by an open pull request, none is defined only by an open revision; the closest roadmaps in
vocabulary are EquivariantIntersectionTheory (a supplier) and the SchemeAndStackFoundations revisions
(a supplier on main is cited as it is on main). `scratch/citations.md` lists ten Lean names found nowhere by
the resolver; all ten are SchemeAndStackFoundations or DerivedModuleAlgebra names present on main (below).

**Supplier citations resolved on main (content head `7e2fae4e`).** SchemeAndStackFoundations README:
§0.7 l.755, §1.1 l.2071, §1.10 l.2320, §1.18 l.2745, §1.19 l.2817 (`IsDeligneMumford` with
`.iff_unramified_diagonal` and `.ofSpace`, l.2826–2829), §1.20 l.2843, §1.21 l.2951, §1.22 l.2989, §1.23
l.3021, §2.6 l.3437, §2.9 l.3582, §2.10 l.3631, §2.20 l.4275, §3.3 l.4713, §4.1 l.5066, §5.1 l.6567, §5.2
l.6653, §5.4 l.6721, §5.5 l.6768, §5.6 l.6921; all 62 backticked names of the supplier-contract section
occur in that README (`IsDeligneMumford.ofSpace` as `.ofSpace` under `IsDeligneMumford`, l.2829).
AlgebraicVectorBundles: L0B l.228, L1A l.269, L2A l.306, L2B l.340; the eleven cited names are declared in
its `Suggested.lean`. DerivedModuleAlgebra: §0.7 l.949 (`Algebra.CotangentComplex.homologyOneIso` l.964),
§0.13 l.1151, §0.25 l.1303 (`Algebra.CotangentComplex.extensionObstruction` l.1329).
EnhancedDerivedSheaves: §0.2 l.441, E1.2 l.534, E1.4 l.580. StableReduction: Layer 2 l.405, Layer 3
l.467, `PrestableFamily` l.109. EquivariantIntersectionTheory at its open head: Conventions l.49 (items 1,
4, 5 present, Convention 5 being the Edidin–Graham quasi-projectivity hypothesis), §2.1 l.379
(`A^G_i(X) = A_{i+l−g}(X ×^G U)` l.385), §2.2 l.403, §2.3 l.438 (`A^*_{μ_n} ≅ ℤ[t]/(nt)` l.441). It is a new
roadmap folder in an open pull request, so an allowed supplier; the package's pull request must name it in
its merge-order paragraph.

**Library declarations at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of
`lake-manifest.json` and the plan's baseline).** `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`
l.44, `.map` l.69); `Scheme.ord` (`OrderOfVanishing.lean` l.52, `ordHom` l.35); `Abelian (SheafOfModules R)`
(`Sheaf/Abelian.lean` l.40); `HasDerivedCategory` l.74 and `DerivedCategory` l.87
(`DerivedCategory/Basic.lean`); `cotangentComplex` l.61, `exact_cotangentComplex_toKaehler` l.324,
`H1Cotangent` l.546 (`Extension/Cotangent/Basic.lean`); `FormallySmooth` l.70 (its two fields are
projectivity of `Ω[A⁄R]` and vanishing of `H1Cotangent R A`, as the README states),
`iff_split_injection` l.290, `iff_comp_surjective` l.370 (`Smooth/Basic.lean`);
`derivationToSquareZeroEquivLift` (`ToSquareZero.lean` l.116); `smallEtaleTopology` (`Sites/Etale.lean`
l.50); `CategoricalPullback` (`Pullback/Categorical/Basic.lean` l.81); Tau Ceti `LineBundleClass`
(`LineBundle/Class.lean`) and `CartierDivisor` (`CartierDivisor/Basic.lean`). A case-sensitive grep for
`DeligneMumford` and `AlgebraicStack` over both pinned libraries finds nothing (the case-insensitive hits
are the real-algebraic "Stack" files of cylindrical decomposition), so no headline theorem is statable at
the pins.

**Seeded locator sample (15 targets), read at the cited lines.** 1.1: deligne-mumford1969 Theorem 4.12
l.1012–1019 (`g` proper surjective generically finite, `j` an open immersion, `T'' → S` projective, so `T'`
quasi-projective); vistoli1989 l.582–584 (proper cover from a scheme for a separated finite-type stack) and
Lemma 1.10 l.299 (a closed substack generically finite over the target, integral when the target is
irreducible) ✓. 3.1: (3.6)(i) l.974–979, (3.7) l.989, the construction of `f^*` on `W_*` through atlases
l.1012–1025 ✓. 3.5: l.1707–1708 ("as in [Fu] 1.10"); fulton1998 §1.10 uncertified ✓. 4.1:
behrend-fantechi1997 l.181–190 (graded `S` with `S_0 = O`, `S_1` coherent, generated by `S_1`),
l.198–225 (vertex and `𝔸¹`-action from the grading), l.229–236 (`C(F)(T) = Hom(F_T, O_T)`,
`E = C(E^∨)`); vistoli1989 l.470–477 (base change) and l.480–484 (descent) ✓. 5.1: vistoli1989 Lemma 5.5
l.1671–1684 (the zero-section case first), Lemma 3.8 l.1027; stacks-chow Lemma 32.2 l.2769 ✓. 5.2:
l.1570–1593 (product, pushforward, pullback of bivariant classes), stacks-chow §37 l.44 of the contents;
fulton1998 Corollary 6.3 uncertified ✓. 6.1: (2.1) l.542 (a scheme `M` with proper `π` bijective on
geometric points; the README's algebraic-space form is flagged in its text), (2.3) l.566, (2.4) l.571,
(2.5) l.578, (6.1) l.1758, its proof l.1766–1770; keel-mori1997 Corollary 1.3 l.28 ✓. 6.2:
edidin-graham1998 l.765–768 (the homotopy property is what a general comparison needs), Proposition 10
l.770 (with a quasi-projective moduli scheme), Proposition 11 l.790 ✓; the README proves the comparison
without the quasi-projective quotient through 5.1, as its text says. 7.4: l.535–544, l.545–573,
Proposition 2.1 l.574, l.603–608, l.609–628, the examples l.631–634, Lemma 2.2 l.635–639 (automorphisms of
the zero morphism are `Hom^{−1}`), Proposition 2.4 l.674–677 ✓. 8.1: Definition 3.7 l.906–917 (there with
`M` a smooth affine `k`-scheme; the relative form at l.1654–1655 says "schemes smooth over `Y`", the README
allows an algebraic space `W`, a widening it states), l.918–927, l.930–933 (the product), l.940–951 (the
complex `[I/I² → f^*Ω_M]` and the local presentation), l.952–962 ✓. 8.2: l.940–946 (citing Illusie III
3.1.3 for the isomorphism on `h^{−1}` and `h^0`), l.1649–1651 (`h^1 = 0` for unramified diagonal);
stacks-cotangent Lemma 22.4 l.1724 (`τ^{≥−1}L_f` is the naive cotangent complex); olsson2007 Theorem 8.1
l.1130–1136 ✓. 9.2: Definition 4.4 l.1139, the note l.1143–1149 (obstruction cone), Definition 5.1
l.1259, l.1268–1273 (`rk E = dim E_0 − dim E_{−1}`, locally constant, assumed constant), the example
l.1321, l.1657, l.1665–1666 ✓. 9.4: l.1503–1519 (`E = [g^*N^∨_{Y/W} → j^*Ω_V]`, `V`, `W` smooth, `i`
regular, works for DM stacks) ✓. 10.3: Definition 5.2 l.1282, l.1286–1298, Proposition 5.3 l.1299 and its
proof l.1303–1320 (it assumes morphisms of complexes; the README's `K_1` avoids this, as its 10.1 Check
shows) ✓. 10.7: Definition 5.8 l.1381, l.1389–1392, Lemma 5.9 l.1397 and its proof l.1400–1427 (the
identification at l.1419), Proposition 5.10 l.1428, the regular case l.1471–1488, the general case
l.1489–1498, the relative form l.1721–1733, Proposition 7.5 l.1734, the standing smoothness l.1668 ✓. Also
read for the repairs: kresch1999b l.30–60, 180–243, 259–304, 319–405; behrend-fantechi1997 l.1376–1500.

**Adversarial pass (every changed passage, the sampled targets, the headline theorems).**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 8.5 Kresch citation (new): same boundary as `β` | kresch1999b line 304 with its `X` = our `Y'`, its `Y'` = our `X` | `X_K ×_Y C_{Y'_K}Y = C ×_Y Y' = u^*C`, first term `[C_{u^*C/C}]`; `C_{X_K}Y ×_Y Y'_K = N|_{X'}`, cone of `N|_{X'}` in `N` is `N|_{X'} ×_{X'} C_{X'/Y'}` (flat `N → Y'`), second term `[ρ^*C_{X'/Y'}]` | boundaries agree; equality of the elements is not claimed | none |
| 8.5 Kresch's acting group | `X_K ⊂ Y'_K`; `Y = 𝔸^n`, `X_K = 𝔸^m` | line 346: trivial action; line 400: `𝔸^m = T_{X_K}` acts; `T_{Y'_K}` would act trivially on `C_{Y'_K}Y` | group is `T_{X_K}`, our `T_{Y'}`; misprint recorded | none |
| 8.5 deduced invariance, `𝔐 = Spec k` | `Y = 𝔸²`, `X` the origin, `Y' = {y = 0}` | `β = c·ν/η`; `T_{Y'} = ⟨∂_x⟩` acts by `ξ ↦ ξ + a`, fixing `c·ν/η`; `∂_y` acts by `η ↦ η + b`, moving it | agrees with Kresch Theorem 3.1 as corrected; BF Proposition 3.5 false | none |
| 10.7 graph ambient `Y' → Y` | `v = id`; `v` regular; `v = st` | `Γ_v × W` is a section of the smooth `Y → Y'`: regular, normal bundle `v^*T_{Z/𝔐}`; `v = id`: the diagonal, `𝔑_v = 0`; `v = st`: `{z = st} ⊂ 𝔸³` a smooth divisor, codimension `1 = dim Z` | holds | none |
| 10.7 fibre product `U'` | general; `st` | `(Z' ×_𝔐 U) ×_Y Y' = {(z', u) : v(z') = f(u)} = U ×_Z Z'`; `st`: `{z = w = st} ≅ 𝔸²` | holds, étale over `X'` | none |
| 10.7 local embedding `Z' ×_𝔐 U → Y` | general | base change of `U → Z ×_𝔐 W` (unramified since `U → W` is; schematic since `U ×_{Z ×_𝔐 W} T` is a base change of the finite unramified `Δ_{Z/𝔐}`) along the smooth `Y → Z ×_𝔐 W` | holds | none |
| 10.7 `(i, i) : Z' ×_𝔐 U → Y ×_𝔐 Y` local embedding | general | `Δ_{Z'/𝔐} × (U → U ×_𝔐 U → (Z ×_𝔐 W)²)`: finite unramified diagonal of `Z'`, unramified diagonal of `U/𝔐` (`U → M` étale, `M → 𝔐` of DM type), product of local embeddings | holds, so the second statement of 8.5 applies | none |
| 10.7 quotient is a `g^*𝔑_v`-torsor | general; `st` with `U = W = 𝔸¹` | `[u^*C/(T_{Z'} ⊕ T_W)] → [u^*C/(v^*T_Z ⊕ T_W)] = u^*C_X` with fibre `[v^*T_Z/T_{Z'}]`; `st`: `(a, b, e)` moves `ζ = z − w` by `at + bs − e`, transitive, stabiliser `T_{𝔸²}`, quotient `BT_{𝔸²} = 𝔉`, `𝔑_v` of rank `1 − 2 = −1` (`B𝔾_a` off the origin, `𝔸¹ × B𝔾_a²` at it) | holds | none |
| 10.7 `K_1 = F_1 ×_{u^*𝔈} u^*E_1` | local chain representative; `st` | locally `K_1 = {(f, e, t) : φ_1 f − e = dt} ≅ F_1 ⊕ E_0`, map to `u^*E_1` is `(f, t) ↦ φ_1 f − dt`, surjective because `𝔉 → u^*𝔈` is; `st`: `F_1 = X'`, `E_0 = v^*T_{𝔸¹}`, `K_1 = v^*T_{𝔸¹}`, rank `1 = 0 + 1` | vector bundle with both surjections, as in 10.1 | none |
| 10.7 dimensions of the two cycles in `N × K_1` | general | left `m + rk F^0 + rk E_0 + d_Z`; right `m + rk E^0 + d_{Z'} + rk F_1 + rk E_0 − rk E_1`; equal iff `rk F = rk E + d_{Z'} − d_Z`, the rank of the compatibility triangle | consistent | none |
| 10.7 closing identities | general; `st` | `0^!_{N×K_1}[N × D] = 0^!_{K_1}[D]` and `0^!_{K_1}[C(F^•) ×_{F_1} K_1] = 0^!_{F_1}[C(F^•)]` (5.1); `0^!_{N×K_1}[C' ×_{u^*E_1} K_1] = 0^!_{u^*E_1} 0^!_N[C'] = 0^!_{u^*E_1} Γ^![q^*C(E^•)] = Γ^! q^* 0^!_{E_1}[C(E^•)]` (4.3 (3.13), 4.5); `st`: both sides `[𝔸²]`, `v^![𝔸¹] = Γ^![𝔸³] = [𝔸²] = v^*[𝔸¹]` (`v` flat) | holds | none |
| 10.7 conic Check: `F` is a perfect obstruction theory compatible with `E` over `v` | `v : C ⊂ ℙ²` conic, `X = ℙ² × ℙ¹`, `E = Ω_X ⊕ V[1]`, `V = O(−2) ⊠ O(−2)`, `χ = (c, ξ)` | `N_C = O_{ℙ²}(2)|_C = O(4)`; `Ext¹(g^*N^∨, u^*V) = H¹(O(0,−2)) = H⁰(O) ⊗ H¹(O(−2)) = k`; with `0 → u^*V → Q → N^∨ → 0` representing `ξ`, `F ≃ [Q --cπ--> u^*Ω_X]`, `h^{−1} = u^*V`, `h^0 = coker c = Ω_{X'}`; the right square commutes since the first component of `χ` is the conormal map | holds | none |
| 10.7 conic Check: `κ_F ≠ 0` | same | `T_{ℙ²}|_C ⊗ O_{ℙ¹}(−4) = T(−2)|_C`, Euler sequence `0 → O(−4) → O(−2)³ → T(−2)|_C → 0`, `H¹(O(−4)) = k³ → H¹(O(−2))³ = k³` is multiplication by `(s², st, t²)`, an isomorphism, so `H⁰ = 0` and `T|_C = O(3)²`; conormal class `a ≠ 0` in `Ext¹(O(−2), O(−4)) = H¹(O(−2)) = k`; `κ_F = ξ ∘ (a ⊠ 1)` is the Yoneda product of the two short exact sequences of `[Q → u^*Ω_X]`, with component `a ⊠ ξ ≠ 0` in `H¹(O(−2)) ⊗ H¹(O(−2)) = H²(O(−2,−2)) = k` (Künneth) | holds | none |
| 10.7 conic Check: no `G` compatible both ways | `G` on `C × X` compatible with `E` over `p` | `q^*E → G → pr^*Ω_C`: `h^{−1}(G) = q^*V`, `h^0(G) = Ω_{C×X}`, `κ_G ∈ Ext²(Ω_{C×X}, q^*V) = H²(O(2,−2,−2)) ⊕ H²(O ⊠ T_{ℙ²}(−2) ⊠ O(−2)) ⊕ H²(O(0,−2,0)) = 0` (every `H^i(ℙ², O(−2))` and `H^i(ℙ², T(−2))` vanishes by the Euler sequence); `L_{X'/C×X} = g^*v^*Ω_{ℙ²}[1] =: A[1]` (flat base change of `Γ_v`), `A = O(−3,0)²`; a compatibility over `Γ_v` is `F = fib(χ' : A[1] → w^*G[1])` with `χ'_1 ∈ Ext¹(A, u^*V) = H¹(O(−1,−2))² = 0`, so `fib(χ') = [A → Ω_{C×X}|_{X'}] ⊕ u^*V[1]` has `κ = 0`; by naturality `κ_{fib(F → A[1])} = r^*κ_F` has component `a ⊠ ξ ≠ 0` | no such `G`; source's step l.1495–1498 false | none |
| 10.7 conic Check: the theorem still holds | same | `Ob_E = V^∨ = O(2,2)`, `[X, E]^vir = c_1(O(2,2)) ∩ [X]` (10.4), `v^!` of it `= c_1(O(4,2)) ∩ [X']`; `Ob_F = u^*V^∨ = O(4,2)`, `[X', F]^vir = c_1(O(4,2)) ∩ [X']` | equal, as the graph-ambient route predicts | none |
| 10.7 degenerate | `Z = 𝔐`; `Z' = 𝔐` (a section); `v = id`; `Z' = Z × 𝔸¹ → Z` | first case (smooth); `Ω_{Z'/𝔐} = 0`, graph = `v` regular; `F ≅ u^*E`; `[X, E]^vir × [𝔸¹]` by 10.5 | covered | none |
| 1.1 proper covers | `BG`; `∅`; a scheme; the doubled-origin `BG → 𝔸¹` | `Spec k → BG` finite étale of degree `|G|`, quasi-projective, generically finite, not birational; `∅ → ∅`; `id`; a proper `X → BG` gives `P = X ×_{BG} 𝔸¹` proper over `𝔸¹`, hence separated over `X`, but `G_X → X` is non-separated wherever `X` meets `0`, and `|X| → |BG| = |𝔸¹|` is onto | matches Theorem 4.12 and l.582–584; the non-example is correct | none |
| 3.1 flat pullback | `Spec k → BG`; coarse `[𝔸¹/μ₂] → 𝔸¹`; `𝔸¹ × 𝓜 → 𝓜` | `[Spec k]` (relative dimension `0`, no degree factor); `[{0} ×_{𝔸¹} [𝔸¹/μ₂]] = [[V(x²)/μ₂]] = 2[Bμ₂]`; `[𝔸¹ × 𝒱]` in dimension `+1` | matches (3.6)(i) | none |
| 3.5 exterior products | `K/k` separable of degree `2`; `K = k(a^{1/p})`; `BG × BH` | `K ⊗ K = K × K`; `K[t]/((t − a^{1/p})^p)` local of length `p`, `p[Spec K]`, degrees `p² = p·p`; `B(G × H)` | matches l.1707 | none |
| 4.1 cones | `S = O`; `S = O_𝓜` in degree `0` only; `k[x,y]/(xy)`; `C(O(1))` on `ℙ¹` | `𝔸¹ × 𝓜`; `𝓜` with vertex an isomorphism; abelian hull `𝔸²`, cone not abelian; total space of `O(−1)`, `c_1` of degree `−1` | matches l.181–236 and Convention 6 | none |
| 5.1 homotopy invariance | trivial line bundle on `BG`; `r = 0`; restriction to the zero section; `E ⊕ F → E` | `A_1(𝔸¹ × BG)_ℚ = ℚ`, `A_0(𝔸¹ × BG)_ℚ = 0` (`div(x − a)` kills `{a} × BG`), `s^![𝔸¹ × BG] = [BG]`; `π = s^! = id`; restriction sends `s_*[𝓜]` to `[𝓜]` while `s^!s_*[𝓜] = c_r(E) ∩ [𝓜]` (`−[pt]` for `O(−1)` on `ℙ¹`); `s'^!q^* = s'^!π'^*(π^*)^{−1} = s^!` | matches Lemma 5.5 and the route (Lemma 3.8, `chow_affine_bundle`, push–pull) | none |
| 5.2 Chern classes | `O(−1)` on `ℙ¹`; `BG`; `L ⊕ L^∨`; `O^n` | `−1`; `A_{−i}(BG)_ℚ = 0` for `i > 0`; `(1 + x)(1 − x)`: `c_1 = 0`, `c_2 = −x²`; `c = 1` | matches | none |
| 6.1 (headline) | `BG`; `[𝔸¹/μ₂]`; char `p` quotient; char `0` | `(1/|G|)[pt]`; `ℤ/2 → 0`, `p_*[Bμ₂] = (1/2)[0]`; `𝒱 = 𝔸¹_y × B(ℤ/p)` over `Spec k[y^p]`, `deg = (1/p)·p = 1 ≠ 1/p`, `k(y^p)` not perfect; every `k(p(𝒱)) ⊇ ℚ` is perfect | matches (2.4)–(2.5), (6.1) | none |
| 6.2 (headline) | `G = 1`; `μ_n` on a point; `𝔾_m` on `𝔸² ∖ 0`; `𝔾_m` on `𝔸¹` | identity, `g = 0`; `ℤ[t]/(nt) ⊗ ℚ = ℚ` in degree `0` only, `A_0(Bμ_n)_ℚ = ℚ`, `A_k = 0` for `k ≠ 0`; `A^{𝔾_m}_2 = A_{l+1}(O(−1)^{⊕l} ∖ 0) = A_1(ℙ¹) = ℤ = A_{2−1}(ℙ¹)`, while `A_2(ℙ¹) = 0`; stabiliser `𝔾_m` at `0`, excluded; route: `dim [(X × (V∖U))/G] < i + l − g`, so localisation (3.4) and homotopy invariance (5.1, `[X/G]` separated DM has a proper cover) give the shift `i − g` | matches Propositions 10–11 without the quasi-projective quotient | none |
| 7.4 `h¹/h⁰` | `[O --id--> O]`; zero differential; `O[1]`; `O[0]`; `Ω_X[0]`; `[I/I² → Ω_W|_U]` | `E^∨ = [O --id--> O]`, `[𝔸¹/𝔾_a] = pt`; `𝔸¹ × B𝔾_a`; `E^∨ = [0 → O]`, `𝔸¹`, a sheaf; `[O → 0]`, `B𝔾_a`, a gerbe; `BT_X`; `[N_{U/W}/T_W|_U]` | matches l.535–544, 631–634, Proposition 2.4 and `[E_1/E_0]` of Convention 7 | none |
| 8.1 relative local embeddings | `BG → Spec k` with `(Spec k, Spec k)` and its product; `k[x]/(x²) ⊂ 𝔸¹`; `f = id` | `K = 0`; product `(G, Spec k)`, `G → Spec k` finite étale not an immersion, `K = 0`; `K = [(x²)/(x⁴) → A dx]`, `x² ↦ 2x dx`, `0` in char `2`; `(U, U)` with `U → 𝔐` étale, `K = [0 → 0]` | matches Definition 3.7 and l.930–933, 940–959 | none |
| 8.2 truncated cotangent complex | étale; smooth; `k[x]/(x²)`; `k[x,y]/(x,y)²` | `0`; `Ω[0]`; `I/I² = A·x²` (basis `x², x³`), `d(x²) = 2x dx`, `d(x³) = 2x² dx = 0`; char `≠ 2`: `h^{−1} = k x³`, `h^0 = A dx/(x dx) = k`; char `2`: `h^{−1} = h^0 = A`; fat point: lengths `7` and `6`, image spanned by `2x dx`, `y dx + x dy`, `2y dy`, so `h^0` of length `3`, `h^{−1}` of length `4` | matches l.1649–1651 and DerivedModuleAlgebra §0.7 | none |
| 9.2 obstruction theories | `φ = id`; `E = 0`; `ℙ¹` with `[O(1) --0--> Ω]`; `Spec k → Spec k[ε]` | perfect iff `N` vector bundle stack (8.4); obstruction theory iff `τL = 0` iff étale; `h^0` iso, `h^{−1}: O(1) → 0` onto, `rk = 1 − 1 = 0`, `Ob = h^1([T --0--> O(−1)]) = O(−1)`; `τL = k[1]` perfect, `vd = −1 ≠ 0 = dim` | matches Definitions 4.4, 5.1 and l.1268–1273 | none |
| 9.4 basic example | `W = 𝔸¹`, `V = O`, `s = x²`; `s = 0`; `s` regular; the general square | `E = [O_X --2x dx--> O_X dx] = τL_X`, `vd = 0`; `[O --0--> Ω_{𝔸¹}]`, `Ob = h^1([T --0--> O]) = O`, `vd = 0`; `E ≅ τL_X`; the zero locus is `W ×_V W` with `N^∨ = V^∨` and the map `ds`, `vd = n − r` | matches l.1503–1519 | none |
| 10.3 (headline) | `E = 0` two resolutions; `F ⊕ [G --id--> G]`; the `ℙ¹` example of 10.1 | `K_1 = M ×_M (𝔸¹ × M) = 𝔸¹ × M`, both `0^!` give `[M]`; `C(F) × G_1` in `F_1 × G_1`, class unchanged by 5.1; `Ext¹(Ω_{ℙ¹}, O(−4)) = H¹(O(−2)) = k ≠ 0` with no homotopy (`H⁰(O(−2)) = 0`), so the fibre-product `K_1` is needed | matches Proposition 5.3 | none |
| 8.5 pure dimension (headline) | `k[x]/(x²) ⊂ 𝔸¹`; fat point; `Spec k → B𝔾_m` | `C = [M × 𝔸¹/T_{𝔸¹}]` of dimension `0`; `dim C = 0 ≠ dim N = 1`; `B𝔾_a` of dimension `−1 = m` | consistent | none |
| 9.3 (headline) | char `2`, `k[x]/(x²)`, `φ = (0, id)`; smooth `M`; `ℙ¹` | `φ^*ω = 0` yet `(x + ax²)² = x² ≠ 0` in `k[x]/(x³)`; `φ^∨ = id_{BT}`; zero section of `C(O(1)) × BT`, closed immersion, not iso | matches Theorem 4.5 | none |
| 10.2, 10.4–10.6, 10.8 (headline) | `E = Ω[0]`; `ℙ¹` with `[O(a) --0--> Ω]`; `[O^s → 0]`; `ℙ¹ × ℙ¹`; origin of `𝔸¹`; `Z(x² + y²) ⊂ ℙ¹`; `BG` | `[M]`; `−a`, `0` for `a = 0`; `A_{−s} = 0`; `(−1)² = 1`; `v^![𝔸¹ × Y] = [Y]`; `2`; `1/|G|` | match | none |
| 11.4–11.6 (headline) | `X = pt`; `ℙ¹ → ℙ^r`; elliptic `C → C`; lines in `ℙ²`; CY3 | `E = 0` iff étale; `H¹(F^*T) = 0`, `dim = (r + 1)d + r`; `Ob = H¹(O) = k` trivial on translates, class `0`; `3 + 2 − 3 = 2`; `vd = n` | match Proposition 6.2, l.157–161, 193–197 | none |
| Conventions 4–8 | `[𝔸¹/μ₂]`; `BG`; `C(O(1))` on `ℙ¹`; `[O(1) --0--> Ω]`; separated DM | `ℤ/2` vs `0`; `1/|G|`, `|G|`, product `1`; total space of `O(−1)`, degree `−1`; `rk 0`, `Ob = O(−1)`; finite diagonal is affine | witnesses consistent across layers | none |

**Repaired patterns elsewhere.** The F02 pattern (a route narrower than the statement) was looked for in
every theorem with a case split: 10.6 (the regular case is stated only for a regular local embedding `v`),
10.8 (uses the regular case of 10.6 for `𝔐 × {b} ⊂ 𝔐 × B`), 8.3 (the lci case is stated with "if the
relative local embeddings can be chosen regular"), 4.5 (the factorisation independence is a stated
target), 6.2 (the route covers every separated DM `[X/G]`): none narrower than its statement. The F01
pattern (a correction of a source without the published correction) occurs only at Proposition 3.5, now
cited, and at the new Proposition 5.10 Check, where the roadmap's own counterexample is the record and is
stated as a Check; no published correction of that step is known to me.

**Shape and completeness.** Headings in TauCetiRoadmap form; every layer ends with Examples and
Dependencies; every definition has its API and at least three discriminating Checks (plan: none under
three); every theorem states its hypotheses and a locator; standing hypotheses (Conventions 1–3, 8, the
Layer 8 and Layer 10 preambles) are in scope where used; 10.7's `*Needs:*` matches the plan's prerequisites.
Lean form, elaboration, the `#check` comparison and the one-tactic probe: not available (design stage, no
`Suggested.lean`; this lane does not elaborate).

**Headline theorems (from the Summary).** The coarse-space comparison (6.1), the degree of zero-cycles
(6.3), the intrinsic normal cone of pure dimension `dim 𝔐` (8.5), the characterisations of obstruction
theories (9.3), the virtual class with its properties (10.2–10.8), the obstruction theory of spaces of maps
from curves (11.4–11.6). None is statable at the pins (no Deligne–Mumford or algebraic-stack carrier in
Mathlib or Tau Ceti at the pins, grep above); the package's module docstring must name each and the
missing carrier.

**Ownership.** `roadmaps grep` over main and the 470 open pull requests: "intrinsic normal cone" has no
match; "virtual fundamental class" matches only ImplicitAtlases (the topological class, named in the
scope section as a different object); "compatible … obstruction theory" matches only unrelated deformation
sentences of AlgebraicModuliForArithmeticGeometry, GeneralAlgebraicKTheory and EnriquesSurfaces; "Canonical
rational equivalence" only an unrelated sentence of CohomologyComparisonsPartII; "Vistoli" only
bibliographies (Borne–Vistoli, Abramovich–Vistoli). This roadmap is the owner. Ownership against open pull
requests whose files the brief does not provide was not checked beyond the grep tool.

**Declared gaps.** None declared; none needed (every prerequisite resolves).

**Manifest.** 22 entries, none changed by this review; `kresch1999b` now carries the theorem locator,
the split `cited_for` and the version note; no local path.

## Not verifiable

- gillet1984 §4 and fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6: settled as
  uncertified; cited by locator only.
- kresch1999b: read in the arXiv version v2; the published numbering (Invent. Math. 136) could not be
  compared (paywalled); the design cites the version read, as its References and manifest say.
- The identification `[u^*C/T_{Y'}] = 𝔉 ×_{u^*𝔈} u^*C_X` (behrend-fantechi1997 line 1419, used at the same
  step of 10.7's route) is asserted by the source without proof; it was checked on the `st` instance (both
  sides `BT_{𝔸²}`) and not in general.
- MotivicStructuresInModuliOfCurves, named under Downstream consumers: it is listed in the merge order
  (line 328, before this roadmap's insertion point) but has no README on main, in any open roadmap pull
  request or on the board, so what it consumes could not be read. The entry is informational and creates
  no dependency edge.
- Lean elaboration, the `#check` comparison and the one-tactic probe: not available at the design stage.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 5.10, proof of the general case, printed page 44: the
  source says `F` is compatible with the product theory `Ω_{Y'} ⊞ E` on `Y' × X` over the graph of `v`; it
  should say no theory on `Y' × X` need be compatible with `F` over the graph (for a conic in `ℙ²`,
  `X = ℙ² × ℙ¹` and `E = Ω_X ⊕ (O(−2) ⊠ O(−2))[1]`, the `k`-invariants differ); affects the proof (the
  proposition survives by forming Lemma 5.9's rational equivalence in the ambient `Y' × Y × M`).
- **Error** in behrend-fantechi1997 at Proposition 3.5, printed page 26: the source says Vistoli's rational
  equivalence is invariant under the whole tangent bundle of the ambient smooth stack; it should say
  invariant under the tangent bundle of the regularly embedded substack (for `𝔸²`, the origin and
  `{y = 0}`, `β = c·ν/η` moves under `η ↦ η + b`); affects a stated result and the proof of Lemma 5.9,
  which uses only the true part; corrected in print at kresch1999b Theorem 3.1 with the remark at its
  lines 340–343.
- **Misprint** in kresch1999b at Theorem 3.1 and the paragraph before it, printed page 10: the source names
  the acting group as the tangent bundle of the arbitrary substack `Y'` and the second cycle as the normal
  cone of `X'` in `Y'`; it should be the tangent bundle of the smooth substack `X` and the normal cone of
  `X'` in `X` (the proof acts by `𝔸^m = T_X`, and line 304 gives the cone of `N|_{X'}` in `N`); affects a
  stated result (the intended meaning is clear from the proof).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f39b4416307f2544bb12549169278f6794f22e86", "job": "REV-DESIGN-VirtualFundamentalClasses~4", "model": "fable", "worker": "chris-x10"} -->
