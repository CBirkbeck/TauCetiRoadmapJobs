# GATE-AdelicImagesAndModularCurves~1: answers to the human review of `9037f3d`

One review (CBirkbeck, 2026-11-07, findings F01–F16). Numbering: H01–H13 are F01–F13; H14–H18 are
the five slips of F14 in order; H19 is F15; H20–H24 are the five repair bullets of F16 in order.
Line numbers are those of `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md` and
`TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean` at the new commit `4f0c5ff`.

## H01 (CBirkbeck) — applied

7.3's list was wrong: it named `PSL₂(𝔽_{ℓ²}).2` (the elliptic-congruence stabiliser) as "the
stabiliser of a quadric" and omitted the quadric classes. README lines 2696–2729 now list Mitchell's
eight types as dieulefait2002 line 77–85 gives them, with the `Sp₄` shapes of Bray–Holt–Roney-Dougal
Table 8.12: the two parabolics; `Sp₂(𝔽_ℓ) ≀ S₂` (hyperbolic congruence); `Sp₂(𝔽_{ℓ²}).2` (elliptic
congruence); `GL₂(𝔽_ℓ).2` and `GU₂(𝔽_ℓ).2` (the quadric, two totally isotropic planes over `𝔽_ℓ` or
conjugate over `𝔽_{ℓ²}`; tensor description dieulefait2002 line 330–337); the twisted cubic
(`ℓ ≥ 7`); the exceptional groups with their congruence conditions. The proof-ingredients sentence
is updated, the text says that 7.3's "two totally isotropic planes" configuration is class 4, and a
Check gives the orders at `ℓ = 5` (`28800, 31200, 960, 1440`, indices `325, 300, 9750, 6500` in
`|Sp₄(𝔽₅)| = 9360000`).

## H02 (CBirkbeck) — applied

NoncommutativeAndEquivariantIwasawa §4.0 (its README, "4.0 Local elliptic image theorems") owns
`elliptic_nonCM_openImage` and `elliptic_CM_openImage`, and EllipticCurveModularityImaginaryQuadratic
§5.1 owns `nonCM_elliptic_large_residual_primes` with Serre's route; both are earlier in the merge
order (lines 29 and 194 against 357). Now 4.2 (line 1723) consumes NEI §4.0 and keeps only the
level/index consequences; 4.3 (line 1744) consumes ECMIQ §5.1 and owns only the determinant step
and the passage to `GL₂(ℤ_ℓ)` through 2.2; 4.5 says the single-`ℓ` CM openness is NEI's (line 1850).
4.1 no longer restates the `ℚ_ℓ`-analytic criterion: it is an elementary commutator lemma used by
4.4 (line 1696), so the AdelicAlgebraicGroups AA.4.2 contract, Hermite's theorem, AGR §2.3 and FF
R28.6.2–R28.6.4 were removed as suppliers. "Serre's open image theorem is stated by no roadmap" is
replaced at line 500. Both suppliers are in the supplier contracts (lines 363–369, and the consumed-objects table).

## H03 (CBirkbeck) — applied

ArithmeticGaloisRepresentations §6.1 defines the adelic action on `T̂A = ∏_ℓ T_ℓA` and §6.4 defines
*IsPGaloisGeneric* and *IsGaloisGeneric* with their API. 3.1 (line 1375) now consumes the product and
its Galois action for `A = E` through FF R28.6.1(ii), and owns only the `ẑ`-structure, finite levels,
frames and the `GL₂(Ẑ)` identification; 3.2 says `ρ_E` is AGR's action; 3.3's "open iff finite
index" bullet is replaced by AGR §6.4's predicates read for `g = 1` (line 1488), and 4.2/4.4 state
their conclusions as *IsPGaloisGeneric* and *IsGaloisGeneric*. The italics follow AGR's own
style, so the names are not claimed as Lean declarations of this roadmap. Lines 482–484 ("do not exist") are
corrected. `adelicTateModule` stays in `Suggested.lean` as a declared local copy of AGR's carrier,
needed to state the `ẑ`-rank (docstring at line 322).

## H04 (CBirkbeck) — applied

