<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6910292874 -->
Red team round 2 pass a (claude) of 56d52bf

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) a constant Hodge–Tate class with zero real period is not zero with ℚ-coefficients

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:623`: "so they differ by a constant
   variation, whose period vanishes by collision continuity (§3.10)"; consumed by `:616` property (3)
   and by the target `r_X: … → L^HT_•(η_X)` at `:612`.

   **Claim.** In `L^HT_m(η_X)`, `m ≥ 2`, built from ℚ-Hodge–Tate variations (`README.md:501`:
   "mixed ℚ-Hodge–Tate", `L^HT_1(X) = O(X)ˣ_ℚ`), a constant class with zero cobracket and zero period is
   zero; hence limit and specialization agree and every specialized relation dies.

   **Witness.** The constant framed extension of `ℚ(0)` by `ℚ(m)` with class `(2πi)^m·√2` in
   `ℂ/(2πi)^mℚ` (the identification of `README.md:106`): nonzero, zero cobracket, projection to
   `ℝ(m−1)` zero, so `P = R = p = 0`. §3.10 controls only the numbers `Cor^H`.

   **Repair.** Every consumer (§§5.1, 5.4, 5.7 Checks, and the motivic part of §3.13, which passes
   through the regulator) uses `P∘r_X` and `R∘r_X` only. State the quotient-level map with real
   coefficients.

   1. §3.6, after the definition of `L^HT_•(X)`, add: "Write `L^{HT,ℝ}_•(X)` for the same construction
      on good variations of real mixed Hodge–Tate structures, and `L^HT_•(X) → L^{HT,ℝ}_•(X)` for the
      morphism of Lie coalgebras that forgets the rational structure. Over a point the primitive part
      of weight `m` is `Ext¹(ℝ(0),ℝ(m)) = ℂ/(2πi)^mℝ = ℝ(m−1)`. The period maps of §3.7 factor through
      `L^{HT,ℝ}`: they are built from the real structure ([GR], proof of Theorem 8.3, p. 76, GR lines
      3528–3530; [G08] §4)." In §3.7 state the rigidity lemma for real two-step variations as well
      (the same proof).
   2. §3.13, target sentence: replace "`r_X: U ⊕ B₂ ⊕ L₃ ⊕ L₄ → L^HT_•(η_X)`" by "`r_X: U ⊕ B₂ ⊕ L₃ ⊕
      L₄ → L^{HT,ℝ}_•(η_X)`, the image of the rational variation of each symbol"; properties (1), (2)
      and (4) keep the rational variation of a single symbol; in (3) write "vanish in
      `L^{HT,ℝ}_•(η_X)`".
   3. Proof route, replace the quoted clause by: "so their images in `L^{HT,ℝ}` differ by a constant
      real variation of weight `m ≥ 2` with zero cobracket (rigidity, §3.7), a class in `ℝ(m−1)` on
      which `R` is the identity; its period vanishes by collision continuity (§3.10), so it is zero."
   4. Add the Check: "Rational coefficients do not suffice: the constant extension with class
      `(2πi)^m√2 ∈ ℂ/(2πi)^mℚ` has `R = 0` and is nonzero in `L^HT_m(Spec ℂ)`; in `L^{HT,ℝ}_m` its class
      in `ℂ/(2πi)^mℝ` is zero."

   Tested on the witness: its image in `ℂ/(2πi)^mℝ` is zero, so the repaired inference holds there;
   the generic relations are unaffected (their constants are realizations of classes of
   `Ext¹_{MT(ℚ)}`, detected by the regulator).

2. **F02** (P2) the limit along `t = 0` is used as a variation on `X`; the cited sections give one mixed Hodge structure per disc

   **Location.** `README.md:616`: "The limit is the limit mixed Hodge structure of an admissible
   variation (MixedHodgeModulesAndIrregularHodgeTheory §§3.2–3.3), taken pointwise along `X × {0}`";
   `:623` "they differ by a constant variation"; *Needs* at `:623` "§§3.2–3.3 (limits in (3))".

   **Claim.** The pointwise limits form a framed good Hodge–Tate variation on (an open of) `X`, to which
   rigidity (§3.7) applies and which has a class in `L^HT_•(η_X)`.

   **Witness.** MixedHodgeModulesAndIrregularHodgeTheory at its head, §3.2: "on the punctured disc
   `Δ^*`"; §3.3 API: "An admissible variation has a limit mixed Hodge structure on `Ψ`". No section
   cited makes the family of limits a variation on the divisor. The supplier owns that object
   elsewhere: §5.3 (Hodge nearby cycles) on the modules of §4.6.

   **Repair.** In (3) replace the quoted sentence by: "The limit is the unipotent nearby-cycles object
   of the variation along `t = 0` for the function `t` (MixedHodgeModulesAndIrregularHodgeTheory §5.3,
   applied to the mixed Hodge module of §4.6 of the admissible variation). Prove that for a good
   Hodge–Tate variation it is a good Hodge–Tate variation on a dense open of `X × {0}`: its local
   system is the fibre at `t = 0` of the canonical extension with the residue connection, an iterated
   extension of constant systems; its weight filtration is `W`, the relative monodromy filtration
   being `W` (§3.6); its fibre at `x` is the limit mixed Hodge structure of §§3.2–3.3 on the disc
   `{x} × Δ` with parameter `t`; and it is framed by the limits of the framings." Change the *Needs*
   entry to "MixedHodgeModulesAndIrregularHodgeTheory §§3.2–3.3, 4.6 and 5.3 (limits in (3))", add
   §§4.6, 5.3 to the Scope bullet at `README.md:27`, to the supplier contract at `:120` and to the
   Layer 3 Dependencies at `:667`. The supplier is earlier in the merge order, so no direction changes.

   Tested on the Check of `README.md:634` (`D₃₁(x, x+t)` on `(ℙ¹∖{0,1,∞})²`): the nearby-cycles object
   is a variation on the diagonal, which is what "the limit … is the variation of `D₃₁(x,x)`" compares.

3. **F03** (P3) §6.3 lists §6.2 as a need, so every-family rationality depends on §5.7 through its own *Needs* line

   **Location.** `README.md:1075`: "*Needs:* §§3.2, 3.8, 3.13, 5.1–5.2, 6.2"; against `:965` "The
   every-family statement (§6.3) … do not" and `Suggested.lean:139–140` "README §6.3 proves it …
   without the lift of README §5.7".

   **Witness.** §6.2 is a statement about `κ(k)` and "rests on the proof obligations (a), (b) and (d)
   of §5.7" (`README.md:1064`). §6.3 uses from it only the coordinate conversion (division of `R = i·p`
   by `(2πi)³`, `r_Bo = −2r_Be`), which is BorelRegulators §§1.1 and 6.2 with the Conventions.

   **Repair.** In §6.3 replace "§5.2 and the conversions of §6.2 give the claim" by "§5.2 and the
   conversion to Borel's Tate-divided coordinates (Conventions; BorelRegulators §§1.1, 6.2) give the
   claim", and the *Needs* line by "§§3.2, 3.8, 3.13, 5.1–5.2; PeriodsAndSpecialValues PS.9.8–PS.9.9
   with the contracts mixed-tate-number-fields and mixed-tate-hodge-realization; BorelRegulators
   §§1.1, 2.3, 6.2". Tested: after the change no *Needs* path leads from §6.3 or from the every-family
   half of §6.4 to §5.7.

Three new findings: two P2 (both in the proof route of §3.13(3), on which every-family rationality
rests through §6.3), one P3. No Lean statement is refuted on any instance computed. Round 1 is
repaired except for the part of 1a/F01 that the repair declined; that part is a decision for the
human reviewers and is not re-raised.

## Round 1, finding by finding

| Round-1 id | Status at 56d52bf | Witness (repaired passage) | New error introduced? |
|---|---|---|---|
| 1a/F01, 1b/F02 (existence rests on §5.7) | repaired as 1b asked; 1a's deletion of the headline not applied | `README.md:965` "These three steps are proof obligations of this target"; `:1089` "For `r₂ > 0` existence depends, through §§6.2, 6.1 and 5.8, on the combinatorial lift"; `Suggested.lean:130` | no; the remaining question is under "For the human reviewers" |
| 1a/F02 (contract asked for objects owned here) | repaired | `README.md:104`, `:106`: two contracts, the realization "to the mixed ℚ-Hodge structures of HodgeStructures Layer L2 … sending `ℚ(n)` to the Tate structure of weight `−2n`"; `:539` builds the framed passage here; five slugs equal in `design/plan.json` | no; `ℂ/(2πi)ⁿℚ → ℝ(n−1)` kills `(2πi)ⁿℚ`, so the map is well defined |
| 1a/F03 (stabilization) | repaired | `README.md:700` "nothing relates `t` for `N` and for `N + 1`"; `:716` "No comparison between the maps for `N` and for `N + 1` is asserted"; `:1042` fixed rank `N = 15` | no; SchemeKTheoryOperations §6.7 at its head: bijective for `n ≥ 2m + e`, `e = max(1,s)`, `s = 0` for a field, so `15 = 2·7 + 1` |
| 1a/F04, 1b/F03 (Theorem 1.2 is inductive) | repaired | `README.md:1087` "Theorem 1.2 is stated there for the kernel of `δ₄` on the inductively defined group (GR lines 153–170 and 198)"; both docstrings | no; GR line 198 read |
| 1a/F05 (field not quantified) | repaired | `README.md:74` "for every infinite field `F` and every one-parameter family over `F(t)`"; same in `plan.json` | no |
| 1b/F01 (cobracket at argument 1) | repaired | `README.md:33` slot rule; `:247`; `:276–278` | no: recomputed below (rows §1.5–§1.7), including `x = y = 1` and the specializations `x = 1+αt`, `y = 1+βt` |
| 1b/F04 (downstream sentence) | repaired | `README.md:1147` "The presentation map `B₄^comb → B₄^ind` … is not constructed here" | no; the supplier's sentence is unchanged (human section) |
| 1b/F05 (Layer 2 needed Layer 3) | repaired | new §1.7 at `README.md:265`; `:379`, `:395`, `:410` cite §1.7; §3.1 *Needs* §§1.2, 1.4, 1.6–1.7, 2.5 | no cycle: §1.7 needs §§1.1, 1.3 only |

## The adversarial pass: computed values

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `polylog` (def, no section variables) | `n = 0, z = 1`; `n = 1`, `z = x − i0`, `x > 1`; `n ≥ 2` disc coefficient | `1/0 = 0`; `−log|1−x| − πi` (principal argument `π`), the lower value; `((n−2)!)⁻¹·(n−2)!/k^{n−1}·(1/k) = 1/kⁿ` | sound; same formula as PolylogarithmFunctions `Suggested.lean:47–52` at natural weights |
| `singleValued` | `z = 0`; `z = 1`, `n = 3, 4`; `n = 4, z = 2`; `n = 1, z = 1` | formula gives `0` (so the branch agrees); `ζ(3)`, `0`, equal to the formula's `Li_n(1)` parts; `−1/6 + 1/2 − 1/3 = 0` times `π log³2`; `(riemannZeta 1).re`, a junk value not used | sound for `n ≥ 2`; identical to PolylogarithmFunctions `:177–183` |
| `unitVector` `{F} [Field F]` | `0`, `1`, `−1`, `1/2` | `0`; `1⊗0`; `(1/2)⊗2·ofMul(−1) = 0`; `−u(2)` | sound |
| `trilogCyclic`, `TrilogRelationFunction` `{F} [Field F] {V} [AddCommGroup V] [Module ℚ V]` | constant `b ≡ v`; `(1,1,1)`; three-term at `x = 1`; denominators | `5v − 3v = 2v`, total `7v`; `3b(1) + 4b(−1)`, zero for `L₃` since `L₃(−1) = −3ζ(3)/4`; `b1 + b0 + b0 = b1`; `da`, `Ac`, `d`, `A`, `Acd` nonzero under the six hypotheses | sound; token-identical to Polylogarithms `Suggested.lean:73–89` |
| `IsCycle4` `{F} [Field F]` | `[1]`, `[0]`, `[x] + [x⁻¹]`, `[2]` over ℚ | `b1⊗0`; `0⊗0`; `b(x)⊗(u(x) − u(x))`; `L₃(2)⊗u(2) = (7ζ(3)/8)⊗u(2) ≠ 0` | sound |
| `periodMatrixFour`, `zagierDeterminantFour` `(F) [Field F] [NumberField F]` | `ℚ`; `ℚ(i)`, `[i]`; `ℚ(√−3)`, `[ω]`; exponent | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 45ζ_F(4)`; `L₄(ω) = (√3/2)L(4,χ₋₃)`, so `(π⁴/√3)L₄(ω) = 45ζ_F(4)`, which fixes the power `−1/2` of the discriminant (not seen at `ℚ(i)`); `3d + d − 4N = −4(r₁+r₂)` | sound; equals Polylogarithms' `normalizedPeriod 4` (`4·(N − r₂)`) |
| `zagier_four_exists` | `r₂ = 0`; `ℚ(i)`; `ℚ(√−3)` | `q = 90` over ℚ, Siegel–Klingen in general; `q = 45`; `q = 45` | true on instances; route for `r₂ > 0`: human section |
| `zagier_four_everyFamily` | empty family; zero column; `[i] + [−i]`; conjugate embedding | `q = 90`; `0`; `0`; `q ↦ −q` | true on instances; route: S01–S03 |
| Conventions, CE complex | `d²` on `[x]₄`, `[x]₃⊗y`, `D₃₁(x,y)` (symbolically) | `x∧x = 0`; `(1−x)∧x∧x∧y = 0`; `[x]₂`: `−(1−y)∧y + (1−y)∧y`, `[y]₂`: `(1−x)∧x − (1−x)∧x`, `[y/x]₂`: `0` | sound; with the natural sign on `Λ²B₂` the `[x]₂` and `[y]₂` coefficients double instead |
| §1.2 table against §1.7 | all order cases, generic leading coefficients | `a>0=b`: `S₃(v₀)⊗u(v₀)`; `a=0<b`: `−S₃(u₀)⊗u(u₀)`; `a=b<0`: `(2+1)S₃(w)⊗u(w)`; the six other cases `0` | sound |
| §1.4 (33) against the table | `x = t`; `x = t⁻¹` | table `S₄(1)`, (33) `−S₄(1)`; table `0`, (33) `−S₄(1)` | consistent only with `S₄(1) = 0`, which holds rationally by inversion in `L₄`; not stated in §1.4 (no finding: §6.5 Checks uses it) |
| §1.5 degenerate inverse | `(1,y)`; `(x,x)`; `(1+αt, 1+βt)` | `[1−1/y] + [y] − [1] = −[1−y]`; `2[1−1/x]₃`, cobracket `2[x]₂⊗u(1−1/x)` on both sides; `[β/α] − [β/α] + [1] − [1] = 0` | sound |
| §1.6, §1.7 degenerate cobrackets | `δD₂₁(1,y)`; `δD₃₁(x,1)` against (33); `δD₃₁(1,1)`; `x = 1+αt, y = 1+βt` | `[y]₂⊗u(1−y) = δ(−[1−y]₃)`; coefficients of `u(x)` and `u(1−x)` differ by the three-term element; `0`; `S₃(1)⊗(u(α/β) + u(β) − u(α)) = 0` | sound |
| §3.4–3.5 | weight one; `ad X_{s₁}` on three punctures | `n(n−1)/2` on both sides; `X_a ↦ −[X_{s₁},X_{s₂}] ≠ 0` | sound |
| §3.7, §5.1 constants | `binom(2n−2,n−1)`; diagonal equation at `z = i` | `2, 6, 20`; `i·(5/16)(−3ζ(3)/32) = (5/6)(−9ζ(3)/256)·i = −15iζ(3)/512` | sound |
| §3.9 | phase; weight two at `(0,1,i)` | `i^{m−1}(2πi)^{1−2m} = (2πi)^{−m}(2π)^{1−m}`; `−2(2πi)⁻³πD(i) = −iD(i)/(4π²)`, times `i` gives `−(2πi)⁻²D(i) = 0.023202`; `c₂ = −2` | sound |
| §3.11 | `ℓ = 3` | `1 + 3` nonzero terms on the right, `|I| ≥ 2` zero: five dilogarithms | sound |
| §3.13(3) proof | constant class `(2πi)^m√2` | `R = 0`, class nonzero in `ℂ/(2πi)^mℚ` | S01 |
| §3.14(2),(3) | `D₃₁(x,y)`, `a>0=b` with `v₀ = 1`; ramified extension, `a = b` | `S₃(1)⊗u(1) = 0 = δS₄(1)`; `ea = eb`, quotient of leading coefficients is the residue of `x/y` | sound |
| §4.1, §4.3 | truncation; `D t − t∂` | rows `q ≥ m` and `q < 4` are subcomplexes; `Σ_d (c_d + c_{d+1})·p t_d` | sound |
| §4.8 | bookkeeping of all rows `C_m(q)`, `5 ≤ m ≤ 9`, `q ≤ m−4`; (iv) | the seven identities listed are exactly those the chain condition requires, plus the two relations of `G₄` at `m = 9`; `(3/28)X − (3/28)X` | sound |
| §5.4 | `d∂log|t|`, `d∂̄log|t|` | `πi·δ`, `−πi·δ`, so `d d^C log|t| = 2πi·δ` and `ω₂` has residue constant `πi` | sound |
| §5.7 Check | moment curve `t = (2,3,4,5,6,8/5,0,1)` | `ρ = (24/6, 60/24, 120/60, 48/12) = (4, 5/2, 2, 4)` | sound |
| §5.8 | components of `f − (δh + hD)` on `C₇`, `C₈`, `C₉` | as listed in the README; `h = 0` on `C₆`, `C₈` | sound |
| §6.1 | `N = 15`; rank ≤ 3 | `2·7 + 1`; an invariant flag of length `12` exists in the complement of `F³` exactly because `15 − 3 ≥ 12` | sound |
| §6.2, §6.4 exponents | `ℚ(i)`, `ℚ(√−3)` against BorelRegulators §5.4 | `√|d|·π^{1−8}ζ_F(4)` is a rational multiple of `L₄/π³` in both | sound |

