# FIX-RT-ZagierConjecturePolylogarithms~1

Repairs for red-team round 1, passes a and b. Files changed: `packages/ZagierConjecturePolylogarithms/README.md`, `Suggested.lean` (docstrings only), `design/plan.json` (top-level `gaps` only) and `sources.toml` (the GR `version_note` and `cited_for`).

## RT-ZagierConjecturePolylogarithms~1a/F01, RT-ZagierConjecturePolylogarithms~1b/F02 (P1) — applied differently

**What changed.** §5.7 "open content" sentence → (a), (b), (d) named as proof obligations no cited source proves, with what depends on them. The dependence is stated in the Summary, Scope, How to read, §§5.8, 6.1, 6.2, 6.4 and both Lean docstrings. `zagier_four_exists` is kept.

**Verification.** Both reviews state the facts correctly. For `r₂ > 0` the existence route runs §6.4 → §6.2 → §6.1 → §5.8 → `𝓛₄`. GR's own argument reaches only the motivic image over number fields (GR lines 4236–4249, 3973–3975). Its cocycle needs the combinatorial complex at function fields of `BGL_n•` (GR lines 1070, 3982). Theorem 1.13 gives only a surjection (GR line 670). The every-family route (§6.3) does not use §5.7.

**Why differently.** Pass b's repair is applied as written. Pass a's repair asked to delete the headline and label §5.7 a conjecture. That part is not applied, for three reasons:

- The statement is a theorem of a paper whose arXiv v5 comments describe it as the final version accepted for publication in Annals of Mathematics. This is recorded in `sources.toml` (GR `version_note`).
- Polylogarithms §3.8 treats a published claim with an undisplayed step the same way: it keeps `zagier_three_exists` and names the step as a proof obligation.
- Deleting a statable end theorem is the scope decision that both reviews put to the human reviewers.

Pass a's own wording ("no target is proved from it" alongside "Assuming … " prefixes on §§5.8–6.4) was also inconsistent. The lift stays an owned target, with its unproved steps named.

## RT-ZagierConjecturePolylogarithms~1a/F02 (P2) — applied differently

**What changed.** `gap:mixed-tate-number-fields` keeps heart, fibre functor, `Ext¹ ≃ K` and `Ext² = 0`. New `gap:mixed-tate-hodge-realization`: a realization into mixed ℚ-Hodge structures (HodgeStructures L2), `ℚ(n)` to weight `−2n`, `Ext¹` period the Beilinson regulator. §3.8 now proves primitive part `= Ext¹` and the passage to framed objects; punctured-line gap describes derivations intrinsically.

**Why differently.** The finding is right: the old contract asked PeriodsAndSpecialValues, an earlier roadmap, to land in framed mixed Hodge–Tate structures, which this roadmap owns (§3.6). The suggested wording "to `TauCeti.Hodge.MixedHodgeStructureCat` sending `ℚ(n)` to `TauCeti.Hodge.tate n`" does not typecheck mathematically:

- At the pin, `TauCeti.Hodge.tate m` is a pure `HodgeStructure` on `ℤ` (`TauCeti/Geometry/Hodge/Tate/Basic.lean`, `noncomputable def tate`), not an object of `MixedHodgeStructureCat`.
- `MixedHodgeStructure` lives on an integral module with a rational model (`Mixed/Basic.lean`, `structure MixedHodgeStructure`), while `MT(F)` is ℚ-linear.

So the contract names the mathematical target instead of those declarations. The primitive-part identification needs no `Ext² = 0`: in `Rep(𝔾_m ⋉ U)`, the kernel of the cobracket is the dual of `(Lie U)^ab`, which is `H¹(U)`.

## RT-ZagierConjecturePolylogarithms~1a/F03 (P2) — applied differently

**What changed.** §4.3: stabilization clause, API bullet and "§9.1, items 1–3" deleted. §4.4: no cross-rank comparison asserted, witness Check added. Contract decorated-flag-lengths (README, `plan.json`): stabilization clause dropped. §6.1: fixed rank `N = 15` via SchemeKTheoryOperations §6.7 (bijective for `n ≥ 2m + 1` over a field); §§5.7, 6.2 adjusted.

**Verification.** GR §9.1, items 1–3 (GR lines 3906–3954) contain no stabilization statement, and GR uses stabilization only at GR line 222. The witness holds, and is stronger than stated. For `N = 5`, appending `e` gives `dim(F′_{1,3}+F′_{2,3}) ≤ 5` although `3 + 3 ≤ 6`. For every `N`, `N + 1` image flags have their first lines inside `F^N`.

**Why differently.** Pass a proposed a homology-level compatibility target proved "by comparing the two resolutions up to homotopy". That route does not work: chain maps from a projective resolution into the non-acyclic coinvariant complex are not unique up to homotopy, and no source states the compatibility. Fixing one rank in van der Kallen's stable range makes the maps on `K_{8−i}` well defined without it. At `n = 14` the range gives only surjectivity for `m = 7`; this is a Check.