Both false sentences are gone: integrality and monotonicity are combinatorial (Tau Ceti
`PermutationTriple.IsConnected.eulerChar_le_two`, `IsConnected.two_sub_two_mul_genus`,
`genus_blockQuotient_le`, `EulerCharacteristic.lean:149, 208`, `BlockQuotient.lean:570` at the pin).
1.1 (line 782) defines `ν₂, ν₃`, cusps and widths as NoncongruenceModularForms' invariants of
`Γ̄_{±H}` (§§2.1–2.2), takes the `Γ₀(N)` closed forms from its §§2.2, 2.5, and owns only the
level-`N` model, `GL₂(Ẑ)`-conjugation invariance, the class-count form and the fine/coarse identity.
1.2 (line 843) gets genus integrality and monotonicity from NC §2.3 and Tau Ceti, and 1.4 (line 911)
is NC §§2.1–2.3 instantiated at `Γ̄_{±H}`. "Exist nowhere" (line 490) and the scope exclusion
(line 2778) now name NC as supplier, which matches NC's own downstream note. The reviewer's Check
`12·1 + 0 + 0 + 6·2 = 24 = 12 + 12` is a 1.2 Check. By the same ownership `exists_genus_eq_natCast`
(NC §2.3's formula) and `sum_width` with `width` (NC §2.1's sum law) are deleted from
`Suggested.lean`.

## H05 (CBirkbeck) — applied differently

EI §§8.1 and 8.5 are targets ("Construct … and prove", "Prove `cyclotomic_thirteen_class_number`"),
so "under its §8.1 and §8.5 hypotheses" is dropped (line 376 and step 1 of 6.4, line 2397). The `X₀(27)`
cubic-field datum is replaced by an unconditional route: `X₀(27) ≅ x³ + y³ = z³` over `ℚ` and
Mathlib's `fermatLastTheoremThree` (`NumberTheory/FLT/Three.lean:752`), with an explicit change of
coordinates and a Check on the three points (lines 2425–2437). For `N = 25` no supplier proves
rank 0 (EM2 §6.0e is trivial-character only). So the route now has an owned target `L(f, 1) ≠ 0`
for the level-25 order-5-character orbit, via the winding class of EM2 §6.0d, and a new declared
gap `gap:nebentypus-rank-zero` (line 469, supplier EM2 §6.0e without its trivial-character
hypothesis). The same pattern was in `N ∈ {16, 18}`: ED §3.23 takes class and unit groups as
inputs, so these are now part of the owned target (line 2416). The module docstring and
`mazur_torsion`'s docstring say the route uses the gap at level 25 only (`Suggested.lean` lines 79,
361). The `L(f, 1) ≠ 0` claim was not computed here (no modular-symbol software on this host).

## H06 (CBirkbeck) — applied

`needs` is now one sentence: `ρ̄_{A,ℓ}(G_K) ⊇ Sp₄(𝔽_ℓ)` for all but finitely many `ℓ`, for a
principally polarised `A/K` with `End(A_{K̄}) = ℤ` (line 461; serre1986 line 61–65, whose equality
for large `ℓ` implies it). 7.2 (line 2641) now derives finiteness from this together with the
multiplier `χ̄_ℓ`, onto for `ℓ` unramified in `K`, and the scope exclusion is reworded the same way.
The pull-request description must name both gaps; this job cannot edit it.

## H07 (CBirkbeck) — applied

The route in 2.2 (line 1046) now argues by irreducibility of the adjoint `𝔰𝔩₂(𝔽_ℓ)`: `H₂ ∩ ker` is
`1` or everything; if `1`, `H₂` would be a section, but every lift `x = u(1 + ℓY)` has
`x^ℓ = 1 + ℓ(1 + c·y₂₁)N` with `ℓ ∣ c = ℓ(ℓ−1)(ℓ−2)/6` for `ℓ ≥ 5` (lines 1053–1055). Perfectness
moves to the `GL₂` form (line 1061). A Check (line 1100) records the computation: at `ℓ = 5, 7` every
lift has `x^ℓ = [[1, ℓ], [0, 1]]`, while at `ℓ = 3` `[[1, 1], [−3, −2]]` has cube `1`.

## H08 (CBirkbeck) — applied differently

