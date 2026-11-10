# FIX-PKG-MappingClassGroupsAndCanonicalRepresentations~3

Repair round for `REV-PKG-MappingClassGroupsAndCanonicalRepresentations~2` (16 findings: one P1,
nine P2, six P3) and for the gate failure `dropped=15` (SurfaceTopology). Every finding was checked
against the cited supplier (on main or at the head of its open pull request, read with
`roadmaps show`), the pinned libraries, or the cached source text. All sixteen are right and all
are applied. Files changed: `packages/MappingClassGroupsAndCanonicalRepresentations/README.md`,
`packages/MappingClassGroupsAndCanonicalRepresentations/design/plan.json` (top-level `gaps` only),
`packages/MappingClassGroupsAndCanonicalRepresentations/sources.toml` (two new entries; `cited_for`
of `KP20` extended, and of `LL22`, `Kor02`, `Hat02`, `FM12` moved to the new section numbers). `Suggested.lean` and `metadata.toml` are unchanged: no finding touches a Lean
statement (R07 itself says the Lean subgroup is correct).

## R01 (P2) — applied

Verified: SurfaceTopology is on the brief's never-a-supplier list; GeometricTopology (main) §1.7.2
owns compact mapping classes, the twist `([θ], t) ↦ ([θ + φ(t)], t)` on a `dθ ∧ dt` tube, the action
`[x] ↦ [x] + (c · x)[c]` and Lickorish; §11.2.1 item 5 identifies smooth and topological classes.
Changed: the SurfaceTopology Scope bullet, contract and all 15 citations → GeometricTopology §§1.7,
1.7.2, 11.2.1 and MordellLawrenceVenkatesh LV.5; new contracts for both; the convention Check
(`T_a[b] = [b] + [a]`) is kept in §0.3.

## R02 (P2) — applied

Verified: ORDER puts MordellLawrenceVenkatesh at 161, this roadmap at 291; its head owns §§5.1, 5.4,
5.7, 5.9–5.13, 5.15–5.17, 5.19–5.21 (surfaces, `Mod(S)`, twists, homology action, primitive
classes, asphericity, centre, evaluation fibration, push, Birman, capping), with twist `T^{LV} = T⁻¹`.
Changed: old §0.4 deleted; old §§0.3/0.5 replaced by a new §0.3 (convention comparison, formulas in
the positive convention, pure Birman sequence); old §0.6 → §0.4 (all circles, pure, based); old
§0.7 → §0.5. The "no roadmap … earlier in the merge order" claim and the downstream MLV bullet are
gone.

## R03 (P2) — applied

Verified: InverseGalois §IG.1.4's finite-image Check proves arithmeticity by descending the cover
and its group action, orbit `≤ [K′ : K]`, in every characteristic. Changed: §10.3 deleted; §10.4 →
§10.3 with "(1) ⇒ (2) is the finite-image criterion of §IG.1.4", §10.5 → §10.4; the Scope
justification is replaced by the import; the IG contract states the criterion; a Check (orbit `1`,
orbit `≤ d`) is added to §10.3.

## R04 (P2) — applied

Verified: KP20 §§4–6 (lines 390, 449, 567, 632, 648–681, 682–759, 761) and EG18 Lemma 3.4 (line
410); AutomorphicLFunctionsAndLocalFactors (ORDER 95) §AL.3 owns Lafforgue's `GL_r` correspondence
at every level; GlobalShtukas (ORDER 360, later) owns curve companions and excludes higher-dimensional
Drinfeld. Changed: §5.10's blanket sentence → five steps with exact inputs; new §5.9a (Drinfeld's
companions, pro-semisimple comparison, `G`-valued companions, three Checks incl. `q`-slope and
`SO(4)`); gaps `curve-companions` (AL §AL.3) and `tame-specialization` (IG §IG.1.3).

## R05 (P3) — applied

Verified at the pin: `TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean`
lines 132 and 139 declare `TauCeti.groupCohomology.mono_HInfRes_f` and `HInfRes_exact` (vanishing for
`0 < i ≤ n`). Changed: all five occurrences (contract, §1.1 twice, Layer 1 Dependencies) renamed;
the contract adds that for `n = 0` the hypothesis is empty.

