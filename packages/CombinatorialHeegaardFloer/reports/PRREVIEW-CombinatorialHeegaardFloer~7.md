# Review of CombinatorialHeegaardFloer (pull request #2545 at 8be14e7)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 72 lines changed since `0750758` finds the six small corrections of the previous review repaired, each checked against the source or the roadmap it cites, and no repair introduces a false statement. The description now agrees with the head. One format note remains (the order of §5.4 and §5.5), not blocking, and one question about arrangement is left for the human reviewers.

## N01 — §5.4 needs §5.5 (the *Needs:* line of §5.4, line 1263), so Layer 5 is not in build order. As with `HF̂_st`, the twisted complex and its invariance under nice moves could stay in §5.4 and `HF̂T(Y)` on convenient diagrams move to §5.5.

## Previous findings

The previous review raised no finding (R); its small corrections and format note are accounted for here.

- C01 — repaired: §2.3 now says the book's grid-homology derivation "is circular as written" and its *Needs:* line reads "Torres (1953) for Torres's symmetry" (lines 348–351, 365); §2.3 no longer depends on §3.9.
- C02 — repaired: §3.8 states the lemma that a grid can be adapted to a surface, with bound `(ℓ − χ(F))/2` on every grid state (lines 679–689); §3.8 and §3.9 cite it, and §2.2 only for comparing two grids.
- C03 — repaired: §5.4 fixes a base generator `x`, connecting domains `D_y`, and lets a counted domain contribute the class of `D_y + D − D_z`, with independence of the choices stated (lines 1252–1260).
- C04 — repaired: §3.6 identifies the variables "in the unblocked complex" and takes the homology of the collapsed complex, citing Definition 8.2.4 (lines 610–613).
- C05 — repaired: Downstream consumers names "GeometricTopology, Part II, which GeometricTopology names in its scope" as owner of the adapter and the Mazur-satellite formulas (lines 1319–1321).
- C06 — repaired: the description now says GeometricTopology Layer 5.4.1 "supplies only the integral surface minimum, leaving the Thurston seminorm to its Part II".
- N01 — not repaired: "*Needs:* §5.3, §5.5 (convenient diagrams, prime decompositions)" still stands in §5.4; restated above as N01.

## Verified sound

OSSBOOK and OSS09 are the cached texts of the book and of arXiv:0912.0830v3.

| # | Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|---|
| 1 | §3.8 grid adapted to a surface: every grid state has collapsed `A ≤ (ℓ − χ(F))/2` | unknot with a disc; trefoil, genus one; Hopf link with an annulus; 2-unlink with two discs, plus a closed genus-2 component, plus a sphere | bound `0` vs states `A = 0, −1` on the `2 × 2` grid; `1` vs top `A = 1`; `1` vs top `h₁ + h₂ = 1`; `0`; closed component gives the weaker `1`; a sphere would give `−1 < 0`, so the hypothesis is needed | holds; OSSBOOK 2347, 2492, 2536–2564, 5370–5405, 8687–8720 | none |
| 2 | §3.8/§3.9 genus bounds resting on row 1 | knot `χ(F) = 1 − 2g`; connected `F` for `ℓ` components | `(1 − (1 − 2g))/2 = g`; `(ℓ − (2 − 2g − ℓ))/2 = g + ℓ − 1`; `χ(F_H) ≥ χ(F)` gives the inequality in the right direction | holds; OSSBOOK 5408–5412, 8673–8680 | none |
| 3 | §2.3 Torres's symmetry up to a unit; the book's route circular | trefoil; Hopf; Whitehead link | `t⁻² − t⁻¹ + 1 = t⁻²(t² − t + 1)`; `1 = 1`; `(t₁⁻¹ − 1)(t₂⁻¹ − 1) = t₁⁻¹t₂⁻¹(t₁ − 1)(t₂ − 1)`; book: 11.6.1 uses 11.5.8 (8636), which uses 11.5.3 (8566) | holds | none |
| 4 | §3.6 collapsed module as homology of the collapsed complex | `ℓ = 1`; `ℓ = 2` | no identification, `cGH⁻ = GH⁻`; `0 → GH⁻/(V₁ − V₂) → cGH⁻ → ker(V₁ − V₂) → 0`, so the complex-level statement is the correct one; Def 8.2.4 at OSSBOOK 5735 | holds | none |
| 5 | §5.4 twisted complex with the class of `D_y + D − D_z` | twice-pointed `S³` (`b = 2`); once-pointed `S³`; the wrong model "class zero for every domain" | group ring `𝔽₂[T, T⁻¹]`, `∂[x, n] = [y, n] + [y, n+1]`, multiplication by `1 + T`: kernel `0`, cokernel `𝔽`; `𝔽`; wrong model `∂ = 0`, homology of rank two | holds; OSS09 3290–3303, 3317–3340 | none |
| 6 | Downstream consumers: owner of the connected-sum adapter | GeometricTopology on main, scope lines 190–207 | both the adapter and the Mazur-satellite `τ` formulas are listed under Part II there | holds | none |