The sentence is deleted (line 1596). Computed: the order-4 normal subgroup of `GL₂(ℤ/4)` with
quotient `S₄` has `ε∘red 2` trivial on it and `χ_{−4}∘det` nontrivial, so the sign of that `S₄` is
`ε(g mod 2)`. On `GL₂(𝔽₃)` the sign of `PGL₂(𝔽₃) ≅ S₄` is `(det/3)` for all 48 elements. So the
fibre product lies in `S_{−3}`, as the reviewer says. The converse argument is not added: its step
"the only common quotient of `K₂` and `SL₂(ℤ₃)` is through `C₃`" would also have to exclude
non-abelian common quotients (`SL₂(ℤ₃)` has the quotient `A₄ = PSL₂(𝔽₃)`). The README keeps only
the characterisation it proves (`M` divisible by `level S_D`).

## H09 (CBirkbeck) — applied

Both spans are on one line: `χ₅(G_K) ⊆ μ₄ · (1 + 25ℤ₅)` (line 1572) and
`j(P) = j(E) ∉ {0, 1728}` (line 1976); the split span `Γ(N)·Γ(N') = GL₂(Ẑ)` in 5.5 is joined too.
The gate's `tex` count is now `0`.

## H10 (CBirkbeck) — applied

Deleted: the `|GL₂(𝔽₂)| = 6` example (also Tau Ceti's `natCard_GL_fin_two_of_card_eq_two`),
`index_pm_of_isFine`, `pslIndex_gamma0_prime_pow`, `nu2_pm` and `pslIndex_div`. `IsFine` went too,
since nothing used it any more. The README statements stay as targets and Checks (0.2, 0.4, 1.1,
1.5), and the "bridge check" mentions are removed from 0.4 and worked example 1.

## H11 (CBirkbeck) — applied

Every kept declaration is named at its milestone: 0.1 (line 587), 0.2 (639), 0.3 (706), 0.4 (751),
1.1 (829), 1.2 (860), 2.6 (1263), 2.8 (1323), 3.1 (1405), 6.2 (2336), 6.5 (2535), 7.1, 6.4. The
Checks no longer name Lean declarations: 0.4's Bridge and rejection Checks and 1.3's comparison
Check. The gate reports `readme-ids-missing=0`.

## H12 (CBirkbeck) — applied differently

FF has no `tate_semisimple`, `tate_end_iso` or `isogenous_iff_localFactors`. No milestone uses FF
R28.4.5 or R28.4.7, so they are removed from the contract instead of re-cited. FF now supplies
R28.6.1, R28.6.5 and R28.6.6 (line 371). `dim A_f = [K_f : ℚ]` is cited at MC2 §16.3 (supplier line,
table, 5.9) and `X(ρ)` at MC2 §5.14 (5.7 and its *Needs*). 5.8 consumes GlobalQuadraticForms
Layer 5, §5.5 with its ternary case §5.1 (line 2170; contract line 384). The PA, PPG and Chebotarev
links point to `../../Completed/`. 5.4's unnamed "heights roadmap" is now
HeightsRationalPointsAndObstructions §5.9, the section CMG Layer 7 consumes (line 2061).

## H13 (CBirkbeck) — applied

The §1.12 citation went with the old 4.2 route; height two is Serre 1972 §1.11, Prop. 12
(serre1972 line 643).
Théorème 2 is cited as §4.2, p. 294 (line 1746; serre1972 line 1411–1416) and Théorème 3 as §4.4,
p. 299 (lines 1727, 1780; serre1972 line 1612–1622). Mazur is cited as Theorem (8), introduction,
p. 35, crediting Kubert 1976 (line 2391; mazur1977 line 106–117), and Kubert (manifest key
`kubert1976`, waived) is added to the References. The knowl remark is replaced (line 2022):
lmfdb_ec_cm line 99 lists −27 and −28 once each.

## H14 (CBirkbeck) — applied

`level (H ⊓ H') ∣ lcm …` and the coprime-only claim become `level (H ⊓ H') = lcm (level H) (level H')`
with its one-line proof (line 617), plus a Check: `Γ₀(4) ⊓ Γ₀(6) = Γ₀(12)` has level `12`, not `24`
(line 646).

## H15 (CBirkbeck) — applied

"all have `IsFullDet` except `Γ(N)`" becomes "except `Γ(N)` for `N ≥ 3`", with the reason that
`(ℤ/N)ˣ` is trivial for `N ≤ 2` (line 667).

## H16 (CBirkbeck) — applied

The undefined "entangled primes" is dropped. 4.4's consequence now reads: `ℓ ∣ adelicLevel E` exactly
when `H_E` does not contain the factor `GL₂(ℤ_ℓ)`; this holds for every non-maximal prime and can
hold for others (`37.a1`, level `74`, no non-maximal prime) (line 1818). A Check says why `S_{37}`
contains neither the factor at `2` nor the one at `37`.

## H17 (CBirkbeck) — applied

5.9 (line 2235) now uses `w_{p²}`, writes "isogenous to" instead of `=`, and puts the old part in
prose (the `w_{p²}`-invariant part of the old subvariety `J₀(p)²` is one copy of `J₀(p)`), with no
`\text`. Worked example 3 had the same slip (`w₁₃` → `w₁₆₉`), and 5.9's pointer "worked example 7"
is corrected to 3.

## H18 (CBirkbeck) — applied

6.3's count (line 2366) is stated for every `E`. The isogeny-orbit identification is kept for non-CM
`E`, and the `Aut_K(E)` clause is a separate statement: it changes the count only when
`Aut_K(E) ≠ {±1}`, so `j ∈ {0, 1728}` with CM. Its Check uses `y² = x³ − x` over `ℚ(i)`.

## H19 (CBirkbeck) — applied differently

The Goursat step is inserted as 4.4 step 3 (line 1797), but argued by orders rather than by
composition factors. A finite simple quotient of a closed subgroup of `A = ∏_{ℓ<ℓ₀} SL₂(ℤ_ℓ)` need
not be a composition factor of `A`, so "not composition factors" does not apply to `pr_A(C)` as
stated. Instead: `ℓ` divides `|PSL₂(𝔽_ℓ)|` but divides no product of `ℓ'^a(ℓ'² − 1)` with
`ℓ' < ℓ₀ ≤ ℓ`, since `ℓ ≥ 5`. A rejection Check, `{(g, g mod 5)} ≤ SL₂(ℤ₅) × SL₂(𝔽₅)`, shows that
full projections alone do not split. Step 4 also says why `H_S ∩ ∏ Γ(ℓ)` has open projections.

## H20 (CBirkbeck) — applied differently

Added "How to read the build" (line 511, absorbing the former "Ordering" diagram) and "Downstream
consumers" (line 2799). The consumers listed are the ones that cite this roadmap as a supplier:
ModularIwasawaMainConjectures (its §3.6 uses 2.2) and KatoEulerSystems (uses 4.3).
NoncommutativeAndEquivariantIwasawa and EllipticCurveModularityImaginaryQuadratic are suppliers here
(NEI's own downstream note says this roadmap uses its §4.0, and ECMIQ §5.1 says this roadmap's §4.3
is downstream of it). HyperellipticCurves is consumed by 7.2. Listing any of these three as a
consumer would be a cycle.

## H21 (CBirkbeck) — applied

**Checks.** lists, three or more each, were added to 1.1, 1.2, 1.5, 2.8, 3.1, 3.6, 5.5 and 6.2, and
to the new 1.4 and 4.1. For 6.2: the matrix of `11.a`; the `14.a` entries `1, 2, 3, 6, 9, 18` with
`classDegree 18`; the `15.a` tree, whose three internal vertices carry `2, 1, 2` leaves, with
diameter `4` and `classDegree 16`; and the rejected non-cyclic minimiser (`[5]` on `11.a2`, and
`11.a1 → 11.a3`).

## H22 (CBirkbeck) — applied

The closure is in prose in 4.5: "the quotient of the idele group by the closure of `(KF)ˣ (KF)_∞ˣ`"
(line 1846). No `\overline` or `\text` remains (the `\text` of 5.9 is H17).

## H23 (CBirkbeck) — applied

The `1245`-class census is deleted from worked example 6.

## H24 (CBirkbeck) — applied

The module docstring of `Suggested.lean` now names Mitchell's classification as not stated (line
55). It lacks the projective symplectic group and the listed subgroups as carriers, and stating it
would be a long ad hoc encoding.