## R06 (P2) — applied

Verified: ResolutionOfSingularitiesCharacteristicZero (main) §6.2 states the SNC compactification
with the three properties used; the three `sncCompactification_*` names occur nowhere. Changed: the
AlgebraicModuli contract → a ResolutionOfSingularities §6.2 contract in prose (with its
`𝔾_m² ⊂ ℙ¹ × ℙ¹` Check); the Scope bullet, §7.2 `*Needs:*` and Layer 7 Dependencies no longer cite
AlgebraicModuliForArithmeticGeometry §9.5.

## R07 (P1) — applied

Verified: `surfaceGroup 0 1 = ⟨c | c⟩ = 1`, so `c₁ = c₁⁻¹`; for `(1, 1)` the class `[c₁]` is `0`.
Changed: §0.2's bullet now excludes `(0, 1)`, argues by abelianization for `n ≥ 2` (`c_n = −Σ_{j<n} c_j`,
nonzero), and for `n = 1, g ≥ 1` by the free group (`h w h⁻¹ = w⁻¹ ⇒ w = 1`); a negative-control Check
(punctured sphere; punctured torus needs the free-group argument) is added. Lean unchanged.

## R08 (P2) — applied

Verified: FreeGroupsAndLimitGroups §6.2 (main) states non-freeness for `m = 0` and `χ ≤ 0`.
Changed: the contract now reads "for `m = 0` the closed orientable group is not free when `g ≥ 1`,
while for `g = 0` it is trivial, free of rank zero"; §0.1's torus Check adds `surfaceGroup 0 0 = 1`
versus `ℤ²`. No other "not free" claim exists in the README.

## R09 (P2) — applied

Verified the witness: for `A = ℂ[x, y]/(x, y)²`, monodromy `1 + x`, `H⁰(V) = ker x = 𝔪` (dim 2),
`𝔪 ⊗ A/𝔪` dim 2, `H⁰(A/𝔪) = ℂ` dim 1. Changed: the README gap and the plan.json `needs` now state
`R^q f_*(V ⊗_A f^*W) ≅ R^q f_* V ⊗_A W` for `W` a local system of finite free `A`-modules; the
witness is recorded under the gap. The §4.5 uses already have `W` free.

## R10 (P2) — applied

Verified: `A = [[0, −1], [1, −1]]`, `A³ = I`, `A^{−T} = [[−1, −1], [1, 0]]`,
`J⁻¹A^{−T} = AJ⁻¹ = [[−1, 0], [−1, −1]]`. Changed: §6.1's bullet now separates evaluation
(`H¹ ≅ H₁^*`, contragredient, `σ` ↔ dual of `σ^∨`) from compact Poincaré duality (`H¹ ≅ H₁`,
label-preserving); an elliptic-curve order-three Check is added. §§6.4, 6.5, 6.7 were rechecked and
already use label-preserving duality.

## R11 (P2) — applied

Verified: the image of `H₁(open) → Hom(V₂, V₁)` is a quotient; §6.5 bounds subspaces of `H¹(open)`.
Changed: §9.2 now dualizes the surjection onto each `I_σ`, getting a `Γ′`-stable `I_σ^∨ ⊂ H¹(open)`
in the `σ^∨`-component, `dim ≤ ab`, and applies §6.5 with `2g − 2ab > ab` (`3ab < 3(g + 1)/4 ≤ 2g`);
the shear Check (no section; `e₂*` fixed) is added.

## R12 (P3) — applied

Verified: coarse `j`-line `ℂ`, `π₁ = 1`. Changed: §2.3's `(1, 1)` Check now lists the stack
(`SL₂(ℤ)`), the effective orbifold with cone points `2, 3` (`PSL₂(ℤ)`) and the coarse line (`1`).

## R13 (P3) — applied

Verified: `V = π°^*χ` with `χ` of infinite order has irreducible fibre restriction and `det V = χ`.
Changed: §4.5's Check requires finite-order determinant for `U₁ = V` and adds the example on an open
subset of a level chart with a dominant `f : M → 𝔾_m`, `χ = f^*(1 ↦ exp(2πi√2))`, decomposition
`U₁ = ℂ`, `W₁ = χ`.

