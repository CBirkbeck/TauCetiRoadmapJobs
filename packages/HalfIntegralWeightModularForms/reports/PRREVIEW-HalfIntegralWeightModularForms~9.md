# Review of HalfIntegralWeightModularForms (pull request #1721 at d7e7ece)

**Verdict:** accepted

No findings. Incremental re-review of the 92 lines changed since `b5d7563`.

## Previous findings

- R01 — repaired: `Suggested.lean` 297–305 states `thetaSeries_oddRank` under `## Layer 2`; the docstring sentence on a missing bridge is gone; README 877–881 names the headline; the module docstring lists it.
- R02 — repaired: `kroneckerSymNat` is deleted; `kohnenLift` (432) uses `(TauCeti.kroneckerSym D d : ℂ)`; README 1477–1478: “Its Kronecker symbol `(D/d)` is `TauCeti.kroneckerSym D d`.”; the `d = 0` sentence of the Check is gone.
- R03 — repaired: README 351: “`TauCeti.finiteDimensional_modularForm_finiteIndex` in `TauCeti/NumberTheory/ModularForms/SturmBound.lean`”.
- R04 — repaired: no “uncertified” and no “proof ownership” in the README; the four locators are kept (1490, 1546, 1592).
- R05 — repaired: both clauses are deleted; README 1488 ends “for odd squarefree `N` and trivial character.”; 1546 reads “The holomorphic coefficient formula and its proof (Waldspurger, Théorème 1 and Corollaire 2) belong here”.
- R06 — repaired: 1621 “is the holomorphic classical”; 1638–1639 “`JacobiForm k m` is the carrier on which §6.4 defines the index maps `U_d` and `V_l`”; 1061–1062 “`2s = u v²` with `u` a positive squarefree integer and `v ∈ ℚ_{>0}`”.

## Verified sound

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| 2.1–2.2 `thetaSeries_oddRank`, rank 1 | `L = √(2a)ℤ`: `Θ_L = θ(az)`; dual `ℤ/√(2a)`, level `4a`, `|L^∨/L| = 2a`; symbol `(4a/d) = (a/d)`; `j(γ', az)/j(γ, z) = (a/d)` | both sides `(a/d)` | none |
| `thetaSeries_oddRank`, README Checks in the Lean symbol | `A₃`: `kroneckerSym 8 3 = (2/3) = −1`; `diag(2,2,6)`: `kroneckerSym 48 5 = (3/5) = −1`; `A₁`, `E₇`: `kroneckerSym 4 d = 1`, `d` odd | agree with README 852–855 | none |
| `thetaSeries_oddRank`, sign of `d` and `Γ₁` | `2|L^∨/L| > 0`: the factor `[a < 0 ∧ b < 0]` is `1`, so `(m/−d) = (m/d)`; `γ` and `−γ` give one law; `d ≡ 1 (mod N)`: symbol `1` (2.1), the carrier's law on `Γ₁(N)` | consistent | none |
| `thetaSeries_oddRank`, conventions and junk | `ZLattice.thetaSeries`: exponent `πi‖v‖²τ`; `theta z = jacobiTheta(2z)`; `finrank = 2k+1 ≥ 1`; `level` is an `sInf`, positive for full integral `L`; `d` odd since `4 ∣ N` | docstring = pinned definitions | none |
| 5.3 `kohnenLift` with `TauCeti.kroneckerSym` | `d : ℕ` cast, `d ≥ 1`; `kroneckerSym 5 2 = χ₈(5) = −1`, `kroneckerSym 5 3 = −1`: `A(2) = 960 − 3840 = −2880 = 120τ(2)`, `A(3) = 59400 − 29160 = 30240 = 120τ(3)`; `D = 1`: `A(4) = −704 − 1792 + 1024 = −1472 = τ(4)` | holds | none |
| 3.4 `(2s/d) := (u/d)` | `s = 24`: `48 = 3·4²`, `u = 3`; `s = 2` (`θ`): `4 = 1·2²`, `u = 1`; `s = 512`: `1024 = 1·32²`, `u = 1`; `u` unique as the squarefree part of a positive rational | well defined | none |
| 6.1, 7.2 citations | SiegelModularForms head: §9.2 “Index-one Jacobi forms: the consumed carrier, `E_{k,1}` and `V_l`” (README 2733); `ModularForm.sturm_bound_finiteIndex` at `SturmBound.lean` 55 | resolve | none |