## Build

`lake build TauCetiRoadmap.AdelicImagesAndModularCurves.Suggested`: `Build completed successfully
(18854 jobs)`, 22 warnings, all `declaration uses 'sorry'`, no other messages. After the build only
the README changed.

## Gate

`gate AdelicImagesAndModularCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable --pr 1727`):

```text
depcheck: 235 roadmaps, 2267 edges, 0 problem(s)
```

No UPWARD, CYCLE, NOT IN ORDER or moved line. The roadmap is at merge-order line 357. The suppliers
added are NEI (29), ECMIQ (194), HeightsRationalPointsAndObstructions (earlier in the order),
NoncongruenceModularForms and GlobalQuadraticForms (on main). AdelicAlgebraicGroups is no longer a
supplier.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Elaborated signatures

`#check @name` for all 41 remaining declarations was elaborated once, in a scratch copy of
`Suggested.lean` with the checks appended. The module's declarations are not exported to a
non-module importer, so a separate importing file cannot see them. Every elaborated type matches
its README statement. The one dropped-binder lead, `adelicTateModule` without
`[CharZero F] [IsSepClosed K]`, is a carrier that makes sense over any field. Its docstring and 3.1
now say so, and `finrank_adelicTateModule` carries both binders. Deleted declarations: the example,
`IsFine`, `index_pm_of_isFine`, `pslIndex_gamma0_prime_pow`, `width`, `sum_width`, `nu2_pm`,
`exists_genus_eq_natCast`, `pslIndex_div`. `level_conj`'s docstring claimed more than its statement
and now matches it.

