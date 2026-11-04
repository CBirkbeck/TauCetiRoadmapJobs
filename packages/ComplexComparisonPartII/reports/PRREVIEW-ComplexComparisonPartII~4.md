# Review of ComplexComparisonPartII (pull request #848 at 06c89e2)

**Verdict:** needs changes

Incremental re-review of 18 changed lines since 7380744 (README only; `Suggested.lean` is byte-identical). The changed passages are the ownership-table row for algebraic differential operators (README:139), the one-direction supply sentence (README:162–163), the C5.1 ownership paragraph for `IsDifferentialOperator` (README:2393–2398) and the characteristic 2/3 Hasse-derivative Check (README:2437–2441). None of the three upward supplies, the layer label or the nonexistent API names changed, so the gate still fails and the three P2 findings of the previous review carry forward.

## R01 (P2) — Remove the upward GlobalHolomorphicFunctions supply

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:519`: “GlobalHolomorphicFunctions, preparatory Cauchy–Green and GH0.” Also lines 135, 1261 and 1657.

**Claim:** The compact-support Cauchy–Green operator and GH0's finite-rank Runge maps may be consumed from GlobalHolomorphicFunctions.

**Witness:** The dependency check at this head: `UPWARD: ComplexComparisonPartII (#28) -> GlobalHolomorphicFunctions (#181) at README lines [135, 519, 1261, 1657]`. GlobalHolomorphicFunctions is not on main; the merge order lists it after this roadmap.

**Repair:** Unchanged from the previous review: give the scalar Cauchy–Green kernel `1/(π(z−w))` and its finite-rank uniform approximation an owner that is earlier in the merge order (this roadmap or an eligible earlier supplier), and repoint lines 135, 519, 1261 and 1657. The test is the dependency check showing no line for GlobalHolomorphicFunctions. The board's merge order is the only alternative route (moving the three suppliers and this roadmap's consumer FormalConnectionsOpers); that is not an edit this review or the author can make, and the pull-request text's own merge-order block already asks for the opposite order from the board's.