Elaborated signatures: the ten elaborated types supplied with the job were compared one by one
with README §6.4; no binder is lost and nothing changed (no Lean was run in this pass, which is
read-only). The eleventh entry of the supplied list, `does`, is an artefact: line 14 of the module
docstring begins with the word "theorem", which the signature tool read as a declaration.
Rewrapping that docstring line removes the artefact; the file itself has ten declarations.

## Dependency check

```text
depcheck: 253 roadmaps, 2403 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

- Declarations read: 10 of 10 in `Suggested.lean` (8 definitions, 2 theorems). One `import Mathlib`,
  no `set_option`, no sorry'd data, no `lemma`, no `#eval`. Padding probe: no declaration follows
  from one library lemma; each definition is used by a headline. No statable headline is absent:
  the remaining headline groups need `B₂`, `L₄`, motives, correlator integrals, configuration
  complexes or higher K-groups, none at the pins, and the module docstring names each.
- Targets read: all 49 numbered sections (§§1.1–6.5), with Conventions, contracts, Examples,
  Dependencies and Worked examples; every line.
- Locators verified this pass: 19. GR lines 196–200, 220–223, 230–232, 3503–3530, 3548–3559,
  4240–4248, 4290–4292; M20 Theorem 11 (p. 18, line 899), Lemma 29 (line 2378); G09 Theorem 3.4
  and the warning (p. 18), Definition 4.1 (p. 22), Theorems 4.2–4.3 (pp. 23–24); G93 (4.10)–(4.11)
  and the theorem of §4.3 (PDF p. 22 = printed p. 190), Theorem 4.6 with (4.13)–(4.14) (PDF p. 23
  = p. 191). G09 and G93 had not been opened in round 1.
