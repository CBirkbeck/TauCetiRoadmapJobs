# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at 8f2fbf2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** Accepted. All three findings of the previous round are repaired. The segment rules of 4.2 and 6.5 are now uncentred, and they agree with the central-character and determinant properties: I checked this on the Steinberg representation and against Henniart 2002 §§2.3, 2.6–2.7. `Suggested.lean` now states the `GL_n` Satake bound against Mathlib's Hecke coset ring, and the statement is correct and non-vacuous. 6.2 now cites EndoscopicTransferAndUnitaryTraceComparison §10.29 for `p`-adic fields. There is no new finding. There are four small corrections and one format note, none of them blocking:
- Downstream consumers names sections that do not cite this roadmap.
- The geometric reciprocity map of 6.5 is attributed to ClassFieldTheory layer 9 as it stands, but that map is arithmetic.
- Three cited results still have no source or locator.
- A validation sentence in the description is out of date.

Two things are left for the human reviewers: the family's premise, and the targets that have no published source.

## C01 — Downstream consumers names four sections that do not cite this roadmap, two of them on main

The second paragraph of Downstream consumers (line 738) says three things that the cited roadmaps do not bear out:
- "AutomorphicSpectralTheory §3.6c consumes 5.1";
- LevelOneAutomorphicFormsForClassicalGroups "consumes 6.6 in its Conventions";
- EndoscopicTransferAndUnitaryTraceComparison §10.26 uses *langlands-classification* "unconditionally for `GL_n` through 1.1".

The first paragraph (line 736) has the same problem: it says that BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35 (b)–(c) "consumes 4.1". A reader who follows these pointers finds no citation. Two of the four roadmaps are on main, so they cannot consume an open roadmap at all.

What each section actually does:
- AutomorphicSpectralTheory §3.6c on main assumes "RH in the number-field case" and cites only AutomorphicLFunctionsAndLocalFactors and its own §3.6b.
- LevelOneAutomorphicFormsForClassicalGroups, at its open head, states its own hypothesis in its Conventions: every zero of `Λ(s, π × π′)` for algebraic `π, π′` has real part `1/2`.
- EndoscopicTransferAndUnitaryTraceComparison §10.26 on main takes the uniqueness of Langlands data from SmoothRepresentationsOfLocalGroups §§SR.3.3, SR.5.2 and SR.5.3.
- BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35 at its head goes through EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.26 and SR. That roadmap cites this one only in §§10.29a, 10.30, 10.34, 14.2 and 15.1.

The fix is to say "uses the same hypothesis as 5.1 (6.6)" or "would be unconditional for `GL_n` by 1.1" where that is meant, or to drop these four clauses.

## C02 — 6.5 attributes the geometric reciprocity map to ClassFieldTheory layer 9, whose map is arithmetic

6.5 (line 558) defines `Art_F` as "the reciprocity map of ClassFieldTheory layer 9 sending uniformisers to geometric Frobenius". Layer 9's `localWeilArtinEquiv` is in the arithmetic normalisation: its degree map "fixes the arithmetic normalization", and its own Check gives a uniformiser Weil degree `1` (ClassFieldTheory, Layer 9.1).

An implementer who takes `Art_F` from layer 9 as written gets the wrong map. They get `r_1(ν) = ω⁻¹`, so the Steinberg Check at lines 613–616 gives `r_2(St) = ω^{1/2} ⊗ Sp(2)`, which has determinant `ω²`, and no family satisfies property 3.

The clause "sending uniformisers to geometric Frobenius" shows what is intended. Writing "`Art_F`, the reciprocity map of ClassFieldTheory layer 9 composed with inversion, so that uniformisers go to geometric Frobenius" would make the sentence true. That is how EndoscopicTransferAndUnitaryTraceComparison's Layer 10 conventions define `Art_geo`.

## C03 — Three cited results still have no source or locator

