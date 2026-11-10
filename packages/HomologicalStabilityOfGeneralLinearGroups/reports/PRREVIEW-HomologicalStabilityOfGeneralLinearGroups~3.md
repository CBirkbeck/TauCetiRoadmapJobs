# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at ad6c8fc)

**Verdict:** needs changes

Incremental re-review of the 138 lines changed since 1fae7cd. Paths below are `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md` ("README") and `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/Suggested.lean`. Kal80 is van der Kallen, Invent. Math. 60 (1980), read on the GDZ scan and cited by printed page. GKRW25 is Galatius–Kupers–Randal-Williams, arXiv:2005.05620v3, cited by line of the extracted text.

One finding remains, in the route of 2.4. The citation it concerns is the one the previous report's R04 asked for: that report matched StableHomotopyKTheory 1.14 by its heading and not by its statement, so the error is the review's, and the repair below replaces it.

## R01 (P3) — 2.4's route cites StableHomotopyKTheory 1.14 for a statement it does not make, and names only injective stability for `m = 1`

**Location.** README lines 491–494: "for `m = 1` the injective stability of `K₁` (AlgebraicKTheory 4.1); for the second, the mapping telescope of the `BGL_n(R)⁺` … its homotopy groups are the colimits of the `π_m(BGL_n(R)⁺)` (StableHomotopyKTheory 1.14)". Also lines 68–69, 183, 496–498, 526.

**Claim.** (a) StableHomotopyKTheory 1.14 is about filtered colimits of categories; the spaces `BGL_n(R)⁺` are not classifying spaces of categories, and no section of StableHomotopyKTheory states that `π_m` commutes with a mapping telescope of spaces. (b) For `m = 1` the first claim includes surjectivity of `GL_n(R)/E_n(R) → GL_(n+1)(R)/E_(n+1)(R)` for `n ≥ e + 1`, which is surjective stability, not injective stability.

**Witness.** StableHomotopyKTheory README at its open head, line 284: "1.14 Homotopy groups commute with filtered colimits of categories", proved for "filtered categorical colimits"; a search of that README for "telescope" finds only spectra (lines 100–115) and group completion (4.17). AlgebraicKTheory 4.1, line 464: `surjective_stability` and `injective_stability` are separate statements.

**Repair.** Replace the telescope by a direct comparison with `BGL(R)⁺`, which uses only owned statements:

- Route for the second claim: "`H_i(E(R)) = colim_n H_i(E_n(R))` (SchemeKTheoryOperations §6.7, directed unions), so by 2.1 `H_i(E(R), E_n(R)) = 0` for `i ≤ k` when `n ≥ 2k + e − 1`; `BE_n(R)⁺ → BE(R)⁺` covers `BGL_n(R)⁺ → BGL(R)⁺` (StableHomotopyKTheory 3.27 and 3.31, `E(R)` being perfect and normal by 4.14), and the relative Hurewicz theorem (3.16) gives that `π_m(BGL_n(R)⁺) → π_m(BGL(R)⁺)` is onto for `n ≥ 2m + e − 1` and injective for `n ≥ 2m + e + 1`, `m ≥ 2`; then `K_m(R) ≅ π_m(BGL(R)⁺)` (GeneralAlgebraicKTheory 3.14)."
- For `m = 1`: "the surjective and injective stability of `K₁` (AlgebraicKTheory 4.1, `surjective_stability` for `n ≥ sdim + 1`, `injective_stability` for `n ≥ sdim + 2`)".
- Remove 1.14 from the Scope paragraph (lines 68–69), the StableHomotopyKTheory contract (line 183), 2.4's *Needs:* and Layer 2's Dependencies; add `surjective_stability` to 2.4's *Needs:*.

Tested on the README's own Check, `ℤ` and `m = 2` (`e = 1`): `H_i(E(ℤ), E_n(ℤ)) = 0` for `i ≤ 3` when `n ≥ 2·3 + 1 − 1 = 6`, so `π₂` is bijective for `n ≥ 6`, the value the Check states. For `m = 1`: onto needs `n ≥ e + 1 ≥ sdim + 1`, injective `n ≥ e + 3 ≥ sdim + 2`; both inside the ranges of AlgebraicKTheory 4.1.

## Previous findings

- R01 — repaired: lines 219–222, "`|P' ∪ Q'| = t + k + 1 − ε`: it is `G_n^(P(k),Q)` with `P(k) = P ∪ [t + 1, t + k + 1]` when `P = Q`, and … `P ∪ [t, t + k]` … otherwise"; Check at 250–254. Agrees with Kal80 Examples 3.5.1–3.5.4 (pp. 279–280).
- R02 — repaired: lines 540–543, "`Σρ` splits when `τ` is injective and `Σρ = τ(ρ) ⊕ ρ'` for a subsystem `ρ'`"; least degree in the API bullet (551–552); truncated system as a Check (566–570). Agrees with Kal80 5.5 (p. 290).
- R03 — repaired: `[ConnectedSpace (PrimeSpectrum R)]` is gone from `homology_stabilization_of_infinite_residueFields`; 2.3, Summary, Scope and "How to read the build" say "semilocal"; the product reduction is in the route (450–456), `ℚ × ℚ` and the zero ring are Checks (472–478).
- R04 — partly repaired: 2.4's *Needs:* and the contract list 1.14, 3.12, 3.16, 3.31 and AlgebraicKTheory 4.1; normality of `E_n(R)` is in the route (486–488). The 1.14 citation does not fit the statement cited: R01 above.
- R05 — repaired: line 35, "One other roadmap owns part of this subject, SchemeKTheoryOperations §6.7 (below)"; line 683, "No roadmap consumes a target of this one."

