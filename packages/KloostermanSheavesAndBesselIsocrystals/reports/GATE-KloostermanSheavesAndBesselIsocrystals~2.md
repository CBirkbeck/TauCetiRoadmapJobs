# GATE-KloostermanSheavesAndBesselIsocrystals~2: answers to the review of `13efcb3`

One review comment (CBirkbeck, 2026-11-15T14:18:17Z) with 21 findings F01–F21, numbered H01–H21 here in the
same order. The quoted copy given to this job was truncated inside F11; the full comment (34 kB) was read
from the pull request and F12–F21 are answered from it. Repairs are in commit `8fd0dade` on top of
`13efcb3`; files: `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md`,
`TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`.

## H01 (CBirkbeck) — applied

§1.3 now says `F-Sat_G` is equivalent to the full subcategory of `σ`-semilinear representations of `H(L) ⋊ ℤ`
whose restriction to `H(L)` is algebraic (XZ Proposition 3.6.5(ii), p. 35, XZ line 1654–1656; Theorem 3.6.7(ii),
XZ line 1693), with `σ = id_L` for the standing `q`-power Frobenius, and that the direct sums of the normalized
`IC_μ` give `Rep(H)` (XZ (3.6.8.1), XZ line 1710). A Check adds the valuation character `t ↦ ϖ^{v(t)}` of `L^×`
as the excluded nonalgebraic object, with every `t ↦ t^m` kept.

## H02 (CBirkbeck) — applied

§6.3 now derives the finite solvable subgroups of `PGL₂(K̄)` (cyclic, dihedral, `A₄`, `S₄`) from McKaySkewGroup
§0.2 (on main) through finite inverse images in `SL₂` and an embedding into `ℂ` of the entry field; McKaySkewGroup
§§0.1–0.2 is added to the scope list, a new supplier contract, §6.3 *Needs* and the Layer 6 Dependencies. A Check
records binary tetrahedral (24) → `A₄` (12) with wild `V₄`, and binary icosahedral → nonsolvable `A₅`, excluded
as an inertia image.

## H03 (CBirkbeck) — applied

§7.5 now cites the recognition theorem of ArithmeticGaloisRepresentations §5.13 (`C = U = 𝔾_m`, `ℓ ≠ p`, geometric
Frobenius both sides, characteristic polynomials from exterior powers of a faithful `W`), with a new supplier
contract, scope entry and Layer 7 Dependencies, and records the `(1 − T)²` unipotent countermodel excluded by
semisimplicity. Semisimplicity of the two `ℓ`-adic local systems comes from their reductive arithmetic monodromy
(§7.6), so §7.5 now needs §7.6; §7.6's *Needs* no longer lists §7.5, which its route never used (XZ Corollary 4.5.6,
XZ line 2469–2477, precedes Theorem 5.1.4 and its proof uses only D'Addezio), so no cycle is created.

## H04 (CBirkbeck) — applied

§RD.3.43 of PadicDifferentialEquationsAndRigidCohomology is stated for convergent F-isocrystals only and §RD.5.101
defines log-isocrystals without a Newton theorem, as claimed; a new supplier gap `gap:log-newton-semicontinuity` is
declared there and cited in §5.3 and the Layer 5 Dependencies. The same defect occurred in §10.5 (maximal-slope
quotient across the logarithmic point `0`, using §RD.3.45), so the gap also asks for the slope filtration of a
log-F-isocrystal on a connected open of constant polygon (XZ §A.2, XZ line 3030–3031), and §10.5 and the Layer 10
Dependencies cite it.

## H05 (CBirkbeck) — applied

New §1.9 *Local monodromy and Frobenius at zero* states, for trivial tame character, HNY Theorem 1(2) (p. 261, HNY
line 860–862), the weight-graded nearby-cycle Frobenius eigenvalues `c_q^k` with multiplicities
`dim H^k(Gr_G, IC_W)` (HNY §4.3, HNY line 1254–1269; XZ line 2338–2341), and their transfer to `Kl_W^rig` through
gap:arithmetic-d-module-operations; its input is the new gap `gap:equal-characteristic-central-sheaves` of
GlobalShtukasAndFunctionFieldLanglands (Gaitsgory Theorem 2, Gai01 line 225; Görtz–Haines Corollary 1.2, GH07 line
82). §4.3's route now fixes the central scalar from §1.9 with XZ Proposition 2.9.4 (log fibre = nearby cycles) and a
regularity argument, and a Check records that `−C(0)` has the same weights and slopes but trace `−(c_q^{−1} + c_q)`.
The section is placed as §1.9 rather than between §1.6 and §1.7 so that no existing number moves.

