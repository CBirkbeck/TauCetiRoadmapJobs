<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6907789909 -->
Red team round 1 pass a (claude) of 2e46e7e

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the existence headline rests on a target the README itself calls open

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:906` and `:924`:
   "Combinatorial lift. For every infinite field `F`, construct a linear map `𝓛₄: G₄(F) → L₄(F)` …"
   and "The open content of the target is the vanishing in (a) and (b) and the regularity (d)."
   Consumers: README `:941` (§5.8), `:1004` (§6.1, `i = 1, 2`, the map `κ`), `:1022` (§6.2), `:1047`
   (§6.4, existence), and `Suggested.lean:124` (`zagier_four_exists`).

   **Claim.** §5.7 is a target ("construct") for every infinite field, including `𝔽₂(t)` and
   mixed-characteristic specialization, and §§5.8–6.4 prove `zagier_four_exists` from it.

   **Witness.** The README's own text: no source proves (a), (b) or (d) (README `:924`); the cited
   locators GR lines 3973–3975 and 4240–4248 give only a motivic expression (README `:912`); the one
   candidate is undefined at the rational configuration of README `:936` (`ρ₁ = ρ₄ = 4`). GR line 670
   gives a surjection onto correlators only.

   **Why it is a defect.** A proof-plan input must be a target with a source, a supplier section, a
   declared gap or a pinned declaration. This one is an unproved statement, and the acceptance test
   states a theorem whose only route in the README passes through it. `zagier_four_everyFamily` is not
   affected: §6.3 uses §3.13 and the contract mixed-tate-number-fields, not the lift.

   **Repair.** Make the status explicit and stop the headline depending on an open statement.

   1. README §5.7, replace the sentence at `:906` by:
      "Combinatorial lift (conjectural interface). No source proves the following statement and no
      target of this roadmap is proved from it. Conjecture: for every infinite field `F` there is a
      linear map `𝓛₄: G₄(F) → L₄(F)` with the following properties."
      Replace `:924` by: "Statements (a), (b) and (d) are open; (c) and (e) follow from §3.14."
   2. README §5.8 first sentence, §6.1 second item, §6.2 first sentence and the existence clause of
      §6.4: prefix "Assuming the combinatorial lift of §5.7,". In the Summary and in "This roadmap
      owns … (Layer 5)" write "the conjectural combinatorial lift".
   3. `Suggested.lean`: delete `zagier_four_exists` and add to the module docstring: "Rational
      existence of `r₂` explicit cycles with a nonzero multiple of `ζ_F(4)` is proved in README §6.4
      only from the combinatorial lift of §5.7, which is open; it is not stated here."
   4. Alternatively to 2–3, replace the route for number fields by one that does not use `𝓛₄`, and
      keep the headline. A route to examine: (i) the motivic lift of §5.7 gives a cocycle with values
      in the Chevalley–Eilenberg complex of the correlator subcoalgebra of `MT(F)`; (ii) the regulator
      comparison of §§5.8–5.10 is run with framed Hodge–Tate variations (`L^HT_•(η_X)`, §3.13) in
      place of `L(ℂ(X))`; (iii) a preimage `ℓ ∈ L₄(F)` of a motivic cycle has `δ₂₂ℓ = 0` because
      `B₂(F)` injects into the motivic Lie coalgebra, so `ℓ ∈ B₄(F)` by §3.3; (iv) `δℓ = 0` in
      `B₃(F)⊗U(F)` needs `B₃(F)` to inject into the motivic Lie coalgebra of a number field, which
      follows from Polylogarithms §3.8 (cycleLifting_three), its regulator comparison and
      BorelRegulators §2.3. Each of (i)–(iv) would be a new target with its own Checks; I did not
      verify (ii).

   Tested on the refuting instance: after 1–3 no statement of the package asserts a value of `𝓛₄` at
   the configuration of README `:936`, and no Lean statement depends on §5.7.

2. **F02** (P2) the contract mixed-tate-number-fields asks the supplier for objects this roadmap owns, and bundles five deliverables

   **Location.** `README.md:99`: "… and the Hodge realization from `MT(F)` to framed mixed Hodge–Tate
   structures under each complex embedding whose period on `Ext¹` is the Beilinson regulator." Same
   sentence in `design/plan.json`, `gaps`, slug `mixed-tate-number-fields`.

   **Claim.** PeriodsAndSpecialValues (earlier in the merge order) can provide this.

   **Witness.** README `:11` lists "framed mixed Hodge–Tate structures … the canonical real period"
   as owned here (§§3.6–3.7). PeriodsAndSpecialValues at its head has no framed Hodge–Tate carrier
   (`framed` occurs five times, all about the path frames of PS.9.15). The supplier would have to import a
   later roadmap. The sentence also asks for five things: heart and fibre functor, `Ext¹`, `Ext²`,
   primitive part, realization.

   **Repair.** Split the contract and state the realization on a pinned carrier.

   - `gap:mixed-tate-number-fields` (PS.9.8–PS.9.9): "for every number field `F`, the neutral
     Tannakian heart `MT(F)` with its graded fibre functor, `Ext¹_{MT(F)}(ℚ(0),ℚ(n)) ≃ K_{2n−1}(F)⊗ℚ`
     through PS.3.0 for `n ≥ 1`, and vanishing `Ext²` between Tate objects."
   - New `gap:mixed-tate-hodge-realization` (PS.9.9): "for every number field `F` and complex
     embedding `σ`, an exact ℚ-linear tensor functor from `MT(F)` to
     `TauCeti.Hodge.MixedHodgeStructureCat` sending `ℚ(n)` to `TauCeti.Hodge.tate n`, whose map
     `Ext¹_{MT(F)}(ℚ(0),ℚ(n)) → ℂ/(2πi)ⁿℚ → ℝ(n−1)` is the Beilinson regulator of the PS.3.0 class
     under `σ`."
   - Add to §3.8: "The identification of the primitive part of the weight-`n` motivic Lie coalgebra
     with `Ext¹`, and the realization into the framed objects of §3.6, are proved here from these two
     contracts (`Ext² = 0` and MotivesAndAlgebraicCycles §§6.1–6.3)."
   - In `gap:punctured-line-path-torsors` replace "by special derivations" by "by derivations that
     kill the loop `X_a` of the base point and send each `X_s` to a bracket `[X_s, u_s]` (the special
     derivations of §3.5 here)".

   Tested: with the new wording every object named in the supplier's sentence is in the supplier, in
   the pinned Tau Ceti or in an earlier roadmap; `TauCeti.Hodge.MixedHodgeStructureCat` and
   `TauCeti.Hodge.tate` exist at the pin.

3. **F03** (P2) "compatible with stabilization" is not a statement, its locator does not contain it, and its evident reading fails for `N = 4, 5`

   **Location.** `README.md:659` (§4.3): "… and that it is compatible with stabilization after the
   standard flag choices (… [GR], §7.1, Theorem 7.1 …; §9.1, items 1–3, pp. 85–87)"; `:665` "Adding
   standard complementary flag directions gives the stabilized map"; `:676` (§4.4) "through the
   stabilized form of `t`"; `:76` the contract decorated-flag-lengths, "compatible with the
   stabilization `GL_N → GL_{N+1}` by a standard complementary direction".

   **Claim.** There is a stabilized form of `t` and of the comparison map, taken from GR.

   **Witness.** GR states no compatibility of the flag maps with `GL_N → GL_{N+1}`: its only
   stabilization statement is Suslin's theorem on the rank filtration (GR line 222), and GR line 4242
   gives a map "for each n". Weight four uses flag length `N − 3` in `F^N` and `N − 2` in `F^{N+1}`; the contract
   does not say so. Appending a fixed vector `e` as last step: for `N = 5` two image flags have
   `F′_{1,3} + F′_{2,3}` of dimension at most 5 with `3 + 3 ≤ 6`, so the pair is not generic; the same
   for `N = 4` with `2 + 2 ≤ 5`. Prepending `e` fails for every `N` (README `:654`).

   **Repair.**

   - §4.3: delete the clause "and that it is compatible with stabilization after the standard flag
     choices", the API bullet at `:665` and the locator "§9.1, items 1–3, pp. 85–87".
   - §4.4: replace "compatible with `GL_N → GL_{N+1}` through the stabilized form of `t`" by
     "compatible with stabilization on homology: for `N ≥ 4` the map from `H_•(GL_N(F),ℚ)` built with
     flags of length `N − 3` in `F^N` equals the composite of `H_•(GL_N(F),ℚ) → H_•(GL_{N+1}(F),ℚ)`
     with the map built with flags of length `N − 2` in `F^{N+1}`. No chain map of generic flag
     tuples induces this for `N = 4, 5` (Checks); a proof compares the two resolutions restricted to
     `GL_N(F)` up to homotopy, as in the rank argument of §6.1." Add the `N = 5` computation above as
     a Check, and state that GR treats each `N` separately (GR line 4242) and uses stabilization only through Suslin's theorem (GR line 222).
   - Contract decorated-flag-lengths, last clause: "… is natural in field embeddings, and for
     `1 ≤ k ≤ N` the comparison maps for `(N, k)` and `(N+1, k+1)` agree up to chain homotopy after
     restriction to `GL_N(F)` and the maps of §4.3 to the Bigrassmannian". Same in `plan.json`.

   Tested on `N = 5`: the repaired statement is on homology and does not assert a map of generic
   tuples.

4. **F04** (P3) Theorem 1.2 of the source is about the inductive groups; the README and the docstrings cite it for explicit cycles without saying so

   **Location.** `README.md:3` "in the form of Goncharov and Rudenko: there are `r₂` explicit
   weight-four cycles"; `:1045` "(… Theorem 1.2, p. 5, GR line 196 …). The source writes the existence
   statement as an equality"; `Suggested.lean:120` and `:130`.

   **Witness.** GR lines 153–170 define the groups of Theorem 1.2 inductively from `F(t)`; the
   explicit `B₃` appears at GR lines 333–339. The explicit existence statement is stronger than GR
   line 198, and the explicit every-family statement weaker than GR line 200 (README `:1087` says so
   for §6.5 only).

   **Repair.** README `:1045`, after the locator add: "Theorem 1.2 is stated for the inductively
   defined groups (GR lines 153–170). The statements here use the explicit cycles: existence for
   explicit cycles implies it for inductive ones (§6.5), and every-family rationality is proved for
   explicit cycles only." In the Summary replace "in the form of Goncharov and Rudenko" by "for the
   explicit cycles of Polylogarithms §4.5". In both docstrings replace "(Goncharov–Rudenko, Theorem
   1.2, p. 5)" by "(Goncharov–Rudenko, Theorem 1.2, p. 5, there for the inductive groups; here for
   explicit cycles)".

5. **F05** (P3) the contract trilog-specialization-closure does not quantify the field

   **Location.** `README.md:73`: "for every one-parameter family over `F(t)` of admissible
   parameters …" and the same `needs` in `plan.json`.

   **Witness.** Polylogarithms §3.1 defines trilogGroup "for every field `F`"; every use here is over
   an infinite field (README `:173`, "indexed by all infinite fields"), and the weight-two
   specialization already needs a residue field with at least four elements (README `:618`).

   **Repair.** Begin the sentence "for every infinite field `F` and every one-parameter family …", in
   the README and in `plan.json`.

Five findings: one P1, two P2, two P3. The two Lean headlines are true as typed on every instance
I computed; R01 is about what the existence headline rests on, not about a counterexample to it.

## The adversarial pass: computed values

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `polylog` | `n = 2, z = 1`; `n = 1, z = 3`; `n = 0` | `1.6449 = π²/6`; `−log 2 − πi`; never evaluated by `singleValued` (`n − k ≥ 1`) | sound |
| `singleValued` | `L₃(1)`, `L₃(2)`, `L₃(−1)`, `L₄(i)`, `L₄(2)`, `L₂(i)` by quadrature of the Lean formula | `1.2020569 = ζ(3)`; `1.0517998 = 7ζ(3)/8`; `−0.9015427 = −3ζ(3)/4`; `0.9889446 = β(4)`; `−3.9e−16`; `0.9159656` | sound; `B₁ = −1/2` and the lower branch confirmed by `L₄(2) = 0` |
| `unitVector` | `0`, `1`, `−1` | `0`; `1⊗0 = 0`; `(1/2)⊗2·ofMul(−1) = 0` | sound |
| `trilogCyclic` + 22-term clause | `b = L₃` at `(2,3,5)`, `(−2,1/2,3)`, `(0.3,−0.7,0.6)`, `(1,1,1)`, `(2,2,2)`, `(1+i, 1/2−2i, −0.3+0.4i)`, `(i,2,−i)`; constant `b` | `−1.8e−14`, `2.4e−14`, `1.5e−13`, `4.0e−15`, `1.7e−14`, `1.1e−14`, `7.2e−15`; constant `v` gives `7v` | relation true for `L₃`, also at complex and at boundary-value arguments |
| `TrilogRelationFunction` | compared with Polylogarithms `Suggested.lean:81–89`; admissibility | identical clause by clause; every denominator `da`, `Ac`, `d`, `A`, `Acd` nonzero under the six hypotheses, in all three rotations | sound, same convention as the supplier |
| `IsCycle4` | `[1]`, `[2]` over ℚ, `[x] + [x⁻¹]`, `[0]` | `b(1)⊗0 = 0`; `L₃(2)⊗u(2) = 1.0518⊗u(2) ≠ 0`; `b(x)⊗(u(x) − u(x)) = 0`; `0` | sound; wrong model "numerical `L₄` test" excluded by `[2]` (`L₄(2) = 0`) |
| `periodMatrixFour`, `zagierDeterminantFour` | `F = ℚ`; `F = ℚ(i)`, `c = [i]` | `π⁴ = 90·ζ(4)`; `(π⁴/2)·0.9889446 = 48.166 = 45·ζ(4)β(4)` | sound; exponent `4(r₁+r₂)` rederived from the functional equation: `ζ_F(4) ∼ |d|^{1/2}π^{4r₁+7r₂}ζ*_F(−3)`, `L₄` columns `∼ π³` |
| `zagier_four_exists` | `ℚ` (`r₂ = 0`), `ℚ(i)`; zero family | `q = 90`; `q = 45`; zero family gives `0 ≠ q·ζ_F(4)` so it is no witness | true on instances; proof route: R01 |
| `zagier_four_everyFamily` | `ℚ`; `ℚ(i)` with `[i] + [−i]`; conjugate embedding | `q = 90`; `q = 0`; `q ↦ −q` | true on instances; route §6.3 does not use §5.7 |
| Conventions: `s`, `r`, `Z` | `s(∞,1,0,x)`, `r(∞,0,1,x)`, `s(∞,0,1,x)`, `Z(0,…,5)` | `x`, `x`, `1 − x`, `1/5` | sound |
| §2.2 flip identity | general, with `ef = ac + bd` | `W_T − W_T′ = (ef)∧X + (ac)∧(bd) = (1+X)∧X = δ[−X]₂` | sound |
| §3.8/§3.13 cut signs | words `(0,1,y)`, `(0,0,1,y)`, `(0,x,1,y)` | `(1−y)∧y`; one survivor `[y]₂⊗u(y)` of 8 cuts; four terms equal to `−δD₂₁(x,y)` term by term | sound in the README's conventions |
| §3.7/§5.1 constants | `µ` in weight 4; `R` versus `P`; `µ(d^Ca∧d^Cb)` | `1/10, 1/10`; `1/4, 1/6, 1/4`; `1, 1/3`; `R = P/2, P/6, P/20`; `(5/24)d^Cd^C + (1/24)dd` | sound |
| §5.1/§6.2 numbers | `z = i` | `L₃*(i) = −9ζ(3)/256`; `dR(S₄)(∂θ) = R([z]₃⊗z)(∂θ) = −3iζ(3)/256`; `p = β(4)/8`; `−β(4)/(64π³) = −4.9836e−4` | sound |
| §3.9 constants | weight 2 | `−2(2πi)⁻³·πD(i) = −iD(i)/(4π²) = −0.023202i`; `c₂ = −2` | sound |
| §4.8 (iv) | five-term relation for `(1 \| 2,5,6,7,8)` under `Alt₈` | `Alt(f) − 0 + X + X + X = 0`, so `3X = −Alt(f)`; for `(1 \| 4,5,6,7,8)` the `f` terms cancel and only `3·Alt(g) = 0` results | README's reduction confirmed; the source's step is not justified (Source issues) |
| §4.3 stabilization | `N = 4, 5` | appended `e`: `dim(F′_{1,k+1} + F′_{2,k+1}) ≤ 2k + 1 < 2k + 2 ≤ N + 1` | fails: R03 |
| gap trilog-specialization-closure | families `(t,1,1)` and `(t,t,1)` | specializations `0 − [1] + [1] + 0 = 0` and `0 + [1] − [1] + 0 = 0` | consistent on both; not falsified |

## Dependency check

```text
depcheck: 248 roadmaps, 2334 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Verified sound

