# Review of EquivariantIntersectionTheory (pull request #1685 at f62b21a)

**Verdict:** needs changes

This is an incremental re-review of the 14 lines of `TauCetiRoadmap/EquivariantIntersectionTheory/README.md`
changed since `03f0a93`: the Edidin–Graham locators of 2.2 and the opening of 3.4. `Suggested.lean`
is byte-identical to the file reviewed at `1650b0a`. Both previous findings are repaired. One
clause the 2.2 repair adds cites a supplier section for more than it states (R01, P3). Nothing is
blocking. The gate passes with the build, and the dependency check reports no problem.

## R01 (P3) — SchemeAndStackFoundations §5.2 states homotopy invariance only for vector bundles, but 2.2 cites it for affine bundles as well

Location: `README.md` lines 407–410, "homotopy invariance for equivariant vector bundles and
affine bundles (… homotopy invariance is SchemeAndStackFoundations §5.2 on the mixed spaces)".

Claim: SchemeAndStackFoundations §5.2 supplies homotopy invariance for both kinds of bundle.
2.3 (line 438) relies on the affine case for the bundle with fibre `B/T`. For `GL₂`, the element
`(a b; 0 d)` acts on `B/T ≅ 𝔾_a` by `x ↦ (a x + b)/d`, which is an affine map and not a linear one.

Witness: SchemeAndStackFoundations §5.2 (main, README line 6680) states `chow_affine_bundle` only
for total spaces of locally free sheaves. `(ℙ¹ × ℙ¹) ∖ Δ → ℙ¹` is an affine bundle without a
section, because every endomorphism of `ℙ¹` has a fixed point.

Its transition function is `w ↦ −x² w − x`, an affine map, so it is a torsor under a line bundle
and not the total space of one.

Repair: replace "homotopy invariance is SchemeAndStackFoundations §5.2 on the mixed spaces" by
"homotopy invariance is SchemeAndStackFoundations §5.2 on the mixed spaces for vector bundles; for
an affine bundle `E`, a torsor under an equivariant vector bundle `V`, it follows from
`E = ℙ(Ṽ) ∖ ℙ(V)`, where `0 → V → Ṽ → O → 0` is the extension that `E` defines, by the localisation
sequence (§5.2) and the projective bundle formula (§5.4)". In 2.3, say that the bundle with fibre
`B/T` is such a torsor: `b = t u` acts on `B/T ≅ 1 + 𝔫` by the affine map `v ↦ t u v t⁻¹`. The
*Needs:* line of 2.2 already lists §§5.2–5.6.

Tested on the instance that refuted the original wording:

- Take `Ṽ = O(−1)²` and `V = O(−2)`, from the Euler sequence twisted by `O(−1)`. Then
  `ℙ(Ṽ) = ℙ¹ × ℙ¹` and `ℙ(V) = Δ`.
- Localisation gives `CH_1(E) = ℤ²/ℤ·(1, 1) = ℤ`, `CH_0(E) = 0` and `CH_2(E) = ℤ`. These are
  `CH_0`, `CH_{−1}` and `CH_1` of `ℙ¹`, so `p^*` is an isomorphism, as 2.2 claims.

## Previous findings

- R01 — repaired: lines 407–410 now read "§§2.3–2.6: Proposition 1 for proper pushforward and flat
  and lci pullback, Definition-Proposition 2 and the remark after it for Chern classes and the
  product on smooth `X`, Proposition 3 for the localisation sequence". The homotopy clause added
  with it is the new R01.
- R02 — repaired: lines 544–546 now read "for `n = 4` it is compatible with 3.2 through the
  `μ₂`-gerbe `M_{1,1} → [M_{0,4}/𝔖₃]`, whose pullback `ℤ/6 → ℤ/12` is multiplication by `2`
  (Checks)". This agrees with the Check at lines 570–571.

## Verified sound

**Gate, build, direction, folder.**

- Gate at `f62b21a`, with `--build` and the candidate merge order: every scanner `0`, `build=0`,
  `OK`.
- Against the configured merge order the gate reports only
  `depcheck: NOT IN ORDER: EquivariantIntersectionTheory (insert it after its last supplier)`.
  The candidate order lists the roadmap at line 397, after its suppliers, so this is not a
  finding.
- Dependency check:

```
depcheck: 240 roadmaps, 2430 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`,
  `Suggested.lean` and `metadata.toml` only.

