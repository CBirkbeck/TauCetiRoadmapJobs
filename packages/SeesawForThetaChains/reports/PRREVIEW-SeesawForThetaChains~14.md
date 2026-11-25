# Review of SeesawForThetaChains (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 14 lines changed since `3bddf73`, all in the README. The three small corrections of the previous review are repaired (the origin label of 6.13, the bound on the parts of the partitions in the MetaplecticAutomorphicForms §3.7a contract, the setting of Haan–Kwon's Theorem 4.1), and the new method and source lines of 6.3 (a) agree with the formal proof as read. Accepted, with no finding and no small correction; the two format notes of the previous review stand, neither blocking. Nothing is left for a human to decide beyond the standing questions of scope and licence about the formal proof.

## N01 — At 6.3, 6.4, 6.6, 6.10 and 6.13 the label `*Sources:*` is followed by a topic in parentheses and no source

For example "*Sources:* (Kudla's seesaw)." at 6.3 (line 213), likewise lines 229, 265, 339 and 393; the works are in the origin lines. The parenthesis could be dropped, or the works named there.

## N02 — The origin labels of 6.2c, 6.3, 6.4, 6.9 and 6.10 name works without a theorem or page

Gan–Gross–Prasad (2012), Kudla (1984), Mœglin–Vignéras–Waldspurger (1987), Howe (1979), Weil (1964), Kashiwara–Vergne (1978) and Gross (1999); 6.2a, 6.2b and 6.2d give theorem numbers. Would add the locators.

## Previous findings

- The previous review raised no finding (no R-numbered point). Its small corrections and format notes:
- C01 — repaired: "*Origin:* particular to this proof: the unfolding of a Poincaré series over a Bessel subgroup … the nearest published result is the classical unfolding of Poincaré series"; the sentence on 6.13 is gone from the Labels paragraph.
- C02 — repaired: "for two definite spaces, of dimensions `n` and `d`, … over the partitions `μ` of `ℓ` with at most `min(n, d)` nonzero parts", as MetaplecticAutomorphicForms §3.7a (iii) has it.
- C03 — repaired: the origin of 6.2d reads "(orthogonal–symplectic and orthogonal–metaplectic pairs, the Whittaker case, as a nonvanishing criterion proved by this unfolding)", and the References entry states the theorem.
- N01 — not repaired: "*Sources:* (Kudla's seesaw)." and four like it; written again above.
- N02 — not repaired: the origin labels named are unchanged; written again above.

## Verified sound

| Statement | Instances tried | Values computed (README / source or supplier) | Result | Change |
|---|---|---|---|---|
| 6.3 (a), sources: `TensorTarget`, `TensorSource` | second space `T = A ⊥ B`; value at `0` | `om_box`: `ω_T(g,(a,b))(f_A ⊠ f_B) = ω_A(g,a)f_A ⊠ ω_B(g,b)f_B`; `box_zero`: value at 0 is `f_A(0)·f_B(0)` / README (a): product of two kernels | agrees | none |
| 6.3 (a), sources: `SeeLast` | lines of rank 1, `τ = t` scalar | hypothesis `t̄·ℓ·t = −ξ₀ξ̄₀·ℓ″`, so the forms are opposite up to `ξ₀ξ̄₀/N(t) > 0` / README: "opposite up to the positive factor `ξ₀ξ̄₀`" | agrees | none |
| 6.3 (a), method | the scalar `c(a, b, h)` | proof: `c` continuous, of norm one, `= 1` on rational points and on elements supported at a split idempotent, multiplicative in each of three groups, hence `1`; target case from source case by the adjoint / README says the same | agrees | none |
| 6.3 (a), method: line `L″` brought to `L` | proof of `SeeLast` | uses the two tensor rules and a statement identifying the Weil representation of a source line with that of the opposite target line / README names the same three inputs | agrees | none |
| 6.3 (b), sources: `LastLaw` | `ρ = 0` | right side: `∫_T F·∫_S θ(Φ₂)(h,h′)·∫_A φ·θ(Φ₁)(h₀,h)`, a triple integral; hypotheses: compact-quotient predicates on `A`, `S`, `T`, no definiteness / README says both | agrees | none |
| 6.3, "for the CM host `E/F` of the chain only" | binders of the three declarations | each quantifies over `D : D7` with spaces over `D.host` / README: own form for every CM extension | agrees | none |
| §3.7a (iii) contract bullet | `n = 1, d = 3, ℓ = 2`; `n = d = 2, ℓ = 2` | `dim Sym²(ℂ³) = 6 = 1·6` (only `μ = (2)`); `dim Sym²(ℂ⁴) = 10 = 3·3 + 1·1` / bullet and supplier both bound the parts by `min(n, d)` | agrees | none |
| 6.2d origin and reference: Haan–Kwon, Theorem 4.1 | `ε = 0, 1`; `k = n+ε−1, n+ε`, `k ≥ 1` | HaanKwon26 lines 1561–1566: lift nonzero and generic iff the Bessel period is nonzero; bases of size `2n`, `2n+1` (lines 1572–1573) / README the same | agrees | none |
| 6.13 origin | the family's five label forms | "particular to this proof" = introduced by the formal proof, nearest published result named; (o), (a) are cited to [FormalProof] in the section | consistent | none |