These are the parts of the previous round's request for locators that remain open:
- **3.2, lines 177–182.** The Macdonald formula for an arbitrary residue cardinality cites no source.
- **4.1 (i), lines 345–346.** Only the `Z(𝔪)` form is located. Zelevinsky's Theorem 6.1 (b)–(c) gives `Z(𝔪)` only, but 6.5's route (line 598) uses the `L(𝔪′)` form. A citation would close this. So would a derivation from SmoothRepresentationsOfLocalGroups §SR.3.3 *langlands-classification*, which 1.1 makes unconditional and which uses only (ii) and (v) of 4.1.
- **2.1, lines 104–106.** Morris 1993 and Bushnell–Kutzko 1998 are cited by title alone, with no theorem or section number.

## C04 — The description's validation sentence is out of date

The validation paragraph of the description says that the automatic checks all pass except two. One is the check for changes outside the roadmap folder, which it says lists only the three files of the family index. The other is the check that the roadmap has a place in the merge order, which it says "reports that this roadmap is not yet placed in the merge order". At this head every automatic check passes, and the merge order places the roadmap after its suppliers, so a reader is told of two open problems that do not exist. Saying "all automatic checks pass" would be accurate.

## N01 — TeX escapes in code spans

`1_{\{1\}}` (line 172) and `1_{\{ℓ = m\}}` (line 298) use TeX brace escapes inside code spans. `1_{1}` and `1_{ℓ = m}` would read correctly.

## Earlier findings

- **R01 (segment rule): repaired.**
  - The Conventions (line 13) fix `Sp(b)` as SR's uncentred block.
  - 4.2 (line 362) now has `Δ_i = [rec(ρ_i)ν^{1−n_i}, …, rec(ρ_i)]`, and 6.5 (line 565) has `Δ_i = [ρ_i, ρ_iν, …, ρ_iν^{b_i−1}]`.
  - The Checks at lines 377–379 and 613–616 compute the central character `|·|⁻¹ = rec_1(ω)` and `det r_2(St) = 1`.
  - Both rules agree with Henniart 2002 §§2.3, 2.6–2.7, with the transport `π ↦ (rec⁻¹(π))^∨`, and with EndoscopicTransferAndUnitaryTraceComparison §10.26's Check `St₂ ↦ ω^{−1/2}Sp(2)`.