**Elaboration.**

- `lake env lean` on `TauCetiRoadmap/EquivariantIntersectionTheory/Suggested.lean` at the pins
  gives nine `declaration uses sorry` warnings (lines 64, 71, 78, 86, 101, 113, 121, 149, 155),
  with no error and no other warning.
- `#check @` of all fifteen declarations in a probe copy prints the same types as the review of
  `1650b0a`:
  - `homogeneousUnitDegrees_away_prime` carries `hf` and `Prime f`.
  - `depressedDiscr_mem` carries `2 ≤ m`.
  - `depressedDiscr_prime` carries `[CharZero K]` and `2 ≤ m`.
  - No section binder is lost.
- The file is unchanged, so the padding audit and the one-tactic probe of that review stand.

**The 2.2 locators, against eg1998 line by line.**

- §2.3 opens at line 210. Definitions 1 and 2 (lines 215–217, 227–228) define proper pushforward,
  flat pullback and l.c.i. pullback, and Proposition 1 (line 229) says they are well defined.
- §2.4 opens at line 242. Definition-Proposition 2 (lines 257–259) gives the Chern classes, and
  the remark after it (lines 262–265) gives the product for smooth `X`.
- Proposition 3 is in §2.6 (lines 399–402). That section assumes `X` quasi-projective (line 358),
  and Proposition 3 itself assumes `X` equidimensional.
- The README states only the degree-zero right-exact part. That part needs no equidimensionality:
  it is SchemeAndStackFoundations §5.2's `localization_exact` (Fulton, Proposition 1.8) on the
  mixed spaces, which is the README's stated route. Computed instance: `G` trivial,
  `X = {z = 0} ∪ {x = y = 0} ⊆ 𝔸³`, `Z` the origin; `A_0(Z) = ℤ → A_0(X) = 0 → A_0(X ∖ Z) = 0 → 0`
  is exact. The locator is adequate and the README's generality is right.
- Edidin–Graham has no proposition for homotopy invariance; the word occurs only at lines 394 and
  450. Pointing that item to the supplier is therefore correct, and only its scope is R01.

**Supplier section, resolved.**

- SchemeAndStackFoundations §5.2 on main (`eaf17b1`, README lines 6653–6700) owns
  `localization_exact`, the base-change square and `chow_affine_bundle`, the last for total spaces
  of finite locally free sheaves of constant rank. Its route uses Fulton, Proposition 1.9 for
  surjectivity only.
- The same statement, under the same section number, is at the heads of the two
  SchemeAndStackFoundations revisions given (lines 7055/7082 and 6662/6686), so the citation is
  not dropped.
- §5.4 (`chow_basis`, line 6721 ff.) supplies the projective bundle formula that the R01 repair
  uses, with the convention `ℙ(E) = Proj Sym E^∨` (lines in `E`). Under that convention
  `ℙ(V) ⊆ ℙ(Ṽ)` has complement `E`.

**The 3.4 opening, computed.**

- At `m = 3` the depressed cubic `x³ + a₂ x + a₃` has `a₂, a₃` of weights `2, 3` and
  discriminant `−4a₂³ − 27a₃²` of weight `6`.
- On `M_{1,1}`, `(a, b)` have weights `4, 6` and `Δ = −16(4a³ + 27b²)`, which is `16` times the
  same discriminant. So the map `(a, b) ↦ (a₂, a₃) = (a, b)` is equivariant along `t ↦ s = t²`,
  whose kernel is `μ₂` (characteristic not `2`).
- Pullback sends `O(χ)` to `O(χ²)`, so `ℤ/6 → ℤ/12` is `d ↦ 2d`. It is injective
  (`2d ≡ 0 mod 12 ⇔ d ≡ 0 mod 6`) with image `{0, 2, …, 10}` of index `2`, as the Check states.
- The Edidin–Hu clause is unchanged: `(n − 1)(n − 2) = 2g(2g + 1)`, giving `20` at `g = 2` and
  `42` at `g = 3`.

**Ownership and overlaps.** The diff adds no object and no ownership claim. `scratch/overlaps.md`
reports:

- no other open pull request changes this roadmap;
- no cited id is dropped, and none is defined only by an open revision;
- the closest roadmaps are the SchemeAndStackFoundations revisions, which are suppliers only.