The rows of the previous review for the untouched statements stand as in that review, of `3bddf73`.

- Source locators checked against the text: 1 (Haan–Kwon, arXiv:2605.04389v2, Theorem 4.1, p. 39).
- Formal proof, operator's local copy: 6 declarations opened with their files (`TensorSource`, `TensorTarget`, `SeeLast`, `LastLaw` and the theorems `thetaTensorRule_targetOrthogonalSum`, `thetaTensorRule_orthogonalSum_source`, `lastSeeSaw_thetaIdentity`, `doubleLiftPeriod_rankZero_fubini_compactQuotient`), with the proofs of the tensor rule and of `SeeLast`; every path and name of the new lines exists as written.
- Cross-roadmap citations resolved at this head: MetaplecticAutomorphicForms §§1.5, 2.5a, 2.6a, 3.2a, 3.3, 3.7a, 5.6, 6.15, 6.17; ThetaKernelsForUnitaryDualPairs §§3.3b, 4.4a; AdelicAlgebraicGroups §§3.4, 4.5a (these three READMEs changed since `3bddf73`; the sections keep their numbers and subjects).
- Record: no heading added, removed or renumbered; `Suggested.lean` unchanged.
- Dependency check: `depcheck: 122 roadmaps, 1393 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message; the file declares nothing (its docstring names the three headlines as not statable), so no `#check` comparison and no one-tactic probe applies.
- Automatic checks: all passed.
- The pull request's text: its part 2 (origin and method labels, section numbers unchanged) still describes this folder; the change since `3bddf73` alters nothing it states.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs and MetaplecticAutomorphicForms; the change adds no object owned here. The orthogonal-sum compatibility stays with ThetaKernelsForUnitaryDualPairs §3.3b and the compact dual pairs with MetaplecticAutomorphicForms §3.7a; this roadmap cites both. No open pull request other than this one changes the folder.

Source independence: changed passages only; 6 passages compared with 3 sources (the origin of 6.2d and the References entry with Haan–Kwon, the method and source lines of 6.3 (a) with [FormalProof], the §3.7a bullet with its supplier section, the origin of 6.13 with the family index), none shared beyond standard names; largest share [FormalProof], about 70 of 83 locators; no layer added, removed or reordered, so the arrangement was not compared.

Research link: Layer 6 of the chain in Alpöge's formal proof of GRH for Dirichlet L-functions (Announcement, 2026). Its unfoldings 6.2a–6.2d are unitary forms of the Bessel/Fourier–Jacobi exchange under theta lifts of Wang (2025, Theorem 4.5) and Furusawa–Morimoto (2025, Proposition 3.1), used for Gan–Gross–Prasad; rests on the README's origin labels and the two papers as read.

## Not verifiable

- Journal data and printed numbering of Wang (J. Number Theory 271, 2025) and Furusawa–Morimoto (Math. Ann. 391, 2025): only the arXiv versions were read, by the previous review.
- The works named without a locator in the origin labels of 6.2c, 6.3, 6.4, 6.9 and 6.10: not opened, there being no locator to check.
- The auxiliary statements behind the tensor rule (products and slices of theta functions, density of the product span) were read as statements only, not their proofs.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unrefereed Lean development announced on 20 November 2026 (Announcement); published sources are named for 6.2a–6.4, 6.9 and 6.10 (Wang 2025, Furusawa–Morimoto 2025, Kudla 1984, Gross 1999, among others).
- Licence: the family index says the formal proof was published without a licence; this README cites its file paths and declaration names only, with no text.
- Decisions: neither recorded decision bears on this folder, which removes no section and hands none to another roadmap.