The rows for the untouched statements stand as in the previous review, of `b5d7563`.

- Library declarations opened at the pin (Tau Ceti): `kroneckerSym` (`KroneckerSymbol.lean` 84), `ZLattice.IsEven` (`Integral.lean` 75), `ZLattice.level` (`Level.lean` 113), `ZLattice.DiscriminantGroup` (`Determinant.lean` 90), `ZLattice.IsIntegral.det_eq_card_discriminantGroup` (`Determinant.lean` 210), `ZLattice.thetaSeries` (`ThetaSeries/Basic.lean` 102), `ModularForm.sturm_bound_finiteIndex` (`SturmBound.lean` 55), `TauCeti.finiteDimensional_modularForm_finiteIndex` (`SturmBound.lean` 98).
- Gate: every check `0`, `build=0 OK`. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`: 14 warnings, all `declaration uses sorry`; five `TauCeti.*` imports, each used. Elaborated type of `thetaSeries_oddRank` compared with README 857–881: no binder lost; it needs no `MeasurableSpace` or `BorelSpace` instance.
- One-tactic probe (`simp`, `rfl`, `decide`, `infer_instance`, `exact?`) on `thetaSeries_oddRank` and `kohnenLift`: none closes.
- Headlines: the one statable headline the previous review found absent is now stated; the module docstring's list of headlines not statable no longer includes odd-rank modularity.
- Citations: 0 cross-roadmap citations unresolved; the 19 name leads are 7 declarations of `Suggested.lean` and 12 LMFDB column and knowl names, none a library claim. Overlaps: none listed.
- Description: read against this head. It lists no headline by name and no import; “odd-rank Hecke–Schoeneberg on the theta-series roadmap's carrier” and “8 layers and 38 milestones” still hold; no sentence contradicted, no removal or renumbering to state.
- Sample: the sampled targets the diff touches are 2.2, 3.4, 5.3 and 7.2; their source locators are unchanged. No layer added, removed or reordered.

Overlap check: read SiegelModularForms, MaassForms, QSeriesPartitionsAndMockModularForms (open), ThetaSeries, ModularForms, NoncongruenceModularForms (main); Jacobi carrier in classical form and §6.4's operators: this roadmap (SiegelModularForms §9.2 consumes them); odd-rank theta modularity: this roadmap (ThetaSeries excludes it); `ν_η`: QSeriesPartitionsAndMockModularForms §5.2; Dedekind sums, eta closed forms, cusp orders: ModularForms §0.2; Kronecker symbol: Tau Ceti, now consumed.

Source independence: changed passages only; 6 changed passages read (README 877–881, 1061–1062, 1477–1478, 1546, 1638–1639 and the docstring of `thetaSeries_oddRank`), none takes wording from a source and no source was reopened; largest share Shimura 1973, about 15 of 58 locators, its text and contents page not readable; the arrangement was not compared again, since no layer changed.

## Not verifiable

- Shimura 1973, Serre–Stark 1977, Kohnen 1980, 1982 and 1985, Waldspurger 1981: paywalled; the unchanged locators of the sampled 2.2, 3.4 and 5.3 into them were not checked against the text.
- Niwa 1974, Cipra 1983, Shintani 1975, the Eichler–Zagier 1983 preprint, Koblitz, Apostol, Knopp, Ligozat, Cohen: not readable, as in the previous review; no changed passage depends on them.

## Source issues

- none

## For the human reviewers

- **Not tested.** Shimura 1973 has the largest share of locators (about 15 of 58) and could not be read; wording and arrangement were compared only with KohnenZagier1981 and SkoruppaZagier1988, in the previous review.
- **Licence.** The README's references cite Eichler–Zagier by an unpublished 1983 MPIM preprint's page numbers rather than the 1985 book; no copy of the preprint was found to confirm its numbering.
