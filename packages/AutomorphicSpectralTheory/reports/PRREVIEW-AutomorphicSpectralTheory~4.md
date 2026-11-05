# Review of AutomorphicSpectralTheory (pull request #925 at 9751428)

**Verdict:** accepted

Incremental re-review of the 82 lines changed since 8081596 (41 insertions, 41 deletions, all in `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`; `Suggested.lean` is byte-for-byte unchanged since c5cfb92). The change repoints the two ArithmeticGaloisRepresentations §2.7 targets of the previous R01 to AutomorphicLFunctionsAndLocalFactors AL.1.5.3 and LFunctions Layers 5–6, and replaces every cross-roadmap fragment link by the supplier's section number. Every one of the 25 AutomorphicLFunctionsAndLocalFactors section numbers, the three ArithmeticGaloisRepresentations §2.7 subsections, LFunctions Layers 5–6 and GL2AutomorphicRepresentationsAndTransfer R17.4.1 resolves at the cited head to a heading whose title is the text this README uses (table below). The gate passes at this head, including the residue rule that failed the previous round. One P3 remains: a phrase that referred to the deleted ArithmeticGaloisRepresentations contracts.

## R01 (P3) — "the two arithmetic comparison contracts below" no longer has a referent

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 1265 (§1.15c): "Identify the finite-order and algebraic specializations with LFunctions Layers 5–6 through the two arithmetic comparison contracts below and AutomorphicLFunctionsAndLocalFactors' Canonical rank-one comparison (AL.1.5.3)."

**Claim.** Two arithmetic comparison contracts are stated below this sentence, in addition to AL.1.5.3.

**Witness.** At 8081596 the two contracts were ArithmeticGaloisRepresentations' "Finite-order Hecke functional equation" and "Hecke zeta-integral comparison", cited in the Checks bullet (line 1270) and the `*Needs:*` line (line 1278). This head deletes both citations (correctly, see Previous findings R01); the Checks bullet now cites AL.1.5.3 itself and the `*Needs:*` line cites LFunctions Layers 5–6, so nothing below the sentence is a second contract.

**Repair.** Replace the clause by "through AutomorphicLFunctionsAndLocalFactors' Canonical rank-one comparison (AL.1.5.3), as the finite-order and algebraic Checks below record". Tested: AL.1.5.3 at its head (its line 1373) proves exactly the identification of LFunctions Layer 5's finite-order equation and Layer 6's algebraic equation with the `n=1` Godement–Jacquet germ, so the sentence then names one contract and that contract states both specializations.

## Previous findings

- R01 — repaired: the supplier table (line 39), the Scope paragraph (line 104) and the `*Needs:*` lines of §1.15 (1195), §1.15c (1278), §1.25 (1461) and §1.26 (1480) now cite "AutomorphicLFunctionsAndLocalFactors AL.1.5.3, Canonical rank-one comparison (algebraic Hecke comparison with LFunctions Layers 5–6)" and "LFunctions Layers 5–6"; AL.1.5.3 exists at the head of AutomorphicLFunctionsAndLocalFactors (its line 1373) and states that identification, including the finite-order case (its first Check); LFunctions Layers 5 and 6 are at lines 929 and 1100 of its head. The ArithmeticGaloisRepresentations §2.7 citations keep only its three real subsections. The repair left the stale phrase of R01 above.
- R02 — repaired: no `](../` link remains in the README (count 0); the 26 dead fragments are replaced by section numbers, each matching the heading at the supplier's head (table under Verified sound).
- R03 — repaired: the gate at this head reports `residue=0`; the README's 32 occurrences of "packet" are unchanged by the diff (every one is "L-packet", "tempered packet" or "wave packet"), so the rule was narrowed rather than the text changed, which is the repair the previous report asked for.

## Verified sound

**Gate.** Run by me on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at this head additionally reports `build=0`. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and nothing else. The dependency check:

```
depcheck: 201 roadmaps, 1341 edges, 0 problem(s)
```

No change outside the roadmap folder: `git diff --stat origin/main...HEAD` excluding the folder is empty.