- **R02 (GL_n Satake bound in Lean): repaired.** `satake_bound_gl`, with `integralGL`, `heckeT` and `sphericalFunction`, is stated. The docstring now names Tau Ceti's Hecke ring.
- **R03 (6.2 against EndoscopicTransferAndUnitaryTraceComparison §10.29): repaired.** See 6.2, lines 464–467, and Scope, line 744.
- **C01: repaired.** Line 598 cites "(4.1 (i))", and 4.1 is added to the *Needs:* line (line 600) and to Dependencies (line 635).
- **C02: repaired.** Line 736 names RowTowerAndRallisIdentities §5.1 and ThetaLiftsForDefiniteUnitaryGroups §3.3.
- **C03: repaired.** See line 96 and the supplier contract at line 770.
- **C04: partly repaired.** 1.1, 4.1, 6.4, 6.5 and 7.1 now carry locators. What remains is C03 above.
- **C05: repaired.** 6.4 (line 533) and 6.3 (line 492) now hold over every nonarchimedean `F`.
- **C06: repaired.** Line 658 now reads "`|·|_E^{w}`, `w ∈ ℂ`".
- **N01: unchanged.** The guide (line 9) states that Layer 1 uses Layer 4. This is the author's choice, so it is not raised again.
- **N02: repaired.** See lines 364–366 and 538.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 | `n = 1`; `n = 2`: `χ₁ × χ₂` unitary, `St` | unitary `L([ρν^a…ρν^b])` ⇔ `a + b = 0`; centred segments on one line nest, so unlinked; Zelevinsky 4.2, 9.7 (a) | holds | none |
| 2.1 (b), (d) | `GL₂`, vertex, `P = B` | `JzJ = J⁺zJ`, so `T_z v = c·π(z)∫_{z⁻¹J⁺z}π(n)v`; `sω = diag(ϖ, 1)`; `T_s² = (q−1)T_s + q` | holds | none |
| 2.1 (a) route | `P ∩ gG_{x,0+}g⁻¹`, `g = nk` | `= P ∩ G_{nx,0+}`, image `M_{nx,0+}`; "⇐" via (b) at `y` | holds; arbitrary `x` not checkable | none |
| 3.1 (b) | noncommutative `ℋ`, `g ≠ 1` | averaging over `K`: `Σ_c h(c)ω(gc) = θ(1_D * h)/deg D = θ(h)ω(g)` | holds | none |
| 3.1 Checks | trivial rep; `G = ℤ`, `ρ(m) = z^m` | `θ(1_S) = #S`; `|θ(1_{1})| = |z| > 1 = ‖1_{1}‖₁` | holds | none |
| 3.2 | `n = 2`: `λ = (1,0)`, `(2,0) + (1,1)`; `λ = (1^r)` | `Q^{1/2}(X₁+X₂)`; `Q(X₁²+X₂²) + (Q−1)X₁X₂ + X₁X₂ = Qh₂`; `⟨1^r, ρ⟩ = r(n−r)/2` | holds | C03 |
| 3.3 (b), (c) | `n = 4, q = 2`; `n = 2, q = 3`; trivial `α` | `1, 90, 6192, 403200`; `12, 108, 972, 8748 = (q+1)q^{2m−1}`; denominators give `∏(1 − q^{2j}X)` | holds | none |
| 3.4 (i) route | `n = 2, m = 1, 2`; trivial `α` | `#S₁ = Q + 1 = h₁(Q, 1)`; `e_2(α_triv) = 8.75 = Q⁻²[4 2]_Q` at `Q = 2` | holds | none |
| 3.4 Check, `GL₄` | `Q = 2, 3, 4, 5` | `θ(T₂) = 48.5, 279.3, 1088.3, 3225.2` against `#T₂ = 35, 130, 357, 806` | holds | none |
| 3.4 (ii) route | zero `X₀` of `D_α` in the disc | numerator zeros have `|X| = q^{−j} ≥ q^{−(n−1)} > q^{−2(n−1)}` | holds | none |
| `satake_bound_gl` (headline 3.4 (i)) | `n = 0, 1`; `θ` = degree; `r = 0` | `n = 1`: bounded `α^m` on `ℤ` gives `|α| = 1`; degree map gives trivial `α`, equality; `T_0 = [K₀]` proved | non-vacuous, matches README | none |
| 4.1 | Zelevinsky 3.1, 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 | as cited; (vi) `|j| ≤ 1` forces unlinked; 6.1 gives only `Z(𝔪)` | holds | C03 |
| 4.2 segment rule | `n = 2`, `ρ = 1` | `rec(Sp(2)) = ν^{−1/2}St`, central character `|·|⁻¹ = rec₁(ω)` | holds | none |
| 4.2 Check (non-determination) | swap twist orbits `σ, σ′` | `P(σ^∨) = P(σ ⊗ ω_σ⁻¹) = σ′^∨`; central characters `ω_σχ² = ω_{σ′}χ²` | holds | none |
| 6.1 | `St` of `GL₂`; `α = β = 1` | `Σ q^{−m(σ+1)}` finite iff `σ > −1`; `Σ(m+1)²q^{−mσ}` diverges at `σ = 0` | holds | none |
| 6.2 | `n = 1`, `τ = χ₁ × χ₂`; `|·|^{1/2} × St` | Tate product; `L(s+1, 1)` against `L(s+1, 1)L(s, 1)` | holds | none |
| 6.3 (headline) | `St`; trivial rep of `GL₂`; `L(s, St × St)` | `α = 0`; not generic; `ζ(s)ζ(s+1)` has a pole at `0` | holds | none |
| 6.4 (headline) | Jacquet–Liu Conj. 1.1, Thm 1.3; Henniart 2002 §§1.4, 1.9 | generic `τ` of ranks `≤ ⌊n/2⌋`, any nonarchimedean `F`; supercuspidal `τ` via 6.2 | holds | none |
| 6.5 (headline) | `St` under properties 1, 3, 4 | `r₂(St) = ω^{−1/2}Sp(2)`, determinant `1 = r₁(ω_St)`; literal arithmetic `Art_F` gives `ω²` | holds | C02 |
| 6.5 transport | rank one; `St` | `π^{−1}∘Art_arith⁻¹ = π∘Art_geo⁻¹`; `(rec⁻¹(St))^∨ = ω^{−1/2}Sp(2)` | consistent | none |
| 5.1, 6.6 | twist by `|det|^{−1/4}` | zeros shift by `1/4`, symmetric about `Re s = 3/4` | holds | none |
| 7.1 | `n = 1, 2`; sign of shift | `{(n+1)/2 − i}` symmetric; `n = 1` gives `L^S_E(z, μ̃χ)` | holds | none |
| 7.2 (headline) | trivial rep of `GL_n`; `U(2)` inert | abscissa `(n−1)/2 + 1 = (n+1)/2`; `(q_v, q_v⁻¹)` exceeds `q_v^{1/2}` | holds | none |
| Downstream consumers | AST §3.6c, LevelOne Conventions, ET §10.26, BC §10.35 | none cites this roadmap; AST and ET are on main | false pointers | C01 |