The resolver's three leads (`GroupSpace.ofGroupScheme`, `StableCurves.Mbar`,
`actionQuotient.torsorEquiv`, README lines 101–105) are README targets of
SchemeAndStackFoundations, as in the previous review. The diff does not touch them.

**Adversarial table.** The rows for changed statements carry computed values. The rows for
untouched statements carry forward the review of `03f0a93` ("r7") and its 29 carried rows from the
review of `1650b0a`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 2.2, Proposition 1 locator | `0 ↪ 𝔸¹`, `𝔾_m` weight `1` | pushforward `A^*_{𝔾_m}(0) = ℤ[t] → ℤ[t]`, `1 ↦ t` (zero section of `O(χ)`); defined at eg1998 lines 215–228, well defined at line 229 | right place | none |
| 2.2, Definition-Proposition 2 and the remark | `𝔾_m` on a point, `O(χ)` | `c₁ = t`, product `t · t = t²` in `ℤ[t]`; lines 257–265 | right place | none |
| 2.2, Proposition 3 locator | `𝔸¹ ⊇ {0}`; non-equidimensional `{z = 0} ∪ {x = y = 0}`, `Z` the origin | `ℤ[t] →(·t) ℤ[t] → ℤ → 0`; `ℤ → 0 → 0 → 0` exact without equidimensionality | statement true at README generality | none |
| 2.2, homotopy invariance via §5.2, vector bundles | `O(χ)` over a point | `A^*_{𝔾_m}(𝔸¹) = ℤ[t] = A^*_{𝔾_m}` | covered by §5.2 | none |
| 2.2, homotopy invariance via §5.2, affine bundles | `(ℙ¹ × ℙ¹) ∖ Δ → ℙ¹` | no section; `CH_1(E) = ℤ²/(1, 1) = ℤ`, `CH_0(E) = 0`, `CH_2(E) = ℤ` (iso holds); §5.2 states total spaces only | statement true, supplier pointer too broad | R01 |
| 2.3 use: bundle with fibre `B/T`, `GL₂` | `b = (a b; 0 d)` | `x ↦ (a x + b)/d`: torsor under the line bundle of `a/d`; `A^*_B = A^*_T = ℤ[t₁, t₂]` by the completion route | true via R01's repair | R01 |
| 3.4 opening, `n = 4` against 3.2 | weights `(2, 3)` and `(4, 6)` | `s = t²`, `ℤ/6 → ℤ/12`, `d ↦ 2d`, kernel `0`, index `2`; gerbe band `μ₂` | compatible, as stated | none |
| 3.4 opening, Edidin–Hu | `g = 2`; `g = 3` | `20 = 20`; `42 = 42` | equal | none |
| Scope paragraph, 0.4 Check, 2.2 Checks and every untouched statement | as in r7 and r6 | as in r7 (`Bμ_n` fixed-point datum `u = c sᵏ`, `kn = 1` impossible for `n ≥ 2`; weight `0` units `k^*`) and r6 (29 rows: `⊥`/`⊤`/`2ℤ` for 0.1, `(1+εt)(1−εt) = 1` for 0.2, `−4a₂` and `−4a₂³ − 27a₃²` for 0.5, `ℤ/2, ℤ/6, ℤ/12, ℤ/20` for 3.4) | unchanged by the diff | none |

**Counts.**

| What | Number |
| --- | --- |
| Changed passages reviewed | 2 |
| Lean declarations re-elaborated by `#check` | 15 |
| `sorry` warnings | 9 |
| eg1998 passages read (lines 205–290, 340–410, plus the grep for "homotopy" and "affine") | 3 |
| SchemeAndStackFoundations §5.2 checks (main and two revision heads), plus §5.4 on main | 3 + 1 |
| New table rows / carried rows | 8 / 1 group |

## Not verifiable

The diff touches none of these, and none can be read legally.

- Mumford–Fogarty–Kirwan, Ch. 1 §3 (1.1), and Knop–Kraft–Luna–Vust 1989, Lemma 2.2 and
  Proposition 2.3 (1.3): paywalled; `mfk1994` and `kklv1989` are settled as uncertified.
- Edidin–Graham, published numbering, Proposition 18 (2.4): the Invent. Math. text is paywalled.
- Mumford 1965, *Picard groups of moduli problems* (3.2): no legal copy.

## Source issues

- none