**Lean file.** Unchanged since c5cfb92 (diff empty). Elaborated with `lake env lean`: exit 0, three `declaration uses 'sorry'` warnings (lines 40, 67, 102) and nothing else. The seven elaborated signatures in the worker's signature file equal those checked at c5cfb92, 3faace5 and 8081596 (`analytic_fredholm`, `Modular.nonholomorphic_eisenstein`, `Modular.completed_eisenstein_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`, `Modular.automorphic_green`, `Modular.green_kernel_continuation`); no section binder is used, so none is lost. One-tactic probe re-run on a scratch copy with `simp` in place of each `sorry`: `analytic_fredholm` "simp made no progress", `completed_eisenstein_continuation` and `green_kernel_continuation` "unsolved goals"; none is padding. The headline list in the module docstring (§0.16 analytic Fredholm continuation, §2.18 completed Eisenstein continuation, §2.24 Green kernel continuation stated; §§1.15a–1.15c, Layers 3–7 and §§3.6a–3.6d named as not statable with the missing carriers) is unchanged from c5cfb92.

**Changed passages: every repointed citation resolved at the supplier's head** (AutomorphicLFunctionsAndLocalFactors at #924, 2948 lines; ArithmeticGaloisRepresentations at #856; GL2AutomorphicRepresentationsAndTransfer at #931; LFunctions at #248; index of 2026-10-29):