- Checks recomputed: the rows of the table above (26), several instances each. Every definition
  has at least three Checks.
- Sibling citations resolved again, at the open heads or on main: Polylogarithms §§2.1, 2.2,
  3.1–3.7, 4.1–4.7, 5.1, 5.2, 5.4, 5.5, 5.9 and nine declaration names; PolylogarithmFunctions
  §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7 (main); K3BlochGroups §§3.2–3.5, 3.8, 4.21 with
  preBloch_rationalSpecialization and its hypothesis `|k| ≥ 4`; BorelRegulators §§1.1, 2.2, 2.3,
  5.3, 5.4 (the exponent `dₙ − Nn`), 6.0a, 6.2 (`r_Bo = −2r_Be`); MotivicEtaleKTheory §§3.3, 3.4,
  7.1; PeriodsAndSpecialValues PS.3.0, PS.9.3, PS.9.8–PS.9.10; SchemeKTheoryOperations §6.7;
  MotivesAndAlgebraicCycles §3.6, §§6.1–6.3, Layer 4; MixedHodgeModulesAndIrregularHodgeTheory
  §§3.1–3.3 (and §§4.6, 5.3 for S02); HodgeStructures in `Completed/`. All exist; S02 is the one
  citation that does not carry what is asked of it.
- Pinned declarations checked: `NumberField.dedekindZeta`, `Matrix.det_isEmpty`, `bernoulli_one`,
  `TauCeti.Hodge.MixedHodgeStructure`, `MixedHodgeStructureCat.abelian`, `range_inf_F_eq_map_F`,
  `TauCeti.Hodge.tate`. All exist at the pins.