- Declarations read: 10 of 10 in `Suggested.lean` (8 definitions, 2 theorems), against the
  elaborated signatures the worker supplied; no lost binder; one `import Mathlib`; no `set_option`,
  no sorry'd data, no `lemma`. None is padding: each definition is used by a headline, and neither
  headline follows from one library lemma (no polylogarithm or Bloch group at the pins).
- Not-statable headlines: the five bullets of the module docstring match the README's headline
  list (extension theorem, realization, collision continuity, configuration chain map and Chern
  cocycle, K-theory maps); each needs a carrier absent at the pins.
- Targets read: all 48 numbered sections of the README, every line.
- Locators verified: 41 cited GR line numbers against their pages; 62 GR theorem, lemma,
  proposition, corollary, definition and example labels against the cited pages; GR (1), (19),
  (26), (28), (29), (32), (33), (38), (135), (165)–(169); M20 (3), (4), Theorem 6(a), the example
  after (16); G08 p. 105; G00 item 2; CGR Theorem 9. All agree with the README.
- Checks recomputed: 31 (the table above, plus §1.4 at `x = −1`, §1.5 at `(2,3)`, §2.1 face
  counts, §2.3 edge and square algebra, §6.2 exponent, §6.4 values for `ℚ` and `ℚ(i)`). Every
  section has at least three Checks.