## Ownership

Searched by object (`roadmaps grep` over main and all open heads): Mitchell's classification,
openness of commutator subgroups of open subgroups of `GL₂(ℤ_ℓ)`, the Fermat cubic and `X₀(27)`,
and finiteness of `A_f(ℚ)` with a character. No other owner was found for the first three. For the
last, EM2 §6.0e and KatoEulerSystems own only the trivial-character case, hence the gap is assigned
to EM2 §6.0e. No declaration of `Suggested.lean` shares a fully qualified name with another
roadmap's.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 no-section step | `ℓ = 3, 5, 7`, all lifts of `u` to `SL₂(ℤ/ℓ²)` | `c = 1, 10, 35`; `x⁵ = [[1,5],[0,1]]`, `x⁷ = [[1,7],[0,1]]` for every lift; at `3`, `x³ ∈ {1, 1+3N, 1+6N}`; `[[1,1],[−3,−2]]³ = 1` over `ℤ` | holds; `ℓ ≥ 5` needed | route rewritten, Check added |
| 4.1 commutators | `ℓ = 5`, `k = 1`; `b = c = 5`; `g` with `α = 626, β = 1875, γ = 4375` | `[diag(6,1), E₁₂(5)] = E₁₂(25)`; product `= diag(1/26, 26)`; `L·D·U = g` | holds for every `ℓ` incl. `2` | new milestone |
| 4.3 determinant step | `K = ℚ(ζ₇)`, `ℓ = 7` | `χ̄₇` trivial, image `⊆ SL₂(𝔽₇)` | step 2 needed | rejection Check |
| 4.4 step 3 | `ℓ₀ = 7`; equality case `ℓ' + 1 = ℓ` | every `|A/U|` has prime factors in `{2, 3, 5}` (`ℓ'^a(ℓ'² − 1)` with `ℓ'² − 1 = 3, 8, 24`), so `7 ∤ |A/U|`; `ℓ' + 1 = ℓ` forces `(ℓ', ℓ) = (2, 3)` | holds for `ℓ ≥ 5` | step inserted, Check `{(g, g mod 5)}` |
| 7.3 Mitchell | `ℓ = 5`; dieulefait2002 line 77–85 | `9360000 / (28800, 31200, 960, 1440) = 325, 300, 9750, 6500`; images `960, 1920, 360, 720, 2520` | holds | list rewritten |
| 3.5 deleted claim | normal order-4 subgroups of `GL₂(ℤ/4)`; `PGL₂(𝔽₃)` on `ℙ¹(𝔽₃)` | 2 such subgroups; the `S₄` one (orders 1:1, 2:9, 3:8, 4:6) kills `ε∘red2`, not `χ_{−4}∘det`; sign `= (det/3)` on all 48 | witness lies in `S_{−3}` | sentence deleted |
| 0.2 level of `H ⊓ H'` | `Γ₀(4) ⊓ Γ₀(6)` | level `12 = lcm`, product `24` | `=` holds | statement and Check |
| 0.3 `IsFullDet Γ(N)` | `N = 1, 2, 3` | `|(ℤ/N)ˣ| = 1, 1, 2` | fails only for `N ≥ 3` | corrected |
| 1.1 counts | `Γ₀(2), Γ₀(11), Γ₀(13), Γ₀(9), Γ₀(16), Γ₀(20)` on `ℙ¹(ℤ/N)` | `(3,1,0,[1,2])`, `(12,0,0,[1,11])`, `(14,2,2,[1,13])`, `[1,1,1,9]`, `[1,1,1,1,4,16]`, `[1,1,4,5,5,20]` | agree with NC and worked ex. 10 | Checks |
| 1.1 rejection | `Γ₁(3)` in `SL₂(𝔽₃)` | `24/3 = 8` vs `24/6 = 4` | holds | Check |
| 1.2 genus | `Γ₀(11), Γ₀(13), Γ₀(26), Γ₁(11)` | `24 = 12+12`; `0`; `(42,2,0,4) → 2`; wrong formula `6` vs `1` | holds; monotone `2 ≥ 0` | Checks |
| 1.4 | `Γ(2)` in `PSL₂(ℤ)` | 6 cosets, widths `[2,2,2]`, genus `0` | holds | Check |
| 1.5 | `Γ₁(11) ≤ Γ₀(11)`; `Γ(3) ≤ ⊤`; `Γ₀(2)` | `5 = 60/12`; `24` vs `12`; Borel maximal in `S₃` | holds | Checks |
| 2.8 | `Γ₁(3)` vs `H' = ±[[1,b],[0,1]]` | both index `8`; `−I ∈ H'` only; fixed cosets at `−I`: `8` vs `0` | holds | Checks |
| 3.1 | `N = 6`; `idem 2`; `y² = x³ + 1` over `𝔽̄₅` | `4·9 = 36`; `|E[2]| = 4`; `T₅E = 0` | holds; char 0 needed | Checks |
| 3.3 `GSp₂ = GL₂` | `g ∈ GL₂(R)` | `g J gᵀ = det(g) J` | holds | text |
| 3.6 | `37.a1` at 5; `11.a2` over `ℚ(√5)` | orbits `24`, `6`, `|GL₂(𝔽₅)| = 480`; fixed vectors of `{diag(1,u): u = 1, 4}` = one line | holds | Checks |
| 5.5 | `Γ₀(2) ×_{ℤ/2} Γ₀(3)` in `GL₂(ℤ/6)` | order `12` of `288`, index `24`; projections of order `2`, `12` | not a fibre product | Checks |
| 5.9 Chen | `p = 13` | `J₀(13) = 0`, `genus X₀⁺(169) = 3`; old part `J₀(p)²` swapped by `w_{p²}` | holds | text |
| 6.3 `Aut` clause | non-CM; `y² = x³ − x` over `ℚ(i)` | `Aut = {±1}`; counts `3` vs `2` | clause vacuous for non-CM | moved |
| 6.4 `X₀(27)` | `(3,4)`, `(3,−5)`, origin | `→ (12, ±36) → (1:0:1), (0:1:1)`, `(1:−1:0)`; `x³ + y³ = 1` | holds; FLT3 at pin | route replaced |
| 6.4 `N = 25` | level-25 order-5 orbit | `L(f,1) ≠ 0` not computed (no modular-symbol software) | owned target + gap | flagged |
| 7.2 gap | serre1986 line 61–68 | `End(A) = ℤ`, `n = 2` ⇒ equality for large `ℓ` ⇒ `⊇ Sp₄(𝔽_ℓ)`; `χ̄_ℓ` onto for `ℓ` unramified | holds | `needs` narrowed |
| EI §8.8 status | EI §§8.1, 8.5, 8.8 | "Construct … prove", "Prove", "Prove `all_prime_torsion`" | unconditional | wording |
| 0.1/7.1 orders | `|GSp₄(𝔽₂)|, |GSp₄(𝔽₃)|` | `720`, `103680` | holds | none |

## For the worker

- The pull-request description should name the declared gaps `gap:abelian-surface-open-image`
  (AGR Layer 7) and the new `gap:nebentypus-rank-zero` (EM2 §6.0e).
- `sources.toml` was not edited (outside this job's files). The README cites, without manifest
  entries, Bray–Holt–Roney-Dougal 2013, Table 8.12 (a paywalled book) and Mitchell 1914 (Trans. AMS
  15). Both were already cited before this job. Kubert 1976 reuses the waived key `kubert1976`. No
  text was fetched and nothing was added to `needs-references.toml`.
- No suspicious instructions were found in the review text.