- Declared gaps: five slugs, the same `needs` in `design/plan.json` and in the README; each names
  a supplier and a section; PS.9.8–PS.9.10 at the supplier's head are over ℤ and the
  three-punctured line, so nothing already provided is asked for.
- Ownership: no fully qualified name of this file is declared by a roadmap read here
  (Polylogarithms and PolylogarithmFunctions use their own namespaces; Polylogarithms'
  `Suggested.lean:23` leaves the weight-four theorem to this roadmap). The restated definitions
  agree with their owners' (table).
- Policy: the pull request changes only the package folder; no process words or pull-request
  numbers in the README or docstrings; no algorithm.

## Not verifiable

- The computer-algebra Checks (§2.4 coefficient counts, §3.1 `±0.5011`, §3.13 `0.1206`/`0.1481`,
  §4.8 the ratio `−9`, §5.5 coassociativity, §5.7 the counts 720 and 144): not recomputed here;
  round 1 pass b reports values for §2.4, §4.8 and §5.7.
- §3.14(1) for a general discrete valuation and §5.7 (a), (b), (d): no cited source proves them;
  only instances were computed.
- That Polylogarithms' gap `trilog-specialization-closure` holds: I checked only that the
  inversion and three-term generators are closed under `Sp` in all four valuation cases.