- Sibling citations checked: Polylogarithms §§2.1, 2.2, 3.1–3.7, 4.1–4.7, Layer 5 and twelve
  declaration names at its head; BorelRegulators §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2;
  K3BlochGroups §§3.2–3.5, 3.8, 4.21 (preBloch_rationalSpecialization); MotivicEtaleKTheory
  §§3.3, 3.4, 7.1; PeriodsAndSpecialValues PS.3.0, PS.9.3, PS.9.8–PS.9.10;
  MotivesAndAlgebraicCycles §3.6, §§6.1–6.3, Layer 4; MixedHodgeModulesAndIrregularHodgeTheory
  §§3.1–3.3 and its boundary Check on `𝔸²`; PolylogarithmFunctions §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2,
  5.7 on main; HodgeStructures L2 in `Completed/`. All exist as cited.
- Pinned declarations checked: five Tau Ceti names with their files, twelve Mathlib names and
  files. All exist.
- Ownership: Polylogarithms (lines 21, 680, 710) hands the weight-four theorem, `L₄*`, `κ`
  and the inductive transfer to this roadmap; no second owner found. The Lean names repeat
  Polylogarithms' in a different namespace, so no fully qualified name is shared. Four gaps: slugs
  agree between `plan.json` and the README.
- Policy: the pull request changes only the package folder; no process words or pull-request
  numbers in the README or the Lean file; no algorithm.