## Verified sound

- **Gate.** The worker's gate at ad6c8fc passed every check, build included; run again here without the build: every counter 0, `OK`. Dependency check: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`, no UPWARD and no CYCLE line. Nothing changes outside the roadmap folder.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exactly 6 `declaration uses sorry` warnings (lines 76, 98, 113, 130, 151, 166), nothing else.
- **Signature of the changed theorem.** `#check @homology_stabilization_of_infinite_residueFields` on a scratch copy: `(R : Type) [CommRing R] [Finite (MaximalSpectrum R)] [∀ 𝔪, Infinite (R ⧸ 𝔪.asIdeal)] (m n) (φ) (hφ : φ.hom.toLinearMap = LinearMap.id) (hmn : m ≤ n)`, conclusion `Function.Bijective (groupHomology.map (TauCeti.stabilizeGL R _) φ m)`. It equals 2.3 as now written; no binder lost. The other nine declarations are unchanged since the previous report.
- **Padding probe on the changed theorem.** `first | (simp; done) | rfl | infer_instance | trivial | exact?` does not close it.
- **Sources read for the changed passages** (5 locators).
  - Kal80 3.2 (p. 278), 3.4 and Examples 3.5.1–3.5.4 (pp. 279–280): the four stabilisers `G^(P(k),Q)`, `G^(P,Q(k))` with the index sets the README states; transitivity for `0 ≤ k ≤ d` (square) and `d + 1` (others).
  - Kal80 4.12 and its proof (p. 289): `BE_n⁺` is the universal cover at least for `n ≥ 2m + e − 1`; `m = 1` is referred to the classical `K₁` statement.
  - Kal80 5.2–5.5 (p. 290): `Σρ` splits when it is the sum of two subsystems one of which is isomorphic to `ρ` through `τ`; degree by induction; `τ_n = l(c_(n+1)) F_n`, which for a trivial action is `F_n`, as the new Check uses.
  - GKRW25 line 3333–3336: Theorem 9.4 is stated for connected semilocal rings with infinite residue fields, with the Milnor K-theory identification in degree `n`.
- **Citations resolved for the changed passages** (9).
  - AlgebraicKTheory 4.1 at its open head: `surjective_stability`, `injective_stability` (line 464) and "`Eₙ(R)` is normal in `GLₙ(R)` for `n ≥ s + 1`" (line 465); with `s = sdim + 1` this is the README's `n ≥ sdim + 2`.
  - StableHomotopyKTheory at its open head: 1.30 (465), 1.32 (494), 3.12 (1133, integral homology isomorphism), 3.16 (1188, relative Hurewicz with trivial `π₁`-action), 3.25–3.27 (1291–1321), 3.31 (1376, `BP⁺` is the universal cover), 4.14 (1650). 1.14 (284) exists and is the subject of R01.
  - MotivicStructuresInModuliOfCurves §3.4 (the one lead of the citation check): a board package, line 344 of the merge order, with "3.4 Homological stability and the stable cohomology" at its line 494; named in Scope only, as in the previous report.
- **Overlaps.** No open pull request changes this roadmap, drops an id it cites, or is cited at a revision's numbering.
- **Remarks, no change asked.** The pull request description still says "connected semilocal rings" for Layer 2 and lists StableHomotopyKTheory 1.30, 1.32, 3.25–3.27, 4.14 only; it understates the folder and is not part of it.

### Adversarial table

