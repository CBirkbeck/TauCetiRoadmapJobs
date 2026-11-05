# GATE-ECM~2: answers to the review of `655a340`

Repairs committed as `2ddbbda` ("ECM: review repairs (drop algorithms, state headline theorems, locators, layered README with Checks)"). Files touched: `TauCetiRoadmap/ECM/README.md`, `TauCetiRoadmap/ECM/Suggested.lean`. Not pushed.

## H01 (CBirkbeck) — applied

The procedures are gone: old milestone 12 (finite algorithms on residues, bounded factor search, termination), the recursive recovery of milestone 11, the "checked interface", ladder termination, stage-2 schedule construction and the "modular algorithms" home are deleted. Their mathematical content is now stated as theorems: ladder relations for scalar multiples (README 4.1), integer representation `q = iw ± j` with `0 ≤ j ≤ w/2` (4.2), finite-product gcd separation (6.3), and stage-1/stage-2 detection at a prime divisor (6.4, 6.5). The modulus-35 doubling `(22,1) ↦ (21,25)`, `gcd = 5`, and the `[3,5]` modulo 15 batch are Checks in Layers 3 and 6.

## H02 (CBirkbeck) — applied differently

`Suggested.lean` now states five headline theorems on native points: `double_coordinates`, `diffAdd_coordinates` (correctness plus the exact exceptional set `P − Q ∈ {0, T₀}`, expressed as "both fields of the coordinate pair of `P − Q` are nonzero"), `coordinates_cross_eq_zero_iff` (stage 2), `isElliptic_model_suyama_iff` and `prime_dvd_gcd_of_card_dvd` (stage 1). It also adds the definitions they need: `coordinates` (infinity ↦ `(1,0)`, `(x',y') ↦ (x',B)`, as suggested), `Pair.map`, `diffAdd`, `suyamaA`, `suyamaB`. The difference from the suggestion: `double_coordinates` omits `A² ≠ 4`. Native points are nonsingular by construction, so the theorem holds on singular models too. An exhaustive check over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃ with `A = ±2` (every native point, every `B ≠ 0`) found no failure. Algebraically, `U = 0` forces `x = −1`, and then `DV + NC = 4Z²(D − N)` vanishes only at `A = 2`, where `x = −1` is the singular point and so not a native point. The suggested witness `(−1,1)` at `A = 2` is that singular point; it is kept as a negative-control Check (README 3.1), not as evidence for the hypothesis.

## H03 (CBirkbeck) — applied

