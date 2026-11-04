# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at d9d4660)

**Verdict:** accepted

Incremental re-review of the 5 lines changed since 6cd9340 (README only; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). The two findings of the previous review that concern the roadmap folder are repaired: the §7.4 trace is now summed over the left cosets `J/J'`, with the discriminating `S₃` Check, and `dense_smoothVectors` is attributed to `TauCeti.Analysis.Semigroups.Generator.SmoothDensity`. The gate passes every check, the dependency check prints no UPWARD or CYCLE line, and the one Lean theorem elaborates with `sorry` as the only warning. One P3 remains, outside the folder: the pull request's merge-order block still names three roadmaps the README no longer consumes.

## R01 (P3) — The pull request's merge-order block still names the three dropped suppliers as prerequisites

Location: the pull request description, `<!-- merge-order -->` block ("It also depends on other authors' pull requests that add roadmaps it cites, which must merge first: #934 (QuaternionicModularForms, WilliamCoram), #1015 (NoncompactQuantumSymmetry, kim-em), #1145 (SmoothBanachRepresentations, kim-em)").

Claim: this roadmap depends on those three pull requests.

Witness: at d9d4660 the README cites all three only as consumers (lines 7, 11, 1295, 1303: SmoothBanachRepresentations "is a consumer, not a supplier"; QuaternionicModularForms consumes §§7.4–7.6; NoncompactQuantumSymmetry is at merge-order line 138 and is cited as a consumer), and the dependency check at this head loads no edge to any of them (`205 roadmaps, 1404 edges, 0 problem(s)`, the same count as at 6cd9340). The block is unchanged since the previous review (its R03), which found the same.

Repair: drop #934, #1015 and #1145 from the merge-order block and say in the description that the Lie test functions (§0.1a), the Banach smooth vectors (§2.7) and the abstract level-form carrier (§7.4) are targets here, with SmoothBanachRepresentations and QuaternionicModularForms as consumers. This is a description edit, not a folder edit, and does not block acceptance of the folder.

## Previous findings

- R01 — repaired: line 1205 "the trace `(tr f)(g)=Σ_{uJ'∈J/J'}f(gu)|u⁻¹`, summed over the left cosets `uJ'`: the `J'`-covariance … makes the term `f(gu)|u⁻¹` constant on `uJ'`", with the `S₃` Check at line 1220 (computed below).
- R02 — repaired: line 41 "with `dense_smoothVectors` in `TauCeti.Analysis.Semigroups.Generator.SmoothDensity`"; at the pin `dense_smoothVectors` is `Analysis/Semigroups/Generator/SmoothDensity.lean` line 127, `IsSmoothVector` and `smoothVectors` are `SmoothVectors.lean` lines 45 and 49.
- R03 — not repaired: the merge-order block of the description still names #934, #1015 and #1145 as prerequisites (R01 above, P3, non-blocking).

## Verified sound

**Gate, build and edits outside the folder.** The worker's gate at d9d4660 passes every check (`depcheck=0`, `residue=0`, `readme-ids-missing=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `stray-files=0`, `outside-folder=0`, `build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat 6cd9340 HEAD` touches only `README.md` (3 insertions, 2 deletions). `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` at this head takes 2.9 s and prints only `declaration uses sorry` (line 47). The file is byte-identical to the head of the previous two reviews, so the elaborated type of `compactFinite_dense_locallyConvex` (the worker's `signatures.md`: `[CompactSpace K] [T2Space K] [IsUniformAddGroup E] [T2Space E] [LocallyConvexSpace ℝ E] [CompleteSpace E]`, the joint-continuity hypothesis, conclusion `Dense` of the set of vectors whose `K`-orbit spans a finite-dimensional space) still matches §2.1's statement, no binder is dropped, the one-tactic probes and the headline audit of the previous reports stand, and the docstring's list of unstatable headlines still matches the README. No headline statable at the pins is absent.

**Dependency check.** Output at this head:

```
depcheck: 205 roadmaps, 1404 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the edge count equals that at 6cd9340. The merge order lists this roadmap at line 62, after ArithmeticLocallySymmetricSpaces (61); NoncompactQuantumSymmetry is at 138 and is cited only as a consumer; SmoothBanachRepresentations and QuaternionicModularForms are not in the order and are cited only as consumers.

**Declared gaps.** Unchanged: `gap:banach-gfinite-density` (CompactGroups Layer 5, line 51) and `gap:reductive-enveloping-centers` (LieHighestWeight Layer 9, line 53) are stated in the supplier subsections in the required form; there is still no readable `design/plan.json`, so the intake must record the two slugs in the plan's `gaps` (as the previous two reviews noted).

**Adversarial table** (rows with computed values for every changed statement; the previous report's rows for the untouched statements carried forward by citation).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §7.4 trace well defined on `J/J'` (line 1205) | `f∈S_Γ(J',M)`, `u∈J`, `u'∈J'` | term at `uu'`: `f(guu')\|(uu')⁻¹=(f(gu)\|u')\|(u'⁻¹u⁻¹)=f(gu)\|u⁻¹`, so constant on `uJ'`; on `J'u` instead: `f(gu'u)\|(u⁻¹u'⁻¹)` has no such reduction (`S₃` row below) | well defined as stated | none (R01 repaired) |
| §7.4 `tr f∈S_Γ(J,M)` (line 1205) | `u₀∈J`, substitution `u↦u₀u` | `(tr f)(gu₀)=Σ_{uJ'}f(gu₀u)\|u⁻¹`; `u'=u₀u` runs over a transversal of `J/J'` as `u` does; `=Σ_{u'J'}f(gu')\|(u'⁻¹u₀)=(Σ_{u'J'}f(gu')\|u'⁻¹)\|u₀=(tr f)(g)\|u₀`; left `Γ`-invariance is termwise | holds | none |
| §7.4 `tr∘res=[J:J']·id` (line 1205) | `f∈S_Γ(J,M)` | each term `f(gu)\|u⁻¹=(f(g)\|u)\|u⁻¹=f(g)`; `[J:J']` terms; holds for either coset space, as the Check says | holds | none |
| §7.4 `C₂` Check (line 1219) | `J=C₂`, `J'=1`, sign action on `ℤ` | cosets `{1},{u}`; `f(u)=f(1)\|u=−f(1)`; `f(1)\|1+f(u)\|u⁻¹=f(1)+(−f(1))(−1)=2f(1)=[J:J']f(1)`; untwisted `f(1)+f(u)=0` | as stated | none |
| §7.4 `S₃` coset Check (line 1220, new) | `S₃` composed right to left, `J'={1,(01)}`, trivial coefficients | `(012)(01)=(02)`, `(021)(01)=(12)`: left cosets `{1,(01)},{(012),(02)},{(021),(12)}`; `(01)(012)=(12)`, `(01)(021)=(02)`: right cosets `{1,(01)},{(012),(12)},{(021),(02)}`; `f` at level `J'` is constant on left cosets (values `a,b,c`); any transversal of `J/J'` gives `(tr f)(1)=a+b+c`; right transversal `{1,(012),(021)}` gives `a+b+c`, `{1,(12),(021)}` gives `a+c+c=a+2c`; at `a=b=0,c=1`: `1` vs `2` | all values as stated; the Check discriminates the two index sets | none |
| §7.4 Hecke operator on the carrier (line 1209, unchanged text, re-checked against the new trace) | `JηJ=⊔Jx_t`, `u∈J` | `f\|(ux_t)=(f\|u)\|x_t=f\|x_t` for `f∈S_Γ(J,M)` (representative independence); `(T_ηf)\|u=Σf\|(x_tu)` with `{x_tu}` another right-coset transversal (preservation); uses right cosets `Jx_t`, which is the correct index set for the slash action, independent of the trace's left cosets | consistent | none |
| §7.6 `trace` restricted to the central submodule (line 1255) | `m\|(uz)=ψ(z)σ(u⁻¹)m` | the restricted trace is §7.4's at level `JZ_f ⊃ J'Z_f`, summed over `JZ_f/J'Z_f`; `J'`-covariance argument identical | as stated | none |
| Line 41 Tau Ceti contract names | each at the pin | `IsSmoothVector` `SmoothVectors.lean:45`, `smoothVectors` `:49` (`Submodule ℝ X`, `⨅ n, domainPow S.generator n`), `dense_smoothVectors` `SmoothDensity.lean:127`; namespace `TauCeti.Semigroups`, real scalars and `t≥0` indexing as the README says | all exist in the named modules | none (R02 repaired) |
| `compactFinite_dense_locallyConvex` (Lean, unchanged) and §§0.1, 0.1a, 0.3, 0.4, 0.7, 2.2–2.7, 3.2, 3.5, 4.1, 4.3, 4.5, 5.1, 5.3–5.5, 6.1, 6.3, 6.6–6.8, 7.2/7.3 dictionary, §7.4 slash operator, Hecke/native product, `inverseActionHeckeEquiv`, §7.5 stabilizer transport | as in the previous report | carried forward from the previous report's table (its rows 1–20 and the rows it carried from the report before it); none of their text changed at this head | sound | none |

**Seeded sample.** Of the fifteen sampled targets, none falls in the five changed lines. §7.5 ("Finite stabilizers, base change and automorphic realization") is the nearest: it applies §7.4's evaluation equivalence with `c_i=t_i` and `J∩t_i⁻¹G(F)t_i=t_i⁻¹Γ_it_i`, which the diff does not touch, and it does not use the trace; its BCGP25 locator (Definition 5.7.2, pp.131–133) was verified in the earlier full review. The other sampled targets were verified at their locators in the earlier full review and are unchanged.

**Cross-roadmap citations resolved.** QuaternionicModularForms at #934 (read through the roadmaps tool): its line 506 states "level inclusion/trace maps" without a formula and its line 39 consumes §7.4's `inverseActionHeckeEquiv`, §7.5's `automorphicEquiv` and §7.6's carrier, so the corrected convention creates no conflict with the consumer. A search of the open heads and main for `tr∘res`, `Σ_{J'u` and `Σ_{uJ'` finds no other roadmap stating the trace, so this roadmap is the single owner of the formula. ModularForms Layer 2(a) on main for the Hecke-ring convolution product and Mathlib `IsHeckeTriple`/`HeckeRing` are as in the previous report (unchanged text).

**Principles.** The changed lines contain no route-specific shortcut (the trace is defined for an arbitrary group, subgroup, finite-index level pair and right module), no re-planned roadmap, no copied passage, no algorithm, no `set_option`, no sorry'd data, no edit outside the folder, and no process word or pull-request number in the README.

**Ownership against open pull requests** whose files the brief did not give me was not checked beyond QuaternionicModularForms, read through the roadmaps tool.

## Not verifiable

- Nothing new. The previous reports' items (Borel–Jacquet, Flath, Langlands's Corvallis article, Vogan 1984, Lapid, Clozel's Ann Arbor article, Kudla, Kostant) concern passages this head does not change and stand as listed there.

## Source issues

- none (the two getz misprints recorded in the earlier full review concern unchanged passages and are not repeated here).