Rows marked "r2" are carried from the previous report (review at 1fae7cd), whose statements the diff leaves untouched.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 stabiliser count (changed) | `P = ∅`, `Q = {1}`, `n = 2`, `k = 0`; Example 3 shape `P = [1,t]`, `Q = [1,s]`, `s < t`; square `t = 0`, `k = 0` | `G = {(1 0; a u)}`, `g(1; c) = (1; a + uc)`, `Stab(e₁) = {(1 0; 0 u)}`, order 2 over `𝔽₃`; README count `1 + 0 + 1 − 1 = 1`. `P ∪ Q(k) = [1, t + k]`, size `t + k = t + k + 1 − ε`. `G^({1},∅)`, size 1 = `t + k + 1` | holds | — |
| 1.1 new Check, trivial groups | `G₂^([1,2],[1,2])`, `G₂^([1,2],{1})` | both fix `e₁, e₂`, so equal `1`; the stabiliser has order 2 over `𝔽₃` | holds | — |
| 1.1 transitivity | r2 | sphere ring: nothing claimed; field `n = 2`: claimed, stabiliser of order 2 over `𝔽₂` | holds | — |
| 1.2 `d¹`, parity; Check 4 | r2 | `GL₂(𝔽₂)`: `ℤ/2 → ℤ/2` onto; `GL₃(𝔽₂)`, `r = s = 1`: no claim; reduced `H₀ = ℤ` for `GL₁(𝔽₃)` | holds | — |
| 1.3 NS property, `affineGroup`, Suslin's spectral sequence | r2 | `𝔽₃`: `H₃(𝔖₃) = ℤ/6` vs `ℤ/2`; `ℚ`: `H₁ = ℚˣ` both sides; `(1 0; 1 1)(0;1) = (0;1)` | holds | — |
| 2.1 / 2.2 `E_n`, non-target | r2 | `𝔽₂`, `m = 1`: `0, ℤ/2, 0`; `ℤ`: `ℤ/12 → 0` onto at 2; `m = 4`: `n ≥ 8 < 9` | holds | — |
| 2.3 (changed: connectedness dropped) | `ℚ × ℚ`, `m = n = 1`; zero ring, `m = 0` and `m ≥ 1`; `ℤ_(2)`; `𝔽₂`; product of `l` factors, `m = n` | `ℚˣ × ℚˣ → ℚˣ × ℚˣ`, identity through two determinants; `ℤ → ℤ` identity, `0 → 0`; `ℤ_(2)`: image trivial in `ℤ/2`, not onto, excluded by the residue field; `ℤ/2 → 0`, excluded; Künneth terms `H_i ⊗ H_j` (`i + j = n`), `Tor(H_i, H_j)` (`i + j = n − 1`): all `i, j ≤ n`, each factor bijective | holds | — |
| 2.3 product decomposition | ring with `r` maximal ideals; zero ring | each component of `Spec` is closed and nonempty, so contains a closed point: at most `r` components, each clopen; `l = 0`, `Spec` empty, not `ConnectedSpace` (needs nonempty) | holds | — |
| 2.4 (route changed) | Hurewicz bookkeeping; `ℤ`, `m = 2`; `m = 1`; normality range | `H_i(E_(n+1), E_n) = 0` for `i ≤ k` ⇔ `n ≥ 2k + e − 1`; `n ≥ 6`; onto at `n ≥ e + 1` needs surjective stability (`n ≥ sdim + 1`), injective at `n ≥ e + 3` injective stability (`n ≥ sdim + 2`); `max(3, 2m + e − 1) ≥ e + 3 ≥ sdim + 2` for `m ≥ 2` | statement holds; route cites 1.14 for spaces and one of two `K₁` statements | R01 |
| 3.1 degree (changed) | truncated constant system; constant; `Rⁿ`; `F_n = 0`; zero system; degree `k` ⇒ `k + 1` | `τ₂ : A → 0` not injective, no degree, while `Rel_1^2 = H₀(GL₂; A) = A ≠ 0` at `n = 2 = 2m + sdim + k` for `k = 0`; `coker τ = 0`, degree 0; `Σρ = Re₁ ⊕ τ(Rⁿ)`, degree 1; `τ = 0`, no degree; zero system: `Σρ = 0` splits, `coker τ = 0` of degree `−1`, so degree 0, and induction | holds | — |
| 3.2, 3.3 / 3.4, `hφ` | r2 | `G' = G`: all `Rel = 0`; `𝔽₂`, `Rⁿ`: `Rel_1^2 = 𝔽₂`, `Rel_1^3 = 0`; `diag(g,1)(v;0) = (gv;0)` | holds | — |
| Convention 7 (changed witness) | `ℤ_(2)`; `ℚ⟦t⟧`; zero ring | residue field `𝔽₂`, finite; residue field `ℚ`, infinite; `MaximalSpectrum` empty, both hypotheses hold vacuously, spectrum empty so not connected | holds | — |
| Conventions 3, 4 | r2 | `2 + 5c = ±1` unsolvable; ranks `1, 3, 6`, `6 − 3 + 1 = 4` | holds | — |

## Not verifiable

- Nesterenko–Suslin 1989 (Proposition 1.10, Theorems 2.7, 3.25) and Guin 1989 (Théorème 2): not opened; confirmed only through GKRW25 lines 3331–3336, as in the previous report.
- The sentence at README 446–448 on what connectedness serves in GKRW25 Theorem 9.4 was checked against the statement of the theorem (line 3333–3336), not against Guin's proof.
- The seeded targets 1.2, 1.3, 2.1, 2.2, 3.2, 3.3 and 3.4 are untouched by the diff and were not read again against the sources; the previous report records them.

## Source issues

- **Misprint** in Kal80 at Theorem 4.11, printed p. 289: the source writes the target of the first stabilization as the homology of `GL` with index `m + 1`; it should be `GL` with index `n + 1`; affects nothing.