## H06 (CBirkbeck) — applied differently

The source's route for §6.2 (XZ Lemma 4.5.3, XZ line 2404–2408) is kept, with its principal unipotent element now
supplied by §1.9(i) (the alternative the finding itself names), because §4.3 needs the same central-sheaves input
anyway (H05) and GlobalShtukasAndFunctionFieldLanglandsPartII §4.0 consumes HNY Theorem 1(2) from Layer 1 of this
roadmap, so declaring it "not a target" would break that consumer. The three unlisted inputs the finding names are
added: §§RD.5.89, RD.6.25, RD.6.55, the `ℓ`-adic trace formula (GlobalShtukasAndFunctionFieldLanglands §1.4), the
Euler–Poincaré formula with Swan conductors (EtaleDualityAndPerverseSheaves §5.2), the tame fundamental group
(InverseGaloisAndArithmeticFundamentalGroups §IG.1.2), DeligneWeightsAndPurity §§5.7, 8.19, and
gap:arithmetic-d-module-operations for `p`-adic geometric semisimplicity; Downstream consumers now names §1.9(i).

## H07 (CBirkbeck) — applied

§1.3 now asks for compatibility of the arithmetic equivalence only, on Frobenius characteristic polynomials of the
stalk cohomology of the normalized `IC_μ`, and says the de Rham equivalence carries no Frobenius and enters no
such comparison (old: "both equivalences are compatible … on characteristic polynomials").

## H08 (CBirkbeck) — applied

§2.2 now matches `φ` with `E` by `P_h(φ) = P̌_h(N + xE)` and states that `λφ` matches `N + λ^h xE`, both invariants
being `λ^h P_h(φ)` (XZ (4.3.4.1), XZ line 2233; (4.4.1.2), XZ line 2299). A Check adds the `SL₂` instance at
`λ = 2`: both invariants `4`, unscaled `N + xE` gives `1`.

## H09 (CBirkbeck) — applied

§6.4 now proves Swan `1` for the standard object of `SL_{2n+1}`: breaks `≤ 1/(2n+1)` by gap:formal-slope-comparison,
irregularity `≤ 1`, integral and equal to Swan by §RD.6.52, nonzero by §6.2 (XZ line 2463–2465), and descent along
`x ↦ x²` would make it even; gap:formal-slope-comparison and §§RD.1.17–RD.1.19, RD.6.52 are added to §6.4 *Needs*,
which removes the §6.4 → §8.1 → §7.4 → §6.4 reading.

## H10 (CBirkbeck) — applied

The §1.1 Check now says the analytification of `E_{−π}` is the connection underlying the Dwork F-isocrystal, whose
multiplier `exp(π(t − t^q))` gives trace `ψ ∘ Tr`, and that the algebraic `D`-module of (ii) has no trace function
(old: both "have the matching trace function"). No other Check assigns a trace to a de Rham object (§1.4, §1.8 and
§3.1 checked).

## H11 (CBirkbeck) — applied

§6.5 now defines a discrete parameter as `ϕ : W_{k_∞} → H(K̄)` whose restriction to inertia has finite image and open
kernel, with semisimple Frobenius image and finite centralizer (GR §3.2, conditions 1)–3), GR line 529–536). A
Check records the discontinuous `±1` character of `𝔽₂((t))` with dense proper inertia kernel, whose central twist of
a simple wild `SL₂` parameter is excluded.

## H12 (CBirkbeck) — applied differently