## R02 (P2) — Remove the upward SmoothBundlesConnections supply

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:567`: “B1.5 supplies the native smooth proper-submersion trivializations to C5.2.” Also lines 553, 1369, 2737, 3340 and 3970.

**Claim:** Ehresmann trivializations (B1.5), the smooth complex bundle carrier (B2–B4) and the integral Chern class (B6.1–B6.4) are available from this supplier.

**Witness:** `UPWARD: ComplexComparisonPartII (#28) -> SmoothBundlesConnections (#197) at README lines [553, 567, 1369, 2737, 3340, 3970]`. SmoothBundlesConnections is not on main; the merge order lists it after this roadmap.

**Repair:** Unchanged: move the consumed leaves (proper-submersion trivialization with componentwise base and disconnected fibres; smooth complex bundle carrier; integral first Chern class with `∫_{P¹} c₁(O(1)) = 1`) to an earlier owner, and repoint the six lines. Test: the dependency check shows no SmoothBundlesConnections line, and the `ehresmannFibration` and `integralLineBundleChernClass` rows of the adversarial table still compute `(ℤ, 0, ℤ)` for `P¹ × S → S` and Chern numbers `1` and `0` for `O(1)` and the trivial line.

## R03 (P2) — Remove the upward topological support foundation

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:4088`: “use TopologicalSheafCohomology TS3.1–TS3.3's native”. Also lines 117, 267 and 4114 (the `*Needs:*` block beginning at 4110).

**Claim:** C6.1 builds its compact-support and lower-shriek comparisons on TopologicalSheafCohomology's `j_!`, c-soft resolutions and localization.

**Witness:** `UPWARD: ComplexComparisonPartII (#28) -> TopologicalSheafCohomology (#278) at README lines [4110]`, together with `not movable: ComplexComparisonPartII consumes TopologicalSheafCohomology (#278) and is consumed by FormalConnectionsOpers (#29)`. TopologicalSheafCohomology is not on main.

**Repair:** Unchanged: give the extension-by-zero, c-soft compact-support and comparison foundation an owner earlier than this roadmap and import it from there; verify on `(0,1) ↪ ℝ` that endpoint stalks of `j_!Λ` are `0`, `H¹_c((0,1), Λ) = Λ` and the interval boundary is `[1] − [0]`. Test: no TopologicalSheafCohomology line in the dependency check.

## R04 (P3) — The sibling still builds the principal parts this roadmap now claims to own alone

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:2396–2398`: “named in FormalConnectionsOpers F2.2 are these declarations, not a second construction”. Also README:139.

**Claim:** F2.2's order predicate, relation module, quotient, jet, universal bijection, composition maps and localization are C5.1's declarations.

**Witness:** At its open head (e2a605f), `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean:60`, `:83`, `:88` declare `IsDifferentialOperator`, `PrincipalParts` and `principalJet` with real bodies, and its README:51 and :81 say F2.2 supplies these to C5.1. This roadmap's `Suggested.lean` declares none of them.

**Repair:** Nothing further is actionable in this folder: the supply direction forces this roadmap to be the owner (FormalConnectionsOpers consumes C−1.1, C0.4 and C5.1–C5.2, so it cannot supply C5.1; no earlier roadmap, Mathlib or Tau Ceti has the object; the only other “principal parts” in open roadmaps are meromorphic principal parts or the analytic jets of PadicDifferentialEquationsAndRigidCohomology RD.0.21, which is later in the order). The sibling's review must replace its construction by an import of C5.1; until then the two heads disagree, and the human approver should treat the pair together. A smaller edit here would help: state the relation as a consumer contract (“FormalConnectionsOpers F2.2 consumes these”) rather than as a description of what the sibling's text says. The computed test is unchanged from the previous review: both texts give `P¹_{k[z]}(k[z]) = k[z][t]/(t²)`, jet `f ↦ f(z+t)`, and the Hasse operator `z^p ↦ 1` in characteristic `p`.

## R05 (P3) — Use a layer label accepted by the gate

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:694`: “## Layer C−1: Analytic local foundations”.

**Claim:** This is a valid layer heading.

**Witness:** The gate at this head: `layer-ids: line 694: layer id 'Layer C−1'; write `Layer N: title``.

**Repair:** Unchanged: rename the layer with an identifier the gate accepts (for example `Cminus1`) and update every `C−1.n` reference. Test: `layer-ids=0`.

## R06 (P3) — Remove API and Check names that `Suggested.lean` does not declare

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:1575`: “`AnalyticTwist.chartTransition` (the transition factor is `(Zⱼ/Zᵢ)ᵏ`)”; also `AnalyticTwist.zero` and `AnalyticTwist.degreeOneSections` at 1584–1585, and the same pattern throughout (including `IsDifferentialOperator` and `DifferentialOperatorAnalytification.*` in the changed C5.1 passage).

**Claim:** These backticked names are declarations of this roadmap.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/Suggested.lean` declares exactly `montelTheorem` (line 55), `schwartzFiniteness` (66) and `sheafSingularComparison` (81); three occurrences of the `AnalyticTwist.*` names remain at this head.

**Repair:** Unchanged: write the API bullets and Checks as prose with their hypotheses and computed values (`h⁰(P¹, O(1)) = 2`, `O(−1)` gives `0`, `O` gives `1`), keeping backticked names of this roadmap's own only for the three declarations the Lean file has.

## Previous findings

- R01 — not repaired: README:519 still reads “GlobalHolomorphicFunctions, preparatory Cauchy–Green and GH0”; the dependency check still reports the upward edge at lines 135, 519, 1261, 1657.
- R02 — not repaired: README:567 still reads “B1.5 supplies the native smooth proper-submersion trivializations to C5.2”; upward edge at lines 553, 567, 1369, 2737, 3340, 3970.
- R03 — not repaired: README:4088 still reads “use TopologicalSheafCohomology TS3.1–TS3.3's native”; upward edge at line 4110; `not movable` through FormalConnectionsOpers.
- R04 — partly repaired: README:2394–2398 now says “C5.1 is its single owner … are these declarations, not a second construction”, and README:162–163 now states the one-direction rule; the sibling's head still declares and claims to supply the same objects (R04 above, now P3).
- R05 — not repaired: README:694 still reads “## Layer C−1: Analytic local foundations”; gate `layer-ids=1`.
- R06 — not repaired: README:1575 still reads “`AnalyticTwist.chartTransition` (the transition factor is `(Zⱼ/Zᵢ)ᵏ`)”.

## Verified sound

**Scope of this pass.** The diff since 7380744 touches only `TauCetiRoadmap/ComplexComparisonPartII/README.md` (11 insertions, 7 deletions); `git diff --stat origin/main...HEAD` outside the folder is empty, and `Suggested.lean` is unchanged since the previous review. I reviewed the four changed passages in full, the lines that cite them (README:139, :162–163, :766, :2632, and the sibling's README:51, :81), the seeded target that falls in them (`IsDifferentialOperator`), and re-ran the gate, the dependency check and the elaboration.

**Gate and elaboration.** `lake env lean` on `Suggested.lean` from the worktree: exactly three `declaration uses sorry` warnings (lines 55, 66, 81), nothing else. The gate at this head: every text scanner zero (`set_option`, blobs, LaTeX, pull-request numbers, sorry'd data, sorry'd examples, imports, stray files, outside-folder, source-material), `layer-ids=1`, `depcheck=3`, FAIL. The dependency check with `--movable`, complete output:

```text
not movable: ComplexComparisonPartII consumes TopologicalSheafCohomology (#278) and is consumed by FormalConnectionsOpers (#29), which comes first: moving ComplexComparisonPartII after TopologicalSheafCohomology would put a supplier after a consumer, a cycle through ComplexComparisonPartII
UPWARD: ComplexComparisonPartII (#28) -> GlobalHolomorphicFunctions (#181) at README lines [135, 519, 1261, 1657]
UPWARD: ComplexComparisonPartII (#28) -> SmoothBundlesConnections (#197) at README lines [553, 567, 1369, 2737, 3340, 3970]
UPWARD: ComplexComparisonPartII (#28) -> TopologicalSheafCohomology (#278) at README lines [4110]
depcheck: 200 roadmaps, 1290 edges, 3 problem(s)
```

The five false positives of the previous run (AlgebraicCurves, AlgebraicVectorBundles, ComplexKahlerGeometry, DifferentialGeometry, PDE) no longer appear; the three remaining lines are genuine: none of the three suppliers is on main, and each is listed after this roadmap (merge order lines 182, 198, 279 against 29). All three are other authors' new-roadmap pull requests, and the pull-request text's merge-order block asks that they merge first; the board's order says otherwise, and the gate follows the board's order. No FormalConnectionsOpers citation in this README is a supply (README:138, :139, :766, :2397, :2632 all name it as a consumer), so there is no edge in that direction. No declared gap excuses any edge (no readable `design/plan.json`).

**Signatures.** The Lean file is unchanged, so the previous review's `#check @` comparison stands: the three elaborated types (worker's `signatures.md`, 0 dropped binders) carry finite dimension for Montel, the complete metrizable locally convex scalar tower for Schwartz, and the native `LocallyContractibleSpace` with arbitrary `AddCommGrpCat` coefficients for the sheaf/singular comparison; each equals its README statement. No new padding probe was needed; the previous review's nine one-tactic probes (`simp`, `rfl`, `infer_instance` on each) all failed, and nothing in the file changed.

**Seeded sample in the changed passages.** Only `IsDifferentialOperator` falls in the diff. Checked against the EGA IV₄ text in the sources cache (Publications IHÉS 32; the cache text, cited below as “EGA IV₄ line N”):

| Claim in the changed passage | Locator inspected | Result |
| --- | --- | --- |
| Order predicate: order 0 is `O`-linearity; order at most `m+1` means every commutator with a function has order at most `m` | (16.8.1) and (16.8.8) a)⇔b), EGA IV₄ lines 1388–1395 and 1489–1495, printed pp. 39 and 41 | Supported as written; no characteristic or finiteness hypothesis in the source. |
| “relation module spanned by iterated diagonal differences” | (16.8.8) a)⇔c), lines 1508–1516, printed p. 42: `D'` vanishes on the products of `n+1` elements `a_i⊗1 − 1⊗a_i` applied to `1⊗t` | Exactly the spanning set named; the quotient by `I^(m+1)` is (16.7.x) via (0, 20.4.4). |
| Universal bijection `Hom_A(P^m(M), N) ≅ Diff^m(M, N)` | (16.8.3.1), (16.8.4), lines 1425–1433, printed p. 40 | Supported, as sheaves over varying opens (the “restriction to opens” law). |
| Composition bound and the composition map `P^(m+n)(M) → P^m(P^n(M))` | (16.8.9), Lemma (16.8.9.1), map (16.8.9.2), lines 1526–1537, printed pp. 42–43 | Supported; uniqueness of the map is in the lemma. |
| Printed page range “pp. 39–44” | page markers at lines 1380 (p. 39) through 1568 (p. 44) | Correct. |