## R14 (P3) — applied

Verified: `Mod(D², ∂) = 1`; for `F₀`, `Σ₀`, `H = 0` and `U = 1`. Changed: §0.4 Check (`g ≥ 1`, disc as
negative control), §9.7 Check (`N ≥ 1`, `N = 0` control), worked example (`g ≥ 1`; genus zero: image
size `1`, socle `ℂ`, split). Same pattern repaired in §3.1's two Checks, §9.1's Check and §9.3's
Check (each now `g ≥ 1` or `H ≠ 0`, with the zero case stated).

## R15 (P3) — applied

Verified: `(−1, 3)_ℚ` ramifies at `2` and `3` (Hilbert symbols `−1`), split at `∞`; the matrices
satisfy `i² = −1`, `j² = 3`, `ij = −ji`; LL22 Theorem 1.2.5 (line 100) and Remark 1.2.6 (line 108).
Changed: §5.1's Check drops universal non-integrality, gives the discriminant-six arithmetic example
(integral), and the very-general contrast `2 < 2√(g + 1)`.

## R16 (P3) — applied

Verified: LL22 Definitions 2.1.1, 2.1.2, 2.2.8, 2.2.9, 2.4.1, 2.4.2, 3.3.1, Proposition 6.3.6
(lines 401–742, 1538); LL24 Remark 5.2.5. Changed: §5.2 defines filtration, weights, `par-deg`,
`µ⋆` (positive rank), induced structures, semistability, `Ê₀`, the parabolic Deligne extension;
three API bullets; Checks for `Ê₀ = O_C(−D)` (`h⁰ = 0` vs `1`) and a destabilizing `O(1)`. §5.3 now
names the slope `µ⋆(E⋆) = µ⋆(Ê⋆)` and requires `E⋆` nonzero.

## Checks run

- `lake env lean packages/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean` from the
  content checkout: exit status 0; output exactly three warnings `declaration uses sorry` at lines
  160, 175 and 184. No `TauCeti.*` import, so nothing to build first.
- Signature check: a scratch copy of the file with `#check @name` for all 11 declarations
  (`surfaceRelator`, `surfaceGroup`, `instGroupSurfaceGroup`, `peripheralLoop`,
  `pureMappingClassAut`, `HasFiniteConjugacyOrbitUnder`, `prymStabilizer`, `compactPrymCohomology`,
  `putmanWieland_of_card_lt`, `mcgFinite_finite_image`, `freeGroup_finite_image`) elaborated once.
  Every elaborated type equals its README statement (`[Fintype H]`, surjectivity, `Γ′ ≤
  prymStabilizer ϕ`, nonzero relative index and fixed-class hypothesis retained; strict `r ^ 2 <
  g + 1`; `N = 2g ∨ N = 2g + 1`). No binder lost; nothing changed, since the file is unchanged.