§2.4 now quantifies over closed points `χ` of `Spec A` with the corresponding `K`-algebra map `ϕ_χ : A → K`, which is
what Zhu Theorem 8 states ("be a closed point", Zhu line 377) and what Corollary 9's `ϕ_χ : A → ℂ` presupposes (Zhu
line 435–438); the residue-field version proposed would assert an eigensheaf over non-algebraically-closed `κ(χ)` that
no source here proves. A Check records `A = K[t]`: the generic point has residue field `K(t)` and no `K`-valued
character.

## H13 (CBirkbeck) — applied

The §6.1 Check now uses `H = SO₈` with `G_alg = G₂` (§2.8): `Std₈` restricts to `Std₇ ⊕ 1`, the generated category
contains the rank-seven summand, and the literal image of `Rep(SO₈)` has no nontrivial rank-seven object (smallest
nontrivial representation of dimension `8`); it also says that for `Std ⊗ Std` of `SL₂` the two models agree.

## H14 (CBirkbeck) — applied

Layer 0 Examples now say for `G = 𝔾_m`: `V = 0`, `Ω = ℤ`, `Bun_G(0,2)` one point with trivial automorphisms per degree,
`Bun_G(1,2)` a `𝔾_m` of ratios per degree, matching `T̃ × V = 𝔾_m × ℤ` of §0.3, and constant eigenvalue (old: "all
level data are trivial").

## H15 (CBirkbeck) — applied

`orthogonalSum_sub_card_eq_convolution` is deleted from `Suggested.lean`; README §11.1 states (iii) for `N ≥ 1` with
no Lean name, gives the substitution `u = a/∏ y_i` and `Σ_v R_{2N−2}(v) = 1` as its proof, and notes that (iii) with the
raw convolutions reduces (i) and (ii) to `n = 1`; §9.4 is removed from §11.1 *Needs* and "the identity (iii) of
§11.1" from §11.5. Recomputed: over `𝔽₃`, `N = 2`, `a = 1`, `U₂(1) − 3 = 4 = (−2)(−1) + (1)(2)`; over `𝔽₂`, `N = 1`,
`−1 = (1 − 2)·1`.

## H16 (CBirkbeck) — applied

The §1.3 Check now says `H^*(IC_μ)` for minuscule `PGL₂` lies in degrees `−1, 1` and its tensor square in `−2, 0, 2`,
that the Koszul constraint acts as minus the flip (`e ⊗ e ↦ −e ⊗ e`) and gives categorical dimension `−2`, and that
the corrected constraint gives `2` (old: the square "would give a super vector space with odd part").

## H17 (CBirkbeck) — applied

The §9.2 Check now gives the factor `(−1)^m` (`−1` for one lower parameter, `1` for none or two), with the `𝔽₃`
instance `g² = −3`, `g₂ = 3`, products `9` and `9` for `m = 2`, and notes that `(−1)^m ∏ g_{j,2} = α²` for every `m`.

## H18 (CBirkbeck) — applied

MotivesAndAlgebraicCycles §6.5 is heaps (its README line 1180) and §6.8 constructs `Isom^⊗` with its two actions and
the conjugation twist (line 1230–1249); every citation of §6.5 for this purpose (supplier contract, §6.1 *Needs* and
API, §7.1, Layers 6 and 7 Dependencies) now reads §6.8.

## H19 (CBirkbeck) — applied

The three §10.4 Checks are replaced by the `n = 1` coefficients: `F = 1 − 8x + 8x²`, `G = 1 + 8x + 24x²` (no
double factorial: `8x²`), `h = 1 − 16x + 112x²` with `h′(0) = −16 = η_F(0) − η_G(0)`, and `f_{F,2}`, `f_{F,4}` with
`x²` coefficients `16`, `8` (for `G`: `16`, `24`).

## H20 (CBirkbeck) — applied

GlobalShtukasAndFunctionFieldLanglands §1.12 (normalized spherical Satake, its README line 805–825) is added to §5.2
*Needs* and the Layer 5 Dependencies, and the supplier contract now describes §1.9 and §1.12 separately.

## H21 (CBirkbeck) — applied

§6.6 now says the local monodromy parameter at `∞` of `Be_H†` (§RD.6.51), with vanishing nilpotent part, is simple
wild, and adds that the same statements for `Kl_H^{ét,ℓ}` are not asserted here; §11.5 says the `1/h` break is that
of `Be_H†`.

## Build and gate

- `lake build TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals.Suggested`: `Build completed successfully
  (18239 jobs).` Four `declaration uses 'sorry'` warnings (lines 68, 135, 147, 160), one per remaining headline.
- Gate after commit: `gate KloostermanSheavesAndBesselIsocrystals: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
  long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0
  source-material=0 OK`
- Depcheck (`--movable --pr 2289`): `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)` — no UPWARD, CYCLE or
  moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Ownership, suppliers and signatures

- New suppliers: McKaySkewGroup (on main), ArithmeticGaloisRepresentations, EtaleDualityAndPerverseSheaves,
  InverseGaloisAndArithmeticFundamentalGroups (all earlier in the merge order). Their cited sections were read at
  their heads: ArithmeticGaloisRepresentations §5.13 *Recognition*; EtaleDualityAndPerverseSheaves §5.2
  (curve Euler–Poincaré with Swan); InverseGaloisAndArithmeticFundamentalGroups §IG.1.2; DeligneWeightsAndPurity
  §§5.7, 8.19; PadicDifferentialEquationsAndRigidCohomology §§RD.3.43, RD.5.101, RD.6.25, RD.6.55.
- Central sheaves: `roadmaps grep` for central sheaves, Gaitsgory, Görtz–Haines and Wakimoto finds only
  GeometricSatakeAndFusion §4.17 (mixed-characteristic local models over `O_E`, `E/ℚ_p` finite) and
  GeometricSatakeAndFusionPartII's requests to it; no roadmap owns Gaitsgory's equal-characteristic central sheaves,
  so they are a declared supplier gap of GlobalShtukasAndFunctionFieldLanglands, which owns the Beilinson–Drinfeld
  Grassmannian and `ℓ`-adic Satake over finite fields. HNY Theorem 1(2) itself is about this roadmap's eigenobject
  and is owned here (§1.9), as its consumer GlobalShtukasAndFunctionFieldLanglandsPartII already assumes.
- No notion was moved down from a later roadmap.
- Signatures: the only Lean change is the deletion of `orthogonalSum_sub_card_eq_convolution`. The elaborated types
  of the remaining ten declarations in the job's signature transcript were compared with README §§10.1–10.2,
  11.1, 11.3 and are unchanged; no binder is dropped. Only the brief's `lake build` command was run, so no fresh
  `#check` transcript was produced.
- Sources: all locators come from the cached XZ, HNY, Zhu, GR, Car, Gai01 and GH07 texts. `sources.toml` is not in
  this job's editable files; Gai01 and GH07 are already recorded, and the README References now list them as
  **[Gai]** and **[GH]**. No text was missing.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.3 `F-Sat_G` ≃ algebraic semilinear reps | `G = 𝔾_m`, `σ = id`; `t ↦ ϖ^{v(t)}` vs `t ↦ t^m` | unit `u ↦ 1` vs `u^m`; `ϖ ↦ ϖ` vs `ϖ^m` | valuation character excluded, all `t^m` kept |
| §1.3 Koszul Check | minuscule `PGL₂`, `IC_μ = K[1](1/2)` on `ℙ¹` | degrees `(−1, 1)`; square `(−2, 0, 2)` dims `1, 2, 1`; sdim `0 − 2 = −2` vs `2` | old claim false, new holds |
| §1.3 compatibility | de Rham fibre with endomorphisms `1`, `2` | `T − 1` vs `T − 2` | only the arithmetic comparison is now claimed |
| §1.1 Check | `d − π dt`, `q = p` | `d log exp(π(t − t^p)) = π(1 − p t^{p−1})`; value `1` at `0`; scalar `2` gives trace `2ψ` | holds |
| Layer 0 `𝔾_m` example | degrees `d`; levels `(0,2)`, `(1,2)` | `Aut = 1`; `(𝔾_m × 𝔾_m)/𝔾_m = 𝔾_m`; `k((x))^×/(1 + xk[[x]]) = 𝔾_m × ℤ` | holds |
| §2.2 matching | `A₁`, `λ = 1, −1, 2` | `P(λφ) = 1, 1, 4`; `P̌(N + λ²xE) = 1, 1, 4`; old test at `λ = 2`: `4 = 1` | new holds |
| §2.4 closed points | `A = K[t]`: `(t − c)`, `(0)` | evaluations exist; `κ((0)) = K(t)`, no `K`-point | holds |
| §1.9(i)–(ii) | `SL₂` Std; trivial `W`; `SL₂` Sym² | eigenvalues `c_q^{∓1}`; `1`; `q^{−1}, 1, q` = `(2ρ)(c_q)` on weights `−2, 0, 2` | holds |
| §1.9 `L`-function Check | `SL₂` Std over `𝔽₂`, `𝔽₃` | `Σ R₂ = 1` (`𝔽₃`: `−1 + 2`); `L = 1 − c_q^{−1}T`; `χ(𝔸¹, j_*) = −1 + 1 = 0`; `−C₀` gives `1 + c_q^{−1}T` | holds, discriminates |
| §4.3 `ε = 1` | `SL₂`, `ε = −1` | char polys `(T + c_q^{∓1})` vs `(T − c_q^{∓1})`; `α((2ρ)(c_q)) = q^{ht α} ≠ 1` | regularity argument holds |
| §6.2 route | `SL₂` actual; torus | `χ_c(𝔾_m, Kl₂) = −1 = −deg L`; torus `N = 0` | contradiction only in the hypothetical case; torus Check unchanged |
| §6.3 finite subgroups | cyclic `2n`, binary dihedral `4n`, binary tetrahedral, octahedral, icosahedral | images of order `n`, `2n`, `12`, `24`, `60`; `A₅` nonsolvable | solvable list cyclic, dihedral, `A₄`, `S₄` |
| §6.4 Swan `1` | `SL₃`, `SL₅`, `p` odd | `3 · 1/3 = 1`, `5 · 1/5 = 1`; descent gives `2 · Swan′` | Swan `1` odd, contradiction holds |
| §6.5 open kernel | `𝔽₂((t))`, `U¹/(U¹)² = ∏_{j odd} 𝔽₂` | functional `0` on `⊕`, `1` on all-ones; kernel dense, proper | excluded by the new condition; degree-20 `𝔽₅((t))` example has open kernel |
| §6.6 subject | `SL₂` | `Irr_∞(Ad) = 1`, `dim Ad^{I₀} = 1`, `h¹ = 0` | unchanged |
| §6.1 Check | `SO₈ → G₂`; `SL₂` | `8 = 7 + 1`, smallest nontrivial `SO₈` rep `8`; `4 = 3 + 1` | new Check discriminates, old did not |
| §7.5 recognition | `1 ⊕ 1` vs unipotent extension | both `(1 − T)²` | semisimplicity needed; internal order §7.6 → §7.5 acyclic |
| §5.3 / §10.5 log gap | `d + E₁₂ dx/x`, `C = diag(1, q)` | `AC = qE₁₂ = qCA`; slopes `(0, 1)` at `0` and generically | gap statement consistent |
| §9.2 Check | `m = 0, 1, 2` over `𝔽₃` | factors `1, −1, 1`; `9 = 9`; `(−1)^m ∏ g_{j,2} = α²` | old "`−1`" false for `m = 0, 2`; new holds |
| §10.4 Checks | `n = 1` | `F`: `1, −8, 8`; `G`: `1, 8, 24`; no `!!`: `1, 8, 8`; `h`: `1, −16, 112`; `f_{F,2}`, `f_{F,4}`: `16`, `8`; `f_{G,2}`, `f_{G,4}`: `16`, `24` | all discriminate |
| §11.1 (iii) | `𝔽₂` `N = 1, 2`; `𝔽₃` `N = 2`, `a = 1` | `−1 = −1`; `−1 = (−1)·1`; `4 = 2 + 2` | holds for `N ≥ 1`; reduction of (i) at `n = 2` over `𝔽₂`: `R₃(1)R₂(1) = −1 = R₅(1)` |

## Suspicious text

None. The review comment contained mathematical findings only.