- The statement that arXiv v5 of GR is accepted by a journal (`sources.toml`, `version_note`): not
  checked against arXiv.
- MotivesAndAlgebraicCycles and SchemeKTheoryOperations were read through the roadmaps tool, their
  heads not being among the listed checkouts.

## Source issues

- **Error** in GR at Theorem 1.2, printed p. 5: the source says suitable cycles make the normalized determinant equal to the zeta value; it should be a nonzero rational multiple, the determinant being empty for totally real fields (ratio 90 over ℚ); affects a stated result.
- **Gap** in GR at §9.3, item 2, printed p. 93: the source says that expressing the tetralogarithm by correlators yields a map of the flag complex into the cochain complex of the combinatorial Lie coalgebra; it should construct that map on the presentation, with relations and cobracket; affects the proof.
- **Gap** in GR at §8.2, item 2, printed p. 77: the source says the Hodge realization gives a map from the Lie coalgebra of a function field to rational Hodge–Tate variations whenever a motivic Lie coalgebra is defined; it should give a construction on the combinatorial coalgebra; affects the proof.

Source independence: 10 passages compared with 4 sources (GR lines 196–200, 220–223, 230–232, 3503–3530, 3548–3559, 4240–4248; M20 lines 899, 2378–2384; G09 line 930; G93 line 831), none shared beyond formulas and standard names; largest share GR, 65 of 120 bracketed locators; contents compared with GR: independent (Layer 1 ↔ §§1.2, 5.1; Layer 2 ↔ §§1.3, 3–4, 5.2; Layer 3 ↔ §§1.2, 2, 6, 8.2 with G08 and M20; Layer 4 ↔ §§7, 10; Layer 5 ↔ §§8–9 with G00, G09, G93; Layer 6 ↔ §§1.1, 9.3: no one-to-one run in order, and the order of Layers 4–6 is forced by the *Needs* lines of §§5.8 and 6.1).

## For the human reviewers

- **Scope.** `Suggested.lean:132` states `zagier_four_exists`; for `r₂ > 0` its route passes through README §5.7, whose steps (a), (b), (d) no cited source proves (`README.md:965`; GR lines 4240–4243). Keeping it in the acceptance test is your decision.
- **Scope.** README §3.14(1) and §3.13 (realization in families of the combinatorial coalgebra) have no source statement at their generality: GR line 3554 speaks of a conjectural motivic Lie coalgebra, GR footnote 4 of one-parameter families.
- **Scope.** GR, the source of 65 of 120 locators, is recorded as arXiv:1803.08585v5 only; `sources.toml` says its arXiv comments report acceptance by a journal. I did not check that.
- **Licence.** G93 is read from the author's page as an image scan of a 1993 AMS volume (`sources.toml`, `licence_class = "author-page"`).
- **Scope.** Polylogarithms at its open head (its `README.md:21`) still assigns the presentation map to the inductive complex to this roadmap, which says at `README.md:1147` that it does not construct it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "56d52bf9ab21a9be8e3b79717958e26a99a189aa", "job": "RT-ZagierConjecturePolylogarithms~2a", "model": "fable", "worker": "chris-x89"} -->