| Cited as | Heading at the supplier's head (line) | Title matches |
|---|---|---|
| AL.R.1 Archimedean Whittaker comparisons | `### AL.R.1 Archimedean Whittaker comparisons` (244) | yes |
| AL.R.2 Archimedean GLₙ parameters | 254 | yes |
| AL.R.3 Restricted tensor realizations | 264 | yes |
| AL.R.4 GLₙ isobaric sums | 274 | yes |
| AL.1.3.2 Rank-one local zeta integral and functional equation | 1176 | yes |
| AL.1.5.3 Canonical rank-one comparison | 1373 | yes |
| AL.1.6.2 Hecke continuation and functional equation | 1437 | yes |
| AL.2.1.4 The standard local L-factor | 1566 | yes |
| AL.2.1.7 Real coefficients of unitary self-dual factors | 1620 | yes |
| AL.2.4.1 The global standard L-function | 1749 | yes |
| AL.3.2.1 Rankin–Selberg local integrals | `The local Rankin–Selberg integrals` (1924) | yes |
| AL.3.3.3 Archimedean realization of holomorphic multiples | 2009 | yes |
| AL.3.5.3 Global Rankin–Selberg unfolding | 2130 | yes |
| AL.3.6.1 Continuation and the Rankin–Selberg pole criterion (also "cuspidal continuation and poles", line 2522) | 2142 | yes |
| AL.3.6.2 The global Rankin–Selberg functional equation | 2159 | yes |
| AL.3.7.2 Strong multiplicity one for isobaric sums | 2193 | yes |
| AL.3.9.2 Boundedness on finite vertical strips | 2251 | yes |
| AL.3.9.3 Niceness with specified root number and conductor | 2261 | yes |
| AL.3.9.4 Hecke, eigensystem and Rankin–Selberg data | 2271 | yes |
| AL.3.10.1 Curve additive analysis | 2313 | yes |
| AL.3.10.14 unramified pure realization | `The unramified pure realization theorem` (2459) | yes |
| AL.3.12.1 The function-field pair Euler product | 2520 | yes |
| AL.3.12.2 Cuspidal pair degrees and poles over a function field | 2548 | yes |
| AL.3.12.3 The self-pair polynomial reflection | 2558 | yes |
| AL.3.13.1 The open-disc zero–pole index | 2580 | yes |
| ArithmeticGaloisRepresentations §2.7 Local-constant Gauss sum (Arithmetic character constants) | `### 2.7 Local constants` (2086), `#### Local-constant Gauss sum` (2092), whose first paragraph is headed "Arithmetic character constants" (2094) | yes |
| ArithmeticGaloisRepresentations §2.7 Standard-test-function evaluations | 2179 | yes |
| ArithmeticGaloisRepresentations §2.7 Root-number product formula | 2240 | yes |
| LFunctions Layers 5–6 | `## Layer 5: finite-order Hecke L-functions` (929), `## Layer 6: Grossencharacters` (1100); Layer 6 states the Grossencharacter completed L-function and its functional equation (its lines 1172–1173 relative to Layer 6's start) | yes |
| GL2AutomorphicRepresentationsAndTransfer R17.4.1 (Unramified base-change Satake rule) | `### R17.4.1 Unramified base-change Satake rule` (1755) | yes; a consumer mention at line 3701, not a `*Needs:*` edge (merge order 85 > 79) |

**Content of the repointed suppliers against what the changed lines consume.** AL.R.1 supplies the Casselman–Wallach smooth Fréchet globalization specialised to `GLₙ(ℝ)`, `GLₙ(ℂ)` (used at §0.49, lines 833, 845). AL.R.3 supplies the restricted tensor factorization and, over a function field, the compact rational unipotent quotients (used at §0.50 lines 850, 862 and §§1.10a–1.10b lines 1070–1099). AL.R.4 supplies the isobaric sum with Satake product (§2.14, §4.14a, §7.1). AL.3.10.1 supplies completion-valued adeles, residue characters, the discrete cocompact rational quotient, the annihilator, conductor-degree sum and Poisson API, the idele/divisor/Picard comparison and degree surjectivity (lines 104, 1070, 1082, 3428, 3457). AL.3.9.2 owns the `BoundedOnStrips` predicate and states that bounded strip functions have finite strip order while the converse fails (`exp(−s²)`), the direction §0.18 line 422 uses. AL.1.5.3 states `A^(u/2)Λ_AL(s,χ)=Λ_LF(χ₀,s+t)`, identifies LFunctions Layer 5's finite-order equation and Layer 6's algebraic equation with the `n=1` Godement–Jacquet germ, and gives `ε_AL(s,χ)=W_LF(χ₀)A^(1/2−u)`; AL.1.6.2 gives `Λ_H(ω,s)=W_H(ω)Λ_H(ω⁻¹,1−s)` with `W_H` the §2.7 Gauss-sum root number and poles at `−it, 1−it` for `ω=|·|^(it)`: exactly what §1.15c consumes.

**Sampled target on changed lines.** Of the seeded sample only §1.26 "Eisenstein series `E^{(D₁)}_s`" has a changed line (its `*Needs:*` line 1480); its source [GZ86] Chapter IV §2 (2.1), p.273, is paywalled and uncertified as in the three previous reviews, and the definition was recomputed below. The other fourteen sampled targets (0.9, 0.37, 0.47, 1.18, 1.21, 2.8, 2.19, 3.14, 3.16, 4.4, 4.8, 4.15, 6.14, 6.29) are untouched by the diff; their source checks carry forward from the reviews at c5cfb92 and 3faace5.

**Adversarial table.** Rows for the statements the diff leaves untouched carry forward from the review at c5cfb92 (36 rows), 3faace5 (10 rows) and 8081596 (10 rows), all with "none" in the change column. Rows below are for the statements whose lines this diff changes (only citations changed; the statements were recomputed).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.18 bounded on strips ⇒ finite strip order (AL.3.9.2) | `f=1`; `f=exp(−s²)` | `1`: bounded, finite order with `d=1`; `exp(−s²)`: modulus `exp(Im(s)²−Re(s)²)`, unbounded on the imaginary axis, finite order `2` | one-way implication as stated at line 422 and at AL.3.9.2 | none |
| §1.15 residues of `E*=Λ(2s)E` | `s→1`; `s→0` | constant term `Λ(2s)y^s+Λ(2s−1)y^(1−s)`; `Λ(2s−1)~1/(2(s−1))`: residue `+1/2`; `Λ(2s)=Λ(1−2s)~−1/(2s)`: residue `−1/2` | equals the Check and the Lean limits | none |
| §1.15c Check `ω=|·|^(ir)` | `F` with `D=|disc F|` | `Λ_H(ω,u)=D^(u/2)Λ(u+ir,1)=D^(−ir/2)·D^((u+ir)/2)Λ(u+ir,1)=D^(−ir/2)Λ_F(u+ir)`; reflection: `Λ_H(ω⁻¹,1−u)=D^(ir/2)Λ_F(1−u−ir)=D^(ir/2)Λ_F(u+ir)`, so `W_H=D^(−ir)` | both displayed values correct, agree with AL.1.6.2 Check 3 | none |
| §1.15c Check odd character of conductor 4 | `χ_(−4)` over `ℚ` | `a=1`: factor `Γ_ℝ(u+1)`; `A=4`; `Λ(u)=(4/π)^((u+1)/2)Γ((u+1)/2)L(u,χ)=Λ(1−u)`, root number `1`, entire | matches AL.1.5.3 Check 3 and AL.1.6.2 Check 2 | none |
| §1.15c Check over `ℚ(√2)` | `ε=1+√2`, `r=π/log ε` | on `ε`: `x₁/x₂=ε/ε'=−ε²`, `|x₁/x₂|^(ir)=ε^(2ir)=e^(2πi)=1`; on `−1`: `1`; gamma shifts `ir,−ir` | character well defined on units, as stated | none |
| §1.15c Check imaginary quadratic `η=ω|·|^(m/2−it)` | `ω_∞=(z/|z|)^m|z|_ℂ^(it)` | `η_∞=(z/|z|)^m(zz̄)^(it)(zz̄)^(m/2−it)=(z/|z|)^m|z|^m=z^m`; `η^u=η|·|^(−m/2)` has `η^u_∞=(z/|z|)^m`; `Λ_H(ω,u)=A^(u/2)Λ(u+it,η^u)=A^(−it/2)Λ_H(η^u,u+it)`; `W_H(ω)=A^(−it/2)W(η^u)/A^(it/2)=A^(−it)W(η^u)` | all four displayed identities correct | none |
| §1.15c Check `h(u)=exp(2πiu)` | period one | `h(u)/h(u+1)=1` preserves `L(u)/L(u+1)`; `|h(u)|=exp(−2π Im u)≠1` off the real axis, so `hΛ≠Λ` on `Re u>1` | the full-product comparison excludes it, as stated | none |
| §1.25 pairing `±(c,d)` | `ε` odd, weight `2k−1` | `ε(−d)(−(cz+d))^(−(2k−1))=ε(−1)(−1)^(−(2k−1))ε(d)(cz+d)^(−(2k−1))=(−1)(−1)·(…)` | summand invariant, half-sum well defined; even `ε` gives cancellation (Check 3) | none |
| §1.26 definition and Checks | `D=−15=(−3)·5`; `D₁=1`; discriminants `12,16,−7,−9` | `ε₁=χ_(−3)` odd, `ε₂=χ_5` even, parity product odd: `ε₁(−m)ε₂(−n)(−1)^(−(2k−1))=(−1)(−1)=+1`; `D₁=1`: sum over `δ∣m` with `ε(n)` is §1.25 at `N=1`; `12=4·3`, `3≡3 (4)` fundamental, `16/4=4≡0 (4)` not; `−7≡1 (4)` fundamental, `−9=−3²` not | all Checks hold | none |
| §2.14 isobaric Satake product (AL.R.4) | two unramified characters `a,b` | `(1−aT)(1−bT)=1−(a+b)T+abT²` | product of constituent polynomials, as AL.R.4's Check | none |
| §4.15d prefactor and Weyl product (Yu22) | `g=1`; identity `w`; simple reflection | `q^0=1`; empty product `1`; one factor | carried from 8081596 | none |
| §7.0b consumer mention | merge order | GL2AutomorphicRepresentationsAndTransfer at 85, this roadmap at 79; sentence begins "The consumer" and is not a `*Needs:*` edge | depcheck 0 problems | none |
| Supplier fragments on changed lines | 25 AL sections, 3 AGR subsections, LFunctions 2 layers, GL2 1 section | 31 of 31 resolve to a heading whose title equals the link text | R01 and R02 of the previous review repaired | none |

**Cross-roadmap citations resolved this round** (at the indexed heads): the 31 of the table above; LFunctions (open pull request #248 by another author, a new roadmap folder, merge order line 23, earlier than this roadmap at 79); ArithmeticGaloisRepresentations at 41; AutomorphicLFunctionsAndLocalFactors at 77. The worker's resolver lists no cross-roadmap citation found nowhere; its nine "Lean names found nowhere" are the seven declarations of this file plus two ArithmeticLocallySymmetricSpaces names resolved at c5cfb92.

**Duplication and ownership.** The diff adds no object; the ownership record of c5cfb92 stands. Ownership against open pull requests whose files the brief did not provide was checked through the roadmap index only.

**Declared gaps.** None (no readable `design/plan.json`); no `*Needs:*` line cites a roadmap later in the merge order.

## Not verifiable

- [GZ86] (§§1.25, 1.26 on changed lines; also §§0.35–0.37, 2.24, 2.25): paywalled at DOI 10.1007/BF01388809; uncertified, as the three previous reviews recorded.
- [Tre67], [Lan80], [Sha10], [AC89], the BL24 published pagination: unchanged from the previous reviews and not touched by the diff.

## Source issues

- none
