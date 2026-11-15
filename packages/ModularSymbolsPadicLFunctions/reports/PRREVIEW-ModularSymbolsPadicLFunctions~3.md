# Review of ModularSymbolsPadicLFunctions (pull request #968 at 9640032)

**Verdict:** needs changes

Incremental re-review of the 44 lines changed since `7ddb09f`, plus the pull request's title and description. Two findings: the gate's build does not run at this head's pins (R01), and the previous review's R03 is not repaired (R02).

## R01 (P1) — The gate's targeted build fails: the branch is on pins that main has left

**Location:** `lake-manifest.json` and `lean-toolchain` at this head (unchanged from the merge base `b4ab05e`): Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`, `leanprover/lean4:v4.35.0-rc3`; `TauCetiRoadmap/ModularSymbolsPadicLFunctions/Suggested.lean:1`; `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:101` ("In the pinned Tau Ceti library (`a91d3aaf`)").

**Claim:** `lake build TauCetiRoadmap.ModularSymbolsPadicLFunctions.Suggested` succeeds with `sorry` as the only warning.

**Witness:** gate at `9640032`: `build=2 FAIL`, "build exited 1", `Suggested.lean:1:0: failed to open file … Mathlib.olean`. Main (`e6f6358`) pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, Lean `v4.36.0-rc2` since `a891cd19`, which adapted the roadmap files.

**Repair:** merge main into the branch, run the targeted build at main's pins and adapt any statement that no longer elaborates; then replace `a91d3aaf` at README line 101 by the new pin and re-check the library names of lines 101–119 there. Not tested here, and no elaboration error in the file itself was observed: the failure is a missing package tree for the old pins, not a Lean error. `Suggested.lean` is byte-identical to the file that built at `7ddb09f` on the same pins. At main's pins the declarations it uses are present in the sources (`TauCeti.binaryFormRep`, `TauCeti.cuspIntegral`, `HeckeRing.GL2.Newform` with `χ` and `toCuspForm`, `groupCohomology.resNatTrans`, `cocycles₁`, `H1π`, `qExpansion`), but the file was not elaborated there.

## R02 (P3) — The support point of the boundary Dirac distributions is still not pinned (previous R03)

**Location:** `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:2234–2239`: "Its values vanish at the cusps outside `Γ₀(p)·0` and are multiples of Dirac distributions at the `p`-integral cusps, and the existence of `Ψ` for this eigensystem is part of the cited proposition."

**Claim:** read with [BD] Lemma 5.1 and Proposition 5.2 (BD lines 1338–1353, `δ_{c,j} : f ↦ f^{(j)}(c)`), the value at a `p`-integral cusp `c` is a multiple of the Dirac distribution at the point `c`, and [BD] Proposition 5.9 proves existence for `E_{2,ℓ}`.

**Witness:** with §2.2's action, `δ_x|γ = (a + cx)^k δ_{(b+dx)/(a+cx)}`. `γ = (−32 3; −363 34) ∈ Γ₀(33)` fixes the cusp `1/11`, sends `x = 1/11` to `−67/715` and fixes `x = −1/11` with factor 1. BD line 621 uses `(a − cz)^k`; BD lines 1534–1535 leave the exceptional case to the reader.

**Repair:** replace the quoted sentence by: "Its values vanish at the cusps outside `Γ₀(p)·0`, and at a `p`-integral cusp `c` the value `Ψ(c)` is a multiple of the evaluation `f ↦ f(−c)` (the point is `−c` because the action of §2.2 has the factor `a + cz` where [BD] have `a − cz`); for this eigensystem `Ψ` is given by `Ψ(0) = δ₀` and `Ψ(1/ℓ) = −ℓ⁻¹·(f ↦ f(−1/ℓ))`, extended equivariantly, as [BD] Proposition 5.9 indicates for the exceptional case." In line 2241–2242 write "first derivatives at the points `−c`, `c` a `p`-integral cusp". Add the Check: "At `Γ₀(33)` the matrix `(−32 3; −363 34)` stabilises the cusp `1/11`; it moves the evaluation at `1/11` to the evaluation at `−67/715` and fixes the evaluation at `−1/11`, so the invariant Dirac distribution at the cusp `1/11` sits at `−1/11`." Tested on the instance: `det = −1088 + 1089 = 1`, `363 = 11·33`, `(−32/11 + 3)/(−33 + 34) = 1/11`, `(3 + 34/11)/(−32 − 33) = −67/715`, `(3 − 34/11)/(−32 + 33) = −1/11`.

## Previous findings

- R01 — repaired: lines 120–121, 304–310, 1573, 1603–1606 and 1768–1770 cite LocallyAnalyticDistributions §§0.0, 0.1, 0.3, 2.1, 2.3 by title in prose; none of the six names remains.
- R02 — repaired: lines 802–805 read "the cusp stabiliser of `r` in `Γ` … the predicate that a function `c` is a coboundary on a subgroup `H` … the parabolic predicate"; lines 1623–1626 say "the p-adic monoid `Σ₀(p)`".
- R03 — not repaired: lines 2234–2239 still read "multiples of Dirac distributions at the `p`-integral cusps, and the existence of `Ψ` for this eigensystem is part of the cited proposition"; no `−c` statement, no `Γ₀(33)` Check. Written again as R02.

## Verified sound

| Statement (changed or cited by the change) | Instances and values | Result |
|---|---|---|
| §2.2 Checks on the p-adic monoid `Σ₀(p)` (lines 1623–1626) | `diag(1,p)`: `a = 1` unit, `c = 0`, `det = p ≠ 0`, in; `diag(p,1)`: `a = p` non-unit, out; `(1 0; 1 1)`: `c = 1`, `p ∤ 1`, out; `(1 0; 0 0)`: `det = 0`, out | Pass |
| §2.2 `A[r]` as a product of closed-disc spaces of LocallyAnalyticDistributions §0.1 "at valuation `−log_p r`" (line 1573) | `r = 1`: one disc, valuation 0; `r = 1/p`: `p` discs `a + B(0, 1/p)`, valuation 1; `r = p^{1/2}`: one disc, valuation `−1/2` | Pass |
| §2.5 admissibility of eigensymbol values against LocallyAnalyticDistributions §2.1 (lines 1765–1770) | `p = 3, h = 1/2, n = 2`: `|λ|^{−2} = 3 = (r/(r/9))^{1/2}`; supplier criterion (d) `‖μ‖_{LA_n} = O(p^{rn})` at `s = p^{−n}` is `O(s^{−h})`; `h = 0`: bounded | Pass |
| Amice–Vélu–Višik threshold in the supplier contract (lines 310–311) | `N = 0`: `δ₀′` kills locally constant functions, is nonzero and has order 1, so uniqueness fails at `r = N + 1 = 1` and the bound `r < N + 1` is strict | Pass |
| §0.4 coboundary and parabolic predicates in prose (lines 802–805) | `Γ₀(11)`, `V = ℚ` trivial: coboundaries are 0 on every subgroup, so parabolic means vanishing on both cusp stabilisers; `H¹` has rank `2g + c − 1 = 3`, parabolic part `2g = 2` | Pass; agrees with the Check at lines 799–800 |
| §3.4 Dirac support (R02) | `γ = (−32 3; −363 34)`: `det = 1`, `γ(1/11) = 1/11`; evaluation at `1/11` moves to `−67/715`; evaluation at `−1/11` fixed, factor `(−32 + 33)^k = 1` | Fails as written; R02 |

The rows for untouched statements stand as in the previous review, of `7ddb09f`; `Suggested.lean` is unchanged since then (`git diff 7ddb09f 9640032` touches the README only).

- Gate rerun on this head: every text scanner 0, `depcheck=0`, `outside-folder=0`, `stray-files=0`; the build is the worker's `build=2` (R01). `lake env lean` on `Suggested.lean` could not run: the package tree for this head's pins is absent, so no signatures and no one-tactic probes this round.
- Dependency check output: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Cross-roadmap citations resolved for the changed passages: 6 at the open head of LocallyAnalyticDistributions (§0.0 line 892, §0.1 line 1049, §0.3 "Compact restriction to a smaller radius" line 1387, §2.1 "Distributions of order r (admissible distributions)" line 1697, §2.3 line 1806, §4.15 lines 3006 and 3023); 1 at the open head of EllipticCurveModularityPartII (its README line 61 consumes §§0.6–0.8 and 1.1, as line 2697–2698 here says). `EllipticModularityEffectiveComparisons` exists nowhere and is no longer named.
- Source locators read: BD lines 621, 1338–1353, 1526–1550 (for R02). Library declarations opened: 7, in the sources at main's pins only (R01).
- Pull request text: the title, the summary block and the prose were read against the head and the folder's change (a new folder of three files, 50 headings, 7 declarations). The twelve open suppliers of the README's table are the twelve of the `depends-on` block. No sentence is contradicted by the head; the "Validation" sentence has to be re-established after R01's merge.
- Remark, changed text: line 308 calls the supplier's Amice-transform criterion "Pollack–Stevens' `h`-admissibility"; in the supplier that is the equivalent criterion (d) of the same definition, so the citation holds.
- Remark, untouched text: NoncongruenceModularForms (on main) states a Betti realisation `S_k(Γ) ⊕ conjugate(S_k(Γ))` of its geometric parabolic motive; it is sheaf cohomology of the curve through ModularCurvesPartII §§14.1–14.4, not the group-cohomological isomorphism of §0.7.
- Outside-folder diff: empty.

Overlap check: read PadicFamilies, KatoEulerSystems, ModularIwasawaMainConjectures, EllipticCurvePeriodsAndModularParametrizations, ModularForms, NoncongruenceModularForms; Hom-side symbols, single-weight distribution modules, Drinfeld–Manin splitting and half-logarithms: this roadmap (the others cite it); homological `𝕄` and period map: ModularForms; families: PadicFamilies; the geometric parabolic motive of a noncongruence group: NoncongruenceModularForms.

Source independence: changed passages only; 6 changed passages compared with 1 source (BD) and with the supplier sections they now cite, none shared (the changes replace identifiers by section titles and prose); largest share [PS], 66 of about 153 locators by a pattern count; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- The elaboration of `Suggested.lean`, its `#check` signatures and the padding probes at this head: the package tree for the head's pins is absent on the worker, and at main's pins the object file of `TauCeti.NumberTheory.ModularForms.BinaryForms` is not built.
- [Pollack SS], [PS critical], [Kisin], [Rubin], [Shokurov] Theorem 4.3(a) and the one-dimensionality hypothesis of §3.4 (ii): as in the previous review; not reopened, since no changed passage cites them.

## Source issues

- **Gap** in BD at Proposition 5.9, arXiv p. 35: the proof treats the normal Eisenstein case and leaves the exceptional `E_{2,ℓ}` case to the reader; it should give the boundary symbol with values at `0` and `1/ℓ` explicitly; affects nothing.

## For the human reviewers

- none