- Dependency check (command of the brief), output:

  ```text
  depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- Package gate rules, run on a scratch copy laid out as `TauCetiRoadmap/<Name>/` (README.md,
  Suggested.lean, metadata.toml): `set_option`, blob, latex, tex, prnum, sorry-data,
  sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib,
  lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections,
  round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files and
  source-material all `0`. The only failure, `git`, is an artefact of the scratch copy, which is not
  a git repository.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The
  pinned names were also opened by hand: `TauCeti.IsAspherical`, `TauCeti.socle`,
  `TauCeti.isSemisimpleModule_socle` (an instance), `ContRepresentation.IsUnitary.isSemisimpleRepresentation`
  (`InvariantComplement.lean` line 190), `TauCeti.sum_characterDegree_sq_eq_card`,
  `TauCeti.IsProjectiveRep`, `.toPGL`, `.cohomologyClass`, `.cohomologyClass_eq_zero_iff`
  (`SchurMultiplier.lean` line 270), `TauCeti.isProjectiveRepEquivExtensionHom`,
  `MonoidHom.exists_isProjectiveRep_toPGL_eq`, `TauCeti.LocalCoefficientSystem` and
  `.monodromyRepresentation`; Mathlib `groupCohomology.H1InfRes_exact` (`Functoriality.lean` line
  402), `Representation.IsIrreducible.bijective_or_eq_zero`, `LinearMap.bijective_or_eq_zero`,
  `isotypicComponent`, `FundamentalGroup.mul_def`, `Representation.ind`.

## Adversarial pass

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.2 non-inversion (R07) | `(g, n) = (0, 1), (0, 2), (0, 3), (1, 1)` | `(0,1)`: group `1`, `c₁ = c₁⁻¹`; `(0,2)`: `[c₁] = 1`, `[c₂] = −1` in `ℤ`; `(0,3)`: `[c₃] = −[c₁] − [c₂] ≠ 0` in `ℤ²`; `(1,1)`: `[c₁] = 0`, `c₁ = b a b⁻¹ a⁻¹ ≠ 1` in `F₂` | `(0,1)` excluded; free-group argument added for `n = 1` |
| §0.1 / contract, closed freeness (R08) | `g = 0, 1, 2`, `n = 0` | `1 = F₀`; `ℤ²` (abelian rank 2, not free); abelianization `ℤ⁴`, Hopfian argument | `g ≥ 1` added; genus-zero Check |
| §0.3 twist comparison | model annulus; torus | `(θ′, t) ↦ (θ′ + t, t)`, `t = 1 − s`: `θ′ + 1 − s ≡ θ′ − s`; `dt ∧ dθ′ = dθ′ ∧ ds`; `[[1,1],[0,1]] · [[1,−1],[0,1]] = I`, `[[1,0],[−1,1]] · [[1,0],[1,1]] = I` | `T^{LV} = T⁻¹` confirmed |
| §0.3 push sign | collar witness; genus two | `ψ(0) = 1`, `ψ(±1) = 0` gives `T_a⁻¹T_b`; homologous push-offs give `x` in both conventions | sign fixed by the collar, not by homology |
| §0.3 pure Birman | `(0, 3)`; torus | kernel `F₂`, quotient `1` (pure) vs `S₃` (punctures permuted); torus `Push` trivial, `χ = 0` | pure restriction changes quotient only |
| §0.4 capping | `(0,1,0)`, `(1,1,0)`, `(0,3,0)`, `b = 0` | `χ`-index `−1`: `Mod(D²) = 1`; kernel `ℤ`, quotient `SL₂(ℤ)`; kernel `ℤ³`, quotient `1`; identity | disc control added; rank `b` only in hyperbolic range |
| Gap `local-system-direct-images` (R09) | `W = A/𝔪, A, A²` | `dim 𝔪 ⊗ A/𝔪 = 2 ≠ 1`; `𝔪 → 𝔪` identity; `dim 𝔪² = 4 = 4` | finite free `W` required |
| §2.3 `(1,1)` (R12) | stack, effective orbifold, coarse | `SL₂(ℤ)`, `PSL₂(ℤ)`, `1` | three objects separated |
| §3.1 / §9.1 / §9.3 / worked example (R14) | `g = 0, 1`; `H = 0` | `g = 0`: `U = 1` on `ℂ`, socle `ℂ`, split, image size `1`; `g = 1`: `SL₂(ℤ)` sends `ℚ(1,0)` to `ℚ(1,k)`, all `k`; rank `3`, `9 < 2` false | `g ≥ 1` / `H ≠ 0` added |
| §9.7 Check (R14) | `N = 0, 1` | `F₀`: trivial rank one; `F₁`: `[[1,1],[0,1]]`, infinite order | `N ≥ 1` added |
| §4.5 Check (R13) | `V = π°^*χ`, `χ(1) = e^{2πi√2}` | `det V = χ`, `χ^{km} ≠ 1` for `km ≠ 0` (`√2` irrational); `U₁ ⊗ π°^*W₁ = ℂ ⊗ χ = V` | finite determinant required |
| §5.1 Check (R15) | `B = (−1, 3)_ℚ`; very general `g = 2, 3` | `(−1,3)_2 = −1`, `(−1/3) = −1`, split at `∞`; `i² = −1`, `j² = 3`, `ij = [[0,3i],[−i,0]] = −ji`; `2√3 ≈ 3.46`, `2√4 = 4`, both `> 2` | integral example and very-general contrast |
| §5.2 definitions (R16) | trivial line, `n = 1`; unitary character on `ℙ¹ ∖ {0, ∞}`; `O ⊕ O(1)` | `Ê₀ = O(−x)`, `h⁰ = 0` vs `h⁰(O) = 1`; `−1 + a + (1 − a) = 0`; slopes `1/2 < 1` and `(1 + a)/2 < 1` | `Ê₀`, positive rank and slope defined |
| §5.3 Clifford bound | `g = 0`; dual twist | trivial for `g = 0` (LL22 line 1546); `µ⋆((E⋆)^∨ ⊗ ω(D)) = 0 + 2g − 2 + n` | slope named; `E⋆ ≠ 0` |
| §5.9a weights/companions | `X₀ = Spec k`; rank-one `F = q` | `Π = ℤ̂`, dense abelian image in semisimple group is finite, `Π̂ = ℤ̂`, comparison identity; `F = q`: closure `𝔾_m`, weight `2`, slope `1`; twist by `q⁻¹`: weight `0`, slope `0` | determinant condition necessary |
| §5.9a vs faithful-representation companions | `SO(4)`, `R(π/2) ⊕ R(±π/3)` | both `(x² + 1)(x² − x + 1)` on `ℂ⁴`; `∧²₊` traces `1 − √3 ≈ −0.732`, `1 + √3 ≈ 2.732` | GIT-quotient compatibility needed |
| §5.10 route | `GL₁`; character `2` on `𝔾_m`; `PGL_r` | finite-order characters integral; `2 ↦ 2^q ≠ 2`, no descent over any `k(s)ⁿ`; order `m`: descends once `q ≡ 1 mod m`; `PGL_r^{ab} = 1` | quasi-unipotence needed at descent |
| §6.1 duality (R10) | `A = [[0,−1],[1,−1]]`, `J` | `A² = [[−1,1],[−1,0]]`, `A³ = I`; `J⁻¹A^{−T} = AJ⁻¹ = [[−1,0],[−1,−1]]`; `ζ₃ ↦ ζ₃` | labels preserved by duality |
| §9.2 dual injection (R11) | shear on `ℂ²`; `a = b = 1`, `g = 4`; `g = 1` | no section (`(x,1) ↦ (x+1,1)`), `e₂*(x − y, y) = y`; `2g − 2ab = 6 > 1`, `3 < 3.75 ≤ 8`; `g = 1` forces `r ≤ 1`, `ab = 0` | dualization before §6.5 |
| §10.3 via §IG.1.4 (R03) | trivial; degree-`d` descent | orbit `1`; orbit `≤ d` | imported |
| Gap `tame-specialization` | residue char `0`; ordinary elliptic curve | identification; pro-`p` `ℤ_p² → ℤ_p`, surjective, not injective | surjection only |
| `HInfRes_exact` (R05) | `n = 0` | hypothesis `∀ i < 0` empty; degree-one sequence | rename only |
| RoS §6.2 contract (R06) | `𝔾_m² ⊂ ℙ¹ × ℙ¹` | boundary `{0,∞} × ℙ¹ ∪ ℙ¹ × {0,∞}`, four smooth components meeting transversally | prose contract |

## Gate failure `dropped=15` (SurfaceTopology)

Each of the 15 hits was replaced, none merely deleted without a supplier: line 80 (Scope bullet) →
GeometricTopology §§1.7, 1.7.2, 11.2.1 bullet plus a MordellLawrenceVenkatesh LV.5 bullet; line 250
(contract heading and body) → contracts "From TauCetiRoadmap.GeometricTopology" and "From
TauCetiRoadmap.MordellLawrenceVenkatesh"; line 390 (Layer 0 intro) → rewritten around the two
suppliers; line 398 (`Σ_{g,b,p}`) → MordellLawrenceVenkatesh §§5.1, 5.4; line 420 (§0.1 `*Needs:*`)
→ MordellLawrenceVenkatesh §§5.1, 5.4; lines 450 and 465 (§0.2) → MordellLawrenceVenkatesh §5.9 and
GeometricTopology §§1.7.2, 11.2.1; lines 487, 500, 508 (old §0.3) → new §0.3 citing
GeometricTopology §1.7.2 and MordellLawrenceVenkatesh §§5.11–5.12; line 598 (old §0.7 `*Needs:*`) →
GeometricTopology §1.7.2 (Lickorish) and MordellLawrenceVenkatesh §5.10; line 617 (Layer 0
Dependencies) → the new list; line 1714 (§7.1 `*Needs:*`) → MordellLawrenceVenkatesh §§5.7, 5.10 and
GeometricTopology §1.7.2; line 1847 (Layer 7 Dependencies) → the same; line 2532 (downstream bullet)
→ deleted with the bullet (R02). `grep` for every never-a-supplier name over README, Suggested.lean,
metadata, sources and plan.json returns nothing; the gate rule `dropped` is `0`.

## For the maintainer

- New supplier gaps (plan.json and README "Exact supplier contracts"): `curve-companions`
  (AutomorphicLFunctionsAndLocalFactors §AL.3: Lafforgue's companions, weight zero and local
  compatibility on curves, deduced from its `GL_r` correspondence) and `tame-specialization`
  (InverseGaloisAndArithmeticFundamentalGroups §IG.1.3: surjectivity onto the tame group). The
  `local-system-direct-images` gap now requires `W` finite free.
- Curve companions are also stated by GlobalShtukasAndFunctionFieldLanglands §6.2, which is later
  in the merge order (360) and so is not cited here. Once AL §AL.3 supplies gap:curve-companions,
  that roadmap should cite it rather than own the statement; this settles the shared ownership in
  the direction AL → both consumers.
- Ownership moved down: Drinfeld's companions on smooth varieties and the pro-semisimple comparison
  (new §5.9a) had no owner. GlobalShtukas excludes them explicitly, DeligneWeightsAndPurity (ORDER
  73) precedes the Lafforgue supplier (95) and cannot own them, and no other roadmap on main or open
  states them (searched for "pro-semisimple", "Pro-ss", "Drinfeld … companion").
- Renumbering inside this package: old §§0.3 + 0.5 → §0.3, old §0.4 deleted, §0.6 → §0.4, §0.7 →
  §0.5; §10.3 deleted, §10.4 → §10.3, §10.5 → §10.4; new §5.9a. No roadmap cites these ids
  (StableReductionPartII names this roadmap only, without section), so no mapping table was added.
- New supplier edges: GeometricTopology (main), MordellLawrenceVenkatesh (ORDER 161),
  AutomorphicLFunctionsAndLocalFactors (95), DeligneWeightsAndPurity (73),
  ResolutionOfSingularitiesCharacteristicZero (main) directly; AlgebraicModuliForArithmeticGeometry
  and SurfaceTopology are no longer cited. All lie before position 291.
- Sources: `Dri18` (arXiv:1509.06059v8) and `Dri12` (arXiv:1007.4004v7) were fetched through the
  sources service, both certified open-repository texts; `KP20`'s `cited_for` was extended and the
  `cited_for` lists of `LL22` (10.4 → 10.3), `Kor02` (0.7 → 0.5), `Hat02` (0.4 dropped) and `FM12`
  (0.5, 0.6 → 0.3, 0.4) follow the renumbering. No text was missing, so there is no
  `needs-references.toml`.
- Ownership against open pull requests was checked for the objects touched this round
  (MordellLawrenceVenkatesh, AutomorphicLFunctionsAndLocalFactors, DeligneWeightsAndPurity,
  InverseGaloisAndArithmeticFundamentalGroups, GlobalShtukasAndFunctionFieldLanglands,
  ArithmeticGaloisDuality, WeightsInEtaleCohomology, PotentialModularityAndCompatibleSystems,
  AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology, EtaleHomotopyTypes), at their heads
  through `roadmaps show` and `roadmaps grep`.