- Source locators checked against the text: 18. These are Zelevinsky 3.1, 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 (a), (b); Henniart 2002 §§1.3, 1.4, 1.9 (Corollaire, Proposition), 2.3, 2.6, 2.7; Jacquet–Liu Conj. 1.1, Thm 1.3; Chai Thm 1.1.
- Library declarations opened at the pins:
  - Mathlib: `HeckeRing/Defs.lean` 75, 157, 183, 189; `LocalField/Basic.lean` 46.
  - Tau Ceti: `HeckeRing/Basic.lean` 902, 969; `Multiplication.lean` 97, 109; `One.lean` 87; `Associativity.lean` 477, 484; `HeckeRing/GLn/Basic.lean`; `ClassFieldTheory/Local/ArtinMap.lean` 114; `LFunctions/Data/Basic.lean` 82; `ContCohomology/SmoothDiscrete/Basic.lean` 259.
- Cross-roadmap citations resolved:
  - On main: SR §SR.5.2 (*segment-representations*, *wd-parameter-operations*, *classical-llc-normalization*, *essentially-aig*, *modular-generic-segments*) and the SR.3.3 targets; AL §§AL.2.4.1, AL.3.1.1–AL.3.6.2, AL.4.1.1–2; ET §§10.26, 10.29 and the Layer 10 conventions; ClassFieldTheory Layer 9; ReductiveGroups 7c–7e; RG2 §RG2.3.6 and RG2.4.
  - At open heads: RHSC §§9.2, 9.3, 9.5; HFL §§2.1, 4.2; BC §§10.29a, 10.30, 10.34, 10.35, 15.1 and its supplier contract; TK supplier contract; TL §§3.3, 5.2; RT §5.1; FRG §6.0; LevelOne Conventions.
- Automatic checks: all passed at this head. The dependency check, rerun, gives `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. Nothing changes outside the folder except the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning on `satake_bound_gl`. `#check @` of the four declarations shows every binder present and matching README 3.4 (i); nothing changed. A proved probe `heckeT n ϖ hϖ 0 = [K₀ 1 K₀]` compiles.
- One-tactic probe, decided by reading: `satake_bound_gl` needs the Satake/Macdonald input and the bound of 3.1, so it is not padding. The three definitions are the minimal carriers.
- Exact rational arithmetic was used for the 3.3 coefficients (`n = 4, q = 2`; `n = 2, q = 3`), the `GL₄` example of 3.4 at `Q = 2`–`5`, and `e₂` of the trivial parameter.
- Ownership against open pull requests: the objects were searched over all open heads and main with `roadmaps grep`, and the family roadmaps were read with `roadmaps show`.