## Not verifiable

- The numerical Checks of §2.4 (70 and 35 coefficients), §3.1 (`±0.5011`), §3.13 (`0.1206`,
  `0.1481`), §4.8 (the ratio `−9`, `X ≠ 0`) and §5.5 (coassociativity on tetrahedra): no
  computer-algebra tool here; I checked only the algebra around them.
- That GR Lemma 7.9 is false, as README `:757` says: I confirmed that its proof step fails, not
  that `X ≠ 0`.
- The claims that GR (99), (192), (244) and the `a₃` coefficient of GR §9.3 are misprinted: not
  recomputed.
- G93 (OCR scan) and G09 locators: not opened.
- MotivesAndAlgebraicCycles: read through the roadmaps tool (headings and §3.6, §§6.1–6.3 only);
  its head is not among the checkouts listed.
- No Lean was elaborated in this pass.
- Negative searches in the source extractions were done by a script, after the shell search tool
  returned nothing on those files; the two negative claims used (R03, GR on stabilization) were
  rechecked that way.
- Whether the specialization closure asked of Polylogarithms §3.1 holds: tested on two families
  only.

## Source issues

- **Misprint** in GR at the worked case after (38), printed p. 14: the source says the equal-pole specialization of the weight-four double symbol is the single symbol of `u/v`; it should be three times it, as table (26) and the computation's last line give; affects nothing.
- **Error** in GR at Theorem 1.2, printed p. 5: the source says `ζ_F(4)` equals the normalized determinant for suitable cycles; for `r₂ = 0` the determinant is empty and over ℚ the ratio is 90, so it should be a nonzero rational multiple; affects a stated result.
- **Gap** in GR at Lemma 7.9, printed p. 72: the source says the five-term relation for `(1|4,5,6,7,8)` rewrites the second term of (169) as a symmetric one; under the alternation that relation only kills the symmetric term; affects the proof.
- **Gap** in GR at §9.3, item 2, printed p. 93: the source says the motivic expression by correlators gives a map into the cochain complex of the combinatorial Lie coalgebra; Theorem 1.13 gives only a surjection onto correlators, so a lift respecting relations and cobracket is needed; affects the proof.
- **Error** in M20 at the example after (16), printed p. 18: the source says `Cor^H(1,0,z)` is minus one half of `(2πi)⁻²L₂(z)`; formula (4) on p. 4 gives `(2πi)⁻²L₂(z)`; affects nothing.

