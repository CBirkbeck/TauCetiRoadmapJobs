# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 103 lines changed since `7b5fe43`, which touch origin and method labels, the heading of the second statement of 3.4 and the References, and no stated result. The previous review had no finding; seven of its eight small corrections are repaired and the new locators (Rallis's two 1984 papers, Atobe–Gan, Gan–Qiu–Takeda §11.2) were read in the sources and are right. One small correction remains, none blocking: three origin citations still have no locator. Nothing is left for the human reviewers to decide.

## C01 — Three origin citations still give no locator

A reader cannot find the cited statement in a long paper from the author and year alone. Still cited with no theorem, section or page: Rallis (1982) for 2.2 (line 1027 and its References entry); Weil (1965) for 5.4 and 6.3, and now also for the theta integral of 5.1 (lines 1674, 1806, 2076); Kudla and Rallis (1994) for 6.1, 6.3a, 6.7 and 6.11 (lines 1923, 2599, 2847). Each would carry the section or theorem number that the general roadmaps already give for the same works where they cite them, as was done at this head for Rallis (1984), Braun (1941) and Atobe–Gan (2017).

## Previous findings

- The previous review had no finding (no R-numbered remark). Its small corrections at this head:
- C01 (GQT §11.1) — repaired: "adapted from Gan, Qiu and Takeda (2014), §11.2" in 1.5 and "§11.2 (the global theta lift): 1.1, 1.5" in the References.
- C02 (pointer of the label of 2.3) — repaired: "(2.5 (d); for the tensor pair of 2.2 the parameter is inverted)".
- C03 (labels "definitions and conventions") — repaired: 0.3, 0.4, 1.1, 1.3, 2.5 and 5.1 now say where the properties they prove come from; the Labels paragraph says so.
- C04 (credit for the route of 5.3) — repaired: "The route written here is not that of the formal proof: it evaluates the norm identity of 5.2"; References: "The routes written in 4.2, 5.2 and 5.3 are not that proof's".
- C05 (status of the criterion of 3.4) — repaired: "Prove also (the criterion for a definite pair, this roadmap's own formulation, not a statement of [FormalProof])".
- C06 (origin citations without locators) — partly repaired: Rallis (1984) twice, Braun (1941) and Atobe–Gan (2017) now have locators; Rallis (1982), Weil (1965) and Kudla–Rallis (1994) do not (C01 above).
- C07 (valuation in the label of 1.6) — repaired: "of valuation at least `b − v_𝔭(D)`".
- C08 (description) — repaired: the description now says that 3.4 states the linear-algebra step "with the definite-pair criterion as a second statement, and 1.6 adds the proof's integrality at one place `𝔭`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.6 method label, valuation | `ℚ(i)`, `𝔭 = (1 + i)`, `p = 2`, `Γ = {±1}`, `D = 2`, `b = 0` | weight `1/2 = 2^{−v_2(D)}·1`, `v_𝔭 = −2`; bound `b − v_𝔭(D) = −2`; old form `b − v_p(D) = −1` would fail | true as now written |
| 3.4 first statement and "Prove also" | `T = diag(1, 0)`; `T = θ_φ^*` | span `e₁`: scalar `1`, in range, `T^*` injective; span `e₂`: scalar `0`, excluded by "nonzero". `TT^* = θ_φ^*θ_φ` is the Rallis operator, `T^* = θ_φ` | consistent; last sentence right |
| 2.3 method label pointer | `n = d = 1`, split `w` | 2.5 (d): `c_w α`, no inversion (the formal proof's form); 2.2: `c_w α⁻¹` | pointer now right |
| 4.3 method label, added clause | `d = 2n`; `d = 2n + 1` | `s₀ = (d − n)/2`: `n/2`, the edge of convergence `Re s > n/2`, so "continued" is needed since `d₀ ≥ 2n` is allowed; `(n + 1)/2 > n/2` converges | consistent with the stated `d₀` |
| 1.4 origin: Rallis, formula (1-1) | Rallis1984Injectivity lines 266–295 | §1 opens on printed p. 146 (line 270); formula (1-1) named and proved on p. 147 (lines 287–295) | pp. 146–147 right |
| 2.4 origin: Rallis, Theorem I.2.2 | Rallis1984Howe lines 630, 646, 663 | theorem on printed p. 355, proof runs onto p. 356 | right |
| 6.6 origin: Rallis, Theorem I.1.1 and corollary | Rallis1984Howe lines 418, 435, 511, 520 | theorem on p. 345 (constant terms); corollary on p. 351 (cuspidality criterion) | right |
| 2.3 origin: Atobe–Gan | AtobeGan2017 lines 487–658 (arXiv v1) | §4 from p. 11; Theorem 4.1 p. 11, 4.3 p. 12, 4.5 p. 13, ending before p. 14's end | pp. 11–14 right |
| 1.1, 1.5 origin: GQT §11.2 | GQT lines 2503–2538 (read in the previous review) | global theta lift `θ_{n,r}(φ, f)` in §11.2 | right |
| 5.3 label and References | label of 5.2 vs route of 5.3 | route "5.2 in its second form"; formal proof has only the implication; References now credit only the factorisation and test vectors | consistent |

The rows for the untouched statements stand as in the previous review, of `7b5fe43`.

- Source locators checked against the text: 7 (Rallis1984Injectivity formula (1-1); Rallis1984Howe Theorems I.1.1, I.2.2 and the corollary; AtobeGan2017 Theorems 4.1, 4.3, 4.5).
- Formal-proof files opened: `ThetaParseval/HalfIndexLattices/TLiftK.lean` at the cited commit (`TLiftK` is a `Prop`, opens `GlobalTheory.ThK.Dbl`, imports `SchurStep` and `SplitStab`, as 4.3 cites).
- Cross-roadmap citations of the changed passages resolved at this head: MetaplecticAutomorphicForms §§1.1, 5.6, 5.6b; HermitianFormsAndLattices §§5.1, 5.5, 6.5; ThetaKernelsForUnitaryDualPairs §4.4a.
- Record: no layer, heading or Lean declaration added, removed or retitled by the change; 7 layers as at the merge base.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1401 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, no messages. The file declares nothing and is unchanged, so there was no signature to compare and no one-tactic probe to run.
- Files outside the named folders: none.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains and MetaplecticAutomorphicForms; the change adds no object of its own, and ownership stands as in the previous review (the Rallis inner product formula for an anisotropic target at ThetaKernelsForUnitaryDualPairs §6.13a and MetaplecticAutomorphicForms §6.13, cited here; the definite-pair objects owned here).

Source independence: changed passages only; 12 passages (the changed labels of 0.3, 0.4, 1.1, 1.3, 1.4, 2.3, 2.4, 2.5, 4.3, 5.1, 5.3, 6.6) compared with 3 cached sources (Rallis1984Injectivity, Rallis1984Howe, AtobeGan2017), none shared beyond bibliographic titles; largest share [FormalProof], 73 path locators; arrangement not compared, since no layer is added, removed or reordered.

Research link: the roadmap specialises to definite unitary groups the global theta correspondence of unitary pairs (Kudla 1994; Harris–Kudla–Sweet 1996), the Rallis inner product formula (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) and the first-term-identity method of Kudla–Rallis (1994), and supplies the family's theta-chain roadmaps; from the README summary and GQT §§1.7, 11.

## Not verifiable

- The clause added to the method label of 4.3, that the formal proof obtains the squared norm "by the doubling identity and the Siegel–Weil formula for the doubled pair": only the statement file `TLiftK.lean` was read, which has no proof; the clause was checked for consistency with the stated `d₀` only.
- Braun (1941), Satz V: no text in the sources cache (settled as uncertified); the number agrees with HermitianFormsAndLattices §6.5.
- Weil (1964), Weil (1965), Kudla (1994), Rallis (1982), Kudla–Rallis (1994), Li (1992), Labesse (2011): no text in the sources cache; cited in origin labels only, not checked.

## Source issues

- none

## For the human reviewers

- The two recorded decisions concern sections that leave a family roadmap. This folder removes no section or layer, so neither was needed here.