The other fourteen seeded targets are untouched by the diff; their verification rows in the previous report stand (holomorphicConnectionDictionary, artinDeRhamBetti, CurrentCalculus, realComplexCurrentComparison, analyticSetLocalFiniteMass, analytic cotangent/log differentials, complexAlgebraicTopology, topologicalCoefficientComparison, riemannExistence, artinComparison, artinComparisonCompactSupport, relativeArtinComparison, artinSmoothTrace, adicArtinComparison).

**Computed adversarial pass.** Rows for the changed statements, with values; the 143 rows of the previous report for untouched statements are carried forward by citation (PRREVIEW-ComplexComparisonPartII~3, “Computed adversarial pass: 143 rows”).

| Statement/interface | Instances tried | Values on the two sides; wrong-model control | Result; change |
| --- | --- | --- | --- |
| Hasse Check, `p = 2` (README:2439) | `f = z²` in `𝔽₂[z]`, jet in `𝔽₂[z][t]/(t³)` | `(z+t)² = z² + 2zt + t² = z² + t²`; coefficient of `t²` is `1`. Ordinary `(d/dz)²(z²) = 2 = 0`. Vector-field-generated model gives `0 ≠ 1` | Pass |
| Hasse Check, `p = 3`, `z³` | `f = z³` in `𝔽₃[z]` | `(z+t)³ = z³ + 3z²t + 3zt² + t³ = z³ + t³`; coefficient of `t³` is `1`; `(d/dz)³(z³) = 6 = 0` | Pass |
| Hasse Check, `p = 3`, `z⁴ ↦ 4z = z` | `f = z⁴` | coefficient of `t³` in `(z+t)⁴` is `C(4,3)·z = 4z = z` in `𝔽₃`; `(d/dz)³(z⁴) = 24z = 0`; in general `n(n−1)(n−2) ≡ 0 (mod 3)`, so `(d/dz)³ = 0` on all of `𝔽₃[z]` | Pass |
| Order of the Hasse operator `D^(p)` is exactly `p` | `p = 2, 3` | `[D^(k), z] = D^(k−1)` for all `k ≥ 1`, so `p` iterated commutators give `D^(0) = id ≠ 0`: order `≥ p`; the jet factorization through `P^p` gives order `≤ p` | Pass |
| Relation module / commutator criterion (16.8.8.2) at `m = 1` | `A = k[z]`, `a₀ = a₁ = z`, `s = 1`; `D = d/dz` and `D = (d/dz)²`, char 0 | Relation element `(z⊗1 − 1⊗z)²(1⊗1) ↦ t² = 0` in `A[t]/(t²)`; criterion `D(z²) − 2zD(z) + z²D(1)`: for `d/dz`, `2z − 2z + 0 = 0` (order ≤ 1); for `(d/dz)²`, `2 − 0 + 0 = 2 ≠ 0` (not order ≤ 1) | Pass |
| Jet and universal factorization of `d/dz` | `A = k[z]`, `m = 1` | `u : P¹ → A` with `u(1⊗1) = 0`, `u(t) = 1`; `u(jet z) = u(z⊗1 + t) = z·0 + 1 = 1 = dz/dz`; the sibling's Check (its README:197–198) computes the same two values | Pass; same object in both texts |
| One-direction supply sentence (README:162–163) | Each supplier named in the table, at the copy this review may read | Citations of this roadmap: GlobalHolomorphicFunctions head 0; SmoothBundlesConnections head 0; TopologicalSheafCohomology head 0; ResolutionOfSingularitiesCharacteristicZero open head 0 (roadmap search); RealAnalyticGeometry main 0; GeometricCurrents main 0; CharacteristicClasses main 0; ComplexKahlerGeometry main 1, at its README:472, naming this roadmap as the consumer of K4 (not a supply) | Pass for every supplier row; the FormalConnectionsOpers row is the consumer side, where the sibling's head states the opposite stage order for F2.2 (R04) |
| Ownership row README:139: “FormalConnectionsOpers … itself uses C−1.1, C0.4 and C5.1–C5.2” | Sibling README:51 at head e2a605f | Sibling cites “C−1.1, C0.3–C0.4 and C5.1–C5.2” | Pass (C0.3 additionally) |