The rows for the untouched statements stand as in the previous review, of `0750758`.

- Source locators checked against the texts this round: OSSBOOK 11 (Definitions 3.4.1, 8.2.4; Propositions 3.4.9, 3.4.11, 7.2.1, 7.2.2, 11.5.8, 11.7.1; Theorems 11.5.3, 11.6.1; Remark 11.6.2), OSS09 4 (§9 construction, Proposition 9.1, Definition 9.2, Theorem 9.4). Of the seeded sample, §3.6 and §3.8 fall in the changed passages and were read; §3.2 is cited by them and its collapsed grading `(M_O − M_X)/2 − (n − ℓ)/2` matches the correction term of the proof of Proposition 11.7.1.
- Tau Ceti at the pin, opened: `TauCeti.GridDiagram.alexanderTwoℤ_eq_sum_southwestCount` (KnotTheory/Grid/Grading/Southwest.lean 167; knot normalization `n − 1`, its docstring identifies the summands with winding numbers), `TauCeti.HeegaardRegionSystem.IsDomainBetween` (LowDimTopology/Heegaard/Domain.lean 290), `TauCeti.HeegaardRegionSystem.periodicDomains` (same file 348; includes zero multiplicity at every basepoint).
- Cross-roadmap citations resolved: GeometricTopology on main (scope, Part II paragraph; Layer 5.4.1); HeegaardFloer's twisted comparison at its open head is a consumer of §5.4, not a second owner.
- Automatic checks: all pass on this head. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. Nothing outside the folder changes.
- Elaboration: `Suggested.lean` gives six `sorry` warnings and nothing else; the file is unchanged since `0750758`, so the signatures and the one-tactic probe of the previous review stand.
- Description against the head: 43 Checks counted; 175 distinct Tau Ceti names in the contract (description: about 170); suppliers GeometricTopology §§4.1–4.4, 4.7.1, 5.1, 6.2, 8.2, MorseTheory Layers 1–2, KhovanovHomology K7 as stated; imports drop one module and gain four as stated; the two removed and four added statements and the two renamings match the Lean diff; the §3.8 lemma, the Torres attribution and the §5.4 twisted complex are described as the head has them.
- Overlap check: read GeometricTopology (main) and HeegaardFloer (open head) this round for the objects of the changed passages; RibbonKnots, FourManifolds, KhovanovHomology as read for `0750758`. The adapted-grid lemma, the collapsed complex and the combinatorial twisted complex: this roadmap only; the holomorphic twisted comparison: HeegaardFloer §8.1; the connected-sum adapter: GeometricTopology, Part II. Nothing has two owners.

Source independence: changed passages only; 4 passages (§2.3, §3.6, §3.8, §5.4) compared with 2 sources (OSSBOOK, OSS09), none shared beyond statement-forced phrases; largest share OSSBOOK, about 90 of about 180 locators; no layer added, removed or reordered, so the contents comparison stands as for `0750758`: independent.

Research link: Layer 3 proves combinatorially the invariance and `τ` bounds of Manolescu–Ozsváth–Szabó–Thurston (2007) and Sarkar (2011), reproving Kronheimer–Mrowka's Milnor-conjecture theorem (1993); Layer 4 is Némethi's lattice cohomology (2008), identified with `HF⁻` by Zemke (2021); Layer 5 is Ozsváth–Stipsicz–Szabó's stable `HF̂` (2009). Rests on the README and the sources read.

## Not verifiable

- Torres, *On the Alexander polynomial*, Ann. of Math. 57 (1953): behind a paywall, not opened; now the only route §2.3 names for the symmetry. The book attributes the theorem to it (OSSBOOK line 8398).
- arXiv:1301.0480 (sign assignments, §5.4): not opened; the sentence citing it did not change.

## Source issues

- **Gap** in OSSBOOK at Theorem 11.5.3, printed page 200: the source says Torres's symmetry follows from Corollary 11.4.3 and Theorem 11.6.1, but its proof of 11.6.1 uses 11.5.3 through Proposition 11.5.8; it should derive it from the unsymmetrized `det M(G)` identity and Corollary 11.4.3; affects the proof.

## For the human reviewers

- Arrangement: Layer 3's thirteen sections cover the scope of OSSBOOK Chapters 3–15 in nearly the book's order (exceptions: §3.9 before §3.10, §3.12 before §3.13). Judged below a finding: the map is not one to one and §§3.1–3.7 are forced by their *Needs:* lines.
- Licence: OSSBOOK was read from the authors' version on a Princeton author page; the README cites the AMS monograph "numbered as in the authors' version" (References). Whether that numbering agrees with the printed volume was not checked.