Source independence: 10 passages compared with 5 sources (GR, G08, M20, G00, CGR), none shared beyond formulas; largest share GR, 64 of 120 locators; contents compared with GR: independent (Layer 1 ↔ §1.2 and §5.1, Layer 2 ↔ §§3–4, Layer 3 ↔ §§2, 5.2, 6 and 8.2, Layer 4 ↔ §§7 and 10, Layer 5 ↔ §§8–9, Layer 6 ↔ §§1.1 and 9.3; no one-to-one run in order). G93 and G09 were not opened.

## For the human reviewers

- **Scope.** The main source GR (64 of 120 locators) is recorded in `sources.toml` as arXiv:1803.08585v5 only, with no journal reference; G08, G09, M20, G00 and CGR likewise. I did not search for published versions.
- **Scope.** README §5.7 (`:924`) says the combinatorial lift has open content and that GR's argument for it is incomplete; `zagier_four_exists` depends on it (R01). Whether the roadmap may keep that headline is a decision.
- **Scope.** README §3.14(1) and §5.7(iii) state specialization of `L₃`, `L₄` along arbitrary discrete valuations, mixed characteristic included; the only locator is GR (26) for `K(t)`. The general statement is new mathematics with a proof sketch.
- **Licence.** G93 is read from the author's page (`licence_class = "author-page"`), an image scan of a 1993 AMS volume.
- **Not tested.** The README says GR (99), (192), (244), Lemma 7.9 and the `a₃` coefficient are wrong and departs from them; I confirmed only the proof gap in Lemma 7.9.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2e46e7ec66de1face4fb3be62b1104e9df8e5406", "job": "RT-ZagierConjecturePolylogarithms~1a", "model": "fable", "worker": "chris-x81"} -->