Overlap check: read BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, ThetaLiftsForDefiniteUnitaryGroups and CongruenceModulesOfThetaLifts (open); SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII and EndoscopicTransferAndUnitaryTraceComparison (main); and SpecialFunctionsGroupModels (open, found by object search).
- The open family roadmaps consume 2.1, 3.3–3.4, 4.1, 6.3–6.5 and 7.1–7.2 and own none of them. CongruenceModulesOfThetaLifts cites Moy–Prasad and SR, not 2.1.
- `rec` and segments are owned by SR, and coarse local transfer by AutomorphicLFunctionsAndLocalFactorsPartII §10.2; both are cited.
- For `F/ℚ_p`, the pair-factor products are owned by EndoscopicTransferAndUnitaryTraceComparison §10.29, which is cited. 6.2 keeps positive characteristic.
- SpecialFunctionsGroupModels's `bounded_sphericalFunction_iff_character` is the `L¹` theorem for second-countable locally compact groups. 3.1 (b) is the finitely supported, locally profinite form with the sharper bound `|ω_θ| ≤ 1`, used as a step of 3.4. There is no shared target.

Source independence: 13 passages compared with 4 sources (Zelevinsky 1980, Henniart 2002, Jacquet–Liu 2018, Chai 2019). None shares wording beyond what the mathematics forces; the longest run is four words, "irreducible generic representations of", at JacquetLiu2018 line 20. 2.1, 3.1, 3.3, 3.4 and 7.1 could not be compared, because they cite no source or one that cannot be read. The largest share is Zelevinsky1980, 10 of 28 locators. Contents compared with Zelevinsky1980 §§1–11: independent. All of its results sit in 4.1 and in 1.1's route.

Research link: 6.4 and 6.5 are Henniart's local converse theorem and his characterisation of the local Langlands correspondence by pair `ε`-factors (Henniart 1993, recalled in Henniart 2002 §§1.4, 1.9), with the half range of Jacquet–Liu 2018 and Chai 2019. 4.1 is Zelevinsky 1980, and 6.3 is the exponent bound for unitary generic representations. This rests on README 4.1 and 6.3–6.5 and on the texts I read.

## Not verifiable

- JPSS 1983 (6.1, 6.2, 6.3, 6.5): only on JSTOR, and the sources service found no legal copy.
- Henniart 1993 (6.4, 6.5): resolves only to a paywalled Springer page, and a search by title found no legal copy. I checked it as Henniart 2002 §§1.4 and 1.9 recalls it.
- Moy–Prasad 1996 and Morris 1993 (2.1): resolve only to paywalled Springer pages.
- Bushnell–Kutzko 1998 (2.1): the Wiley DOI landing page refused the request (HTTP 403).
- Harris–Kudla–Sweet 1996 (7.1): the AMS landing page is on a host the service does not classify.
- Harris–Taylor 2001 and Henniart 2000 (6.5): cited without a locator for an input theorem that is not a target here. Not fetched.

## Source issues

- **Misprint** in Henniart2002 at §1.1, p. 588: the source writes the conjectural bijections for `n ≥ 2` as `σ ↦ π_1(σ)` from `G_0(n)` onto `A_0(n)`; it should be `σ ↦ π⁰_n(σ)`, as in §1.3; affects nothing.

## For the human reviewers

- The description and the family index (family `README.md`, lines 9–14) say that the family follows a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions, announced on 20 November 2026.
- Several targets have no published source. 2.1 (c)–(d) at an arbitrary point `x` has none: a published theorem is credited only for `x` in general position. 3.1, 3.3 and 3.4 (ii) cite no source either.
- Not tested: JPSS 1983, Henniart 1993, Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read, so wording was not compared with them. The source with the largest share, Zelevinsky 1980, was read.