The supplier contracts now cite `Prime.dvd_prod_iff` (`Mathlib/Data/List/Prime.lean:28`), `addOrderOf_dvd_iff_nsmul_eq_zero` and `addOrderOf_dvd_natCard` (`Mathlib/GroupTheory/OrderOfElement.lean`), and `WeierstrassCurve.Affine.Point.X_eq_iff` (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:647`). The old "`p ∣ product ↔ ∃ leaf, p ∣ leaf`" target is replaced by the residue/gcd comparison built on it (README 6.3: `p ∣ gcd(val(∏ tᵢ), n) ↔ ∃ i, p ∣ gcd(val tᵢ, n)`), and the fibre theorem (2.3) and stage-2 criterion (4.2) list `X_eq_iff` under *Needs*. Nothing generic was added to `Suggested.lean`.

## H04 (CBirkbeck) — applied differently

Claim-level locators now sit at each target:
- the curve: Montgomery 1987, §10.3.1, eq. (10.3.1.1), p. 260;
- the `x`-only relations: pp. 260–261;
- the projective duplication and addition displays and the binary ladder: p. 261, read at montgomery1987 lines 874–916;
- the formulas: EFD `dbl-1987-m-3` (efd line 166) and `dadd-1987-m-3` (efd line 247);
- Suyama's parametrization: Zimmermann, *20 years of ECM*, §1, p. 3 (zimmermann2006 lines 94–102, author's submitted version);
- stage-1 detection: §1.1, p. 3.

The Suyama exceptional set is now proved here rather than cited: `A+2 = (v−u)³(3u+v)/(4u³v)`, `A−2 = (v+u)³(v−3u)/(4u³v)`, `B = u(σ²−1)²(σ²−25)²(σ⁴−25)²/v⁹`. Together these give the criterion `(σ²−1)(σ²−9)(σ²−25)(9σ²−25)(σ²+5) ≠ 0`. Characteristic 3 is kept, and its justification is the algebra itself: the coordinate theorems need only `2 ≠ 0`, and the exhaustive checks include 𝔽₃. No statement relies on Lenstra's short-Weierstrass treatment. Lenstra 1987 (JSTOR) could not be read legally, so it is cited by its §2 locator only, as uncertified. A `sources.toml` was not written: this job may edit only `README.md` and `Suggested.lean`. The service cached montgomery1987, efd and zimmermann2006 for the worker to record.

## H05 (CBirkbeck) — applied

The README now has the required shape: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, none from other roadmaps), How to read the build, Layers 1–6 with `### k.n` subsections, *Needs:* lines, API bullets, Examples and Dependencies, Downstream consumers and References. Every definition has at least three computed Checks, including all the values you supplied:
- `Δ = −64` at `(0,1)`, and `0` at `(2,1)` and `(0,0)`;
- `(36,160)` against `(36,−96)` for the wrong `N = −2`, cross difference `−9216`;
- infinity doubling to `(4,0)` over 𝔽₇;
- the distinguished `2`-torsion exception and the non-distinguished one: `(2,0)` over 𝔽₅ gives output `(1,3)`, representing `2`.

Every Lean name (`model`, `Pair`, `Pair.map`, `coordinates`, `double`, `diffAdd`, `suyamaA`, `suyamaB` and the five theorems) appears backticked in the README. The README's `xDBL`/`xADD` spellings are gone.

---

## Build and gate

- `lake build TauCetiRoadmap.ECM.Suggested`: `Build completed successfully (8976 jobs)`. The only warnings are `declaration uses 'sorry'`, at lines 84, 99, 114, 140 and 154 (the five headline theorems).
- Gate at `2ddbbda`: `gate ECM: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1177 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no unresolved cross-roadmap citations, no unresolved Lean names.

## Elaborated signatures

I wrote `#check @name` for all 13 declarations in one scratch file and elaborated it once. Every binder is in the declaration's own signature, and the file uses no section `variable`s, so nothing was dropped. Each type matches its README statement:
- `double_coordinates` carries `[DecidableEq K] (2 ≠ 0) (B ≠ 0) (D ≠ 0) (4N = (A+2)D)`;
- `diffAdd_coordinates` carries `[DecidableEq K] (2 ≠ 0) (B ≠ 0)`;
- `coordinates_cross_eq_zero_iff` carries `[DecidableEq K] (B ≠ 0)` with `m n : ℤ`;
- `isElliptic_model_suyama_iff` carries `(2 ≠ 0) (σ ≠ 0) (σ² ≠ 5)`;
- `prime_dvd_gcd_of_card_dvd` carries `[Fact p.Prime] (p ∣ n) (Nat.card … ∣ m)` and the reduction hypothesis.

Two hypotheses were deliberately left out because the statements are true without them. `prime_dvd_gcd_of_card_dvd` has no `B ≠ 0`: the coordinate pair of infinity is `(1,0)` for every `B`. `double_coordinates` has no `A² ≠ 4`, as explained in H02.

## Ownership

I searched the roadmaps on main and the open roadmap pull requests through `roadmaps grep` for: Montgomery curves, Suyama, differential addition, Kummer line, and the elliptic-curve method. No other owner exists. The only hits are unrelated (Montgomery–Vaughan, Hopf algebras, `p`-adic "Kummer line"s). ECM owns the Montgomery model, the `x`-only arithmetic and Suyama's family. Generic inputs are imported from Mathlib and Tau Ceti by name. No `TauCetiRoadmap.ECM` name collides with a declaration in another readable roadmap. No notion was moved down from a later roadmap.

## Adversarial pass

All computations are exhaustive over the stated fields unless a value is given.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `double_coordinates` | 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, all `A` with `A² ≠ 4`, all `B ≠ 0`, all `D ≠ 0`, every native point | 34720 cases, 0 failures; 𝔽₇ `(0,1,2,4)`: `(1,1) ↦ (0,4)`, target `(0,1)`; `∞ ↦ (4,0)` | holds | stated |
| same, singular models | `A = ±2` over the same fields, native points only | 0 failures | holds without `A² ≠ 4` | hypothesis omitted |
| same, `D = 0` | any pair | output `(0,0)` | `D ≠ 0` needed | kept, Check added |
| same, wrong convention | ℚ, `(2,1)`, `A = 0`, `N = −2`, `D = 4` | `(36,−96)` vs `(36,160)`, cross `−9216` | refutes `(A−2)/4` | Check |
| `diffAdd_coordinates` (representation) | all `P, Q` over the same fields | 0 failures; 𝔽₇ `(3,3),(1,3)`: output `(2,3)` ≡ `3` = `x(P+Q)` | holds | stated |
| `diffAdd_coordinates` (exceptional iff) | all `P, Q`, both directions | output zero iff `R.x = 0 ∨ R.z = 0`, 0 failures; `P − Q = T₀` over 𝔽₇: `(0,0)`; `T = (2,0)` over 𝔽₅: `(1,3)` ≡ `2` | holds; non-distinguished 2-torsion not exceptional | stated |
| cross criterion (point form, implies `coordinates_cross_eq_zero_iff`) | all `P, Q` over the same fields | 0 failures; 𝔽₇ `Q = (3,3)`: `(5,3)` cross `0`, `8Q = 0`; `(3,1)` cross `2`; `(0,0)` cross `0` | holds, `B ≠ 0` only | stated |
| Suyama identities | 200 random rationals `σ` | `c − 4d = (v+u)³(v−3u)`; `B = u y₀²/v⁹`; `A² − 4 = c(v+u)³(v−3u)/d²`; four linear factorizations | all true | README 5.1 bullets |
| `isElliptic_model_suyama_iff` | 𝔽₃ … 𝔽₂₃, every `σ ≠ 0` with `σ² ≠ 5` | 86 cases, `Δ ≠ 0 ⇔ poly ≠ 0` in all | holds incl. char 3, 5 | stated |
| Suyama negative controls | ℚ `σ = 5`; 𝔽₇ `σ = 2`; 𝔽₁₁ `σ = 2` | `A = −2, B = 0`, denominator 640000; `B = 0, A² = 4`; `B = 9, A² = 4` with `9σ² − 25 = 11` | denominator unit ≠ elliptic; factor `9σ² − 25` needed | Checks |
| `4N = (A+2)D` for `N = c`, `D = 16u³v` | ℚ `σ = 7/3` | true | holds | README 5.1 |
| `prime_dvd_gcd_of_card_dvd` | `n = 35`, `p = 5`, `R = (21,25)`, `m = 2` (order form); `m = 4` (card form) | `gcd = 5`; `(9,0)`, `gcd = 35 = n`; `n = 0`: `val = natAbs`, `gcd(natAbs z, 0) = natAbs z` | holds; `n` outcome inconclusive | stated; Checks |
| ladder odd step | 𝔽₇ `P = (3,3)`: `diffAdd((1,1),(3,1),(3,1))`; `P = T₀` | `(2,6)` ≡ `5 = x(3P)`; `(0,0)` | needs `P ∉ {0, T₀}` | README 4.1 hypothesis + Check |
| mod-35 ladder | `diffAdd((21,25),(22,1),(22,1))` | `(1,8)`, `gcd = 1` | agrees with 𝔽₅, 𝔽₇ | Check |
| model / discriminant | `(0,1)`, `(2,1)`, `(0,0)`, `model 3 2` | `−64`, `0`, `0`, `(0,6,0,4,0)` | kernel-checked identity (proved example) | Checks |
| point counts | 𝔽₇, 𝔽₅ with `(0,1)` | 8 (cyclic, generator `(3,3)`), 4 (`(ℤ/2)²`) | used in Checks | Checks |
| Montgomery ↔ model equation | 𝔽₇ `(0,2)`, `(1,1) ↦ (2,4)`; `B = 0` | `16 = 2 = 8 + 8`; `B⁴y² = B³(…)` fails at `B = 0` | needs `B ≠ 0` | Checks |
| Kummer image | 𝔽₇ `(2:1)` | `2³ + 2 = 3`, not a square mod 7 | non-surjective | Check |
| `M(B₁)` | `B₁ = 10, 0, 1`; order 16 | `2520`, `1`, `1`; `16 ∤ 2520` | smoothness ≠ prime-divisor bound | Checks |
| index representation | `w = 6`, `q = 13, 17, 15` | `2·6+1`, `3·6−1`, `2·6+3` (`j = w/2`) | `≤ w/2` needed | Check |
| gcd classification | `n = 35`: `t = 25, 0, 1`; `n = 9`: `t = 3` | `5`, `35`, `1`; `3` | prime powers escape criterion | Checks |
| products | `[3,5]`, `[]`, `[1,5]`, `[0]` modulo 15 | `15` vs `3, 5`; `1`; `5`; `15` | as stated | Checks |
| reduction | `(3:ZMod 35) − 5` | `33 ↦ 3 ∈ 𝔽₅, 5 ∈ 𝔽₇` (ℕ subtraction gives 0) | as stated | Check |

## Sources

Fetched through the sources service from legal places:
- montgomery1987: AMS open archive (publisher-open);
- efd: authors' site (author-page);
- zimmermann2006: author's page at LORIA (author-page, submitted version; cited by section and page of that version).

lenstra1987 resolves only to JSTOR. It is cited by locator alone as uncertified, and no statement depends on its text: stage 1 is also located in zimmermann2006. Because of that, `needs-references.toml` was not written. The roadmap has no `sources.toml`, and this job could not create one. The worker should record the four keys above.

No suspicious instructions were found in the review text.