**Library and ownership evidence.** Pinned-library searches for the all-order algebraic operator and principal-parts object were done in the previous review and the pins are unchanged (no `IsDifferentialOperator`/principal-parts carrier in Mathlib or Tau Ceti; divisor principal parts are a different object). Open-roadmap search at this run: `IsDifferentialOperator` occurs only in FormalConnectionsOpers (#1056) and this roadmap; “principal parts” elsewhere is the meromorphic notion (BelyiMaps, ConformalMapping, GlobalHolomorphicFunctions and others) or the analytic jet interpolation of PadicDifferentialEquationsAndRigidCohomology RD.0.21 (merge order line 93, after this roadmap). The sibling's `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean` at head e2a605f declares `IsDifferentialOperator` (line 60), `PrincipalParts` (83) and `principalJet` (88) in `namespace TauCetiRoadmap.FormalConnectionsOpers`; this roadmap's Lean file declares none of them, so no fully qualified name is declared twice. Ownership against open pull requests whose files this brief does not give was not checked beyond the roadmap search tool.

**Policy.** No copied passage, no executable algorithm, no `set_option`, no sorry'd data, no pull-request number or process word in the changed lines; no file outside the folder changed; no manifest or merge-order file touched by this review.

## Not verifiable

- Unchanged from the previous report for the untouched passages: SGA 4 and SGA 4½ (paywalled, uncertified), Dimca, Bochnak–Coste–Roy, Kato (image-only legal copy), Hironaka, Whitney, Katz–Oda, tom Dieck, Knutson, Hatcher §3.H. None of them is cited by the changed lines, so none affects this pass.
- The changed lines cite only EGA IV₄ §§16.7–16.8, which was read in the sources cache as recorded above.

## Source issues

- none