## RT-ZagierConjecturePolylogarithms~1a/F04, RT-ZagierConjecturePolylogarithms~1b/F03 (P3) — applied

**What changed.** Summary: "in the form of Goncharov and Rudenko" → "for the explicit cycles of Polylogarithms §4.5". §6.4: Theorem 1.2 is for the inductive group (GR lines 153–170, 198); explicit every-family follows from it; explicit existence is stronger and is what the proof gives (GR lines 501–502, 682–685). Docstrings updated likewise.

## RT-ZagierConjecturePolylogarithms~1a/F05 (P3) — applied

**What changed.** The contract trilog-specialization-closure, in the README and in `plan.json`, changes from "for every one-parameter family over `F(t)`" to "for every infinite field `F` and every one-parameter family over `F(t)`". Every use here is over an infinite field (§1.3: the family of relation submodules is indexed by infinite fields; §3.14: infinite residue fields).

## RT-ZagierConjecturePolylogarithms~1b/F01 (P2) — applied

**What changed.**

- Conventions: a slot product or ratio means the signed sum of the `u` of its factors, with `u(0) = 0`; a symbol with a vanishing denominator is the symbol at `∞`.
- §1.5: explicit values `D₂₁(1,y) ↦ −[1−y]₃` and `D₂₁(1,1) ↦ 0`, plus a Check.
- §1.6: degenerate `δD₂₁` values, plus a Check.
- §1.7: degenerate `δD₃₁` values and two Checks, including `δD₃₁(3,1)`.

**Verification.** Under the stated rule `δD₃₁(x,1) = D₂₁(x,1)⊗u(x) + S₃(x)⊗u(1−x) − S₃(1)⊗u(1−1/x)`. This equals δ of (33) up to the three-term relation; I checked the coefficients of `u(x)` and `u(1−x)` separately. Reading `u` of the value of the quotient instead loses `S₃(3)⊗u(2)`, which `L₃⊗ord₂` sends to `L₃(1/3) = 0.914279`.

Along `x = 1 + 2t` the leading coefficient enters twice and cancels by inversion, which reproduces the stated `δD₃₁(1,v)`. Along `x = 1 + t`, `y = 1 + βt` the two `0/0` arguments of §1.5 both specialize to `β`.

## RT-ZagierConjecturePolylogarithms~1b/F04 (P3) — applied

**What changed.** Downstream consumers: "its statements in weight four are discharged by §§5.2 and 6.1–6.5" → "these are §§5.2 and 6.1–6.5", followed by: the presentation map `B₄^comb → B₄^ind` that Polylogarithms §4.6 names is not constructed here, and §6.5 uses the square with `C = ℚ[F]`.

**Evidence.** I confirmed at the Polylogarithms checkout that line 21 and §4.6 (the paragraph beginning "In weight four the corresponding square has `C=B₄^comb`") assign that map to this roadmap.

## RT-ZagierConjecturePolylogarithms~1b/F05 (P3) — applied

**What changed.** New §1.7, "The raw weight-four cobracket": the definition of `δ` on `Raw₄(F)`, its components, degenerate values, API and three Checks (the `(2,2)` Check moved from §3.1). §3.1 keeps descent and co-Jacobi, *Needs* §§1.2, 1.4, 1.6–1.7, 2.5. §§2.4, 2.5 and Layer 2 Dependencies cite §1.7. No id removed.

§3.1 keeps the descent, the specialization check and co-Jacobi, with *Needs* §§1.2, 1.4, 1.6–1.7, 2.5. In §§2.4 and 2.5 and in the Layer 2 Dependencies, "the raw weight-four cobracket formula of §3.1" → §1.7. No id is removed.

## Checks run

- **Elaboration.** `lake env lean` was run from the content checkout on `packages/ZagierConjecturePolylogarithms/Suggested.lean`. It exited 0 with two `declaration uses sorry` warnings, at lines 132 and 143. There is no `TauCeti.*` import.
- **`#check` scratch.** A copy of the file plus `#check @name` for all ten declarations elaborated with exit 0. The elaborated types are unchanged: only docstrings changed, and no binder was lost.
  - `[Field F]` is on the field-level definitions.
  - `[AddCommGroup V] [Module ℚ V]` is on `TrilogRelationFunction`.
  - `[NumberField F]` is on `periodMatrixFour`, `zagierDeterminantFour` and both theorems.
  - `hc : ∀ j, IsCycle4 (c j)` is on `zagier_four_everyFamily`.

  These agree with README §6.4.
- **Dependency check.** No UPWARD, CYCLE or `moved:` line:

```text
depcheck: 251 roadmaps, 2388 edges, 0 problem(s)
```

- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that resolves nowhere.
- **Gaps.** There are five slugs, identical in `plan.json` and in the README's "Exact supplier contracts": trilog-specialization-closure, mixed-tate-number-fields, mixed-tate-hodge-realization (new), punctured-line-path-torsors and decorated-flag-lengths. Nothing else in `plan.json` changed; I checked this by comparing the file with its `gaps` key removed.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions slot rule | `δD₂₁(1,3)`; `δD₃₁(1,1)`; `δD₂₁(1,1)` | `[3]₂⊗(u(−2)−u(0)) = [3]₂⊗u(2)`; all five terms `0`; slot `u(1)−u(1) = 0` | consistent with §1.5 |
| §1.5 degenerate inverse | `(1,3)`; `(1,y)`; `(1+t, 1+βt)` | `[2/3]₃+[3]₃−[1]₃ = −[−2]₃`; three-term gives `−[1−y]₃`; both `0/0` arguments → `β`, cancel | Check added |
| §1.6 degenerate δ | `(x,1)`, `(1,y)` | `[1/x]₂⊗(u(0)−u(1−x)) = [x]₂⊗u(1−x)`; `δ(−[1−x]₃) = [x]₂⊗u(1−x)` | agree |
| §1.7 `δD₃₁(x,1)` against (33) | general `x`; `x = 3` over ℚ | coefficient differences `S₃(1) − (S₃(x)+S₃(1−x)+S₃(1−1/x)) = 0`; lost term `L₃(3) = L₃(1/3) = 0.914279` | rule forced |
| §1.7 specialization | `x = 1+2t`, `y = v` | `S₃(1/v)⊗u(2) − S₃(v)⊗u(2) = 0`; remainder equals stated `δD₃₁(1,v)` | commutes with `Sp` |
| §3.8 primitive part | weight 1, 2, 3 over ℚ | `ℚˣ⊗ℚ`; `K₃(ℚ)⊗ℚ = 0` while `δCor_∞(0,1,3) = u(2)∧u(3) ≠ 0`; `R(S₃)(1) = −(2/3)(3/8)ζ(3) = −ζ(3)/4` | Check added |
| gap mixed-tate-hodge-realization | `n = 1`, Kummer class of `x` | `log σx ∈ ℂ/2πiℚ` projects to `log|σx|` in `ℝ(0)` | the weight-one regulator; consistent |
| §4.4 stabilization witness | `N = 4, 5`; any `N` with `N+1` flags | `dim ≤ 3 < 4` (`2+2 ≤ 5`); `dim ≤ 5 < 6` (`3+3 ≤ 6`); `N+1` lines in `F^N` | no chain-level stabilization |
| §6.1 fixed rank | `m = 7, 6, 5, 4`; `N = 14` | thresholds `15, 13, 11, 9 ≤ 15`; at 14 only onto for `m = 7` | rank 15 suffices, 14 does not |
| §6.1 rank ≤ 3 vanishing | class from `GL₃` | its unique `GL₁₅` preimage is its image under `GL₃ ⊂ GL₁₅` | section argument applies |
| trilog-specialization-closure | `F` finite | not used: §1.3 family and §3.14 residue fields are infinite | narrowing is safe |
| §6.4 explicit vs inductive | existence; every family | explicit ⊂ inductive raw cycles with equal periods: explicit existence ⇒ inductive; inductive every-family ⇒ explicit | as stated |
| `zagier_four_exists` (unchanged) | `ℚ`; `ℚ(i)`, `[i]` | `q = 90`; `π⁴β(4)/2 = 48.166 = 45·ζ_{ℚ(i)}(4)`, `q = 45` | true on instances |

## Ownership and overlaps

- **Lie coalgebra of `MT(F)`.** `roadmaps grep` for the motivic Lie coalgebra and for framed mixed Tate objects found no owner on main or in any open pull request. The roadmap already owned this object (Scope, Layer 3), so §3.8 states it here.
- **SchemeKTheoryOperations §6.7.** Read at the head of SchemeKTheoryOperations' open pull request (#1229). It is earlier in the merge order (line 37), and `roadmaps overlaps SchemeKTheoryOperations` reports no pull request that drops any of its ids.
- **HodgeStructures.** On main, under `Completed/`.
- **Board packages.** The board packages index lists two other packages, neither close to this subject.

## For the maintainer

- **Polylogarithms (pending revision).** Its line 21 and §4.6 still assign "the presentation map to the inductive complex" (`B₄^comb → B₄^ind`) to this roadmap. That map is not constructed here (§6.5, Downstream consumers). Those two sentences need a matching edit in Polylogarithms' own pull request.
- **PeriodsAndSpecialValues (supplier gap).** It is now asked for three gaps instead of two. The Hodge realization moved into its own slug, mixed-tate-hodge-realization.
- **Polylogarithms (gap request narrowed).** It is asked for less than before: decorated-flag-lengths no longer asks for compatibility across ranks, and trilog-specialization-closure is limited to infinite fields.
- **Names other roadmaps cite.** No section id was removed or renumbered (§1.7 is new), and no Lean name changed.
- **Human decision outstanding.** Whether `zagier_four_exists` stays in the acceptance test while §5.7(a), (b) and (d) have no source proof is left to the human reviewers, as both reviews ask.
- **No untrusted text needed acting on.** Nothing in the reviews or the fetched pages asked for an action outside this job.
