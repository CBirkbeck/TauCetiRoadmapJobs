# Review of AutomorphicSpectralTheory (pull request #925 at 8081596)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since 3faace5 (13 insertions, 45 deletions, all in `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`; `Suggested.lean` is byte-for-byte unchanged since c5cfb92). The change deletes the sixteen `<a id=` anchor lines and replaces every internal fragment link by a section number; every one of those section numbers is correct (table below). The verdict is forced by two things: the gate still fails on the 29 "packet" residue hits that only the board can waive (R02 of the previous review, carried as R03 here), and the supplier citations on the changed lines were re-resolved at the suppliers' current heads, where two ArithmeticGaloisRepresentations §2.7 targets this README consumes no longer exist (R01). The cross-roadmap fragment links also no longer resolve anywhere, because the suppliers dropped their anchors too (R02, P3).

## R01 (P2) — ArithmeticGaloisRepresentations §2.7 is cited for two targets it does not contain

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` line 39 (supplier table): "[Hecke zeta-integral comparison] … [Finite-order Hecke functional equation] … supply … algebraic Hecke comparison, finite-order equation supplied by LFunctions Layer 5"; the same two citations in the `*Needs:*` lines of §1.15 (line 1195), §1.25 (line 1461) and §1.26 (line 1480).

**Claim.** ArithmeticGaloisRepresentations §2.7 supplies a "Hecke zeta-integral comparison" (the algebraic Hecke comparison) and a "Finite-order Hecke functional equation".

**Witness.** At the head of ArithmeticGaloisRepresentations (its open pull request, index of 2026-10-29) §2.7 "Local constants" (its line 2086) has exactly three subsections: "Local-constant Gauss sum" (2092), "Standard-test-function evaluations" (2179), "Root-number product formula" (2240). Neither "Hecke zeta-integral comparison" nor "finite-order Hecke functional equation" occurs anywhere in its 5388 lines; its own supplier table (line 624) lists §2.7 as owning only the Gauss-sum constants, the root-number product and the finite-order character globalisation.

**Repair.** The two objects exist at other suppliers already in this README's table: the algebraic Hecke comparison is AutomorphicLFunctionsAndLocalFactors AL.1.5.3 "Canonical rank-one comparison" (its line 1363: `A^(u/2)Λ_AL(s,χ)=Λ_LF(χ₀,s+t)`, proved from the standard-test-function evaluations), and the finite-order Hecke functional equation is LFunctions Layer 5 "finite-order Hecke L-functions" (its line 930), with its all-unitary extension AL.1.6.2 (line 1427). Repoint the supplier table and the three `*Needs:*` lines to "AutomorphicLFunctionsAndLocalFactors AL.1.5.3" and "LFunctions Layer 5", and delete the two ArithmeticGaloisRepresentations fragments. Tested: both named sections exist at the indexed heads and state the objects the three targets use (the Hecke completion of `Λ(2s)` in §1.15 is the `n=1`, trivial-character case of AL.1.6.2).

## R02 (P3) — 26 cross-roadmap fragment links point to anchors the suppliers have deleted

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`: 23 distinct fragments into AutomorphicLFunctionsAndLocalFactors (54 links, first at lines 41–43, 422, 1590, 1763, 1779, 2031, 2048, 2065, 2544, 2580), two into ArithmeticGaloisRepresentations (those of R01) and one into GL2AutomorphicRepresentationsAndTransfer (line 3701).

**Claim.** The links `../AutomorphicLFunctionsAndLocalFactors/README.md#<fragment>` (and the other two suppliers') reach the cited target.

**Witness.** At their heads, AutomorphicLFunctionsAndLocalFactors (2931 lines), ArithmeticGaloisRepresentations (5388) and GL2AutomorphicRepresentationsAndTransfer (2917) contain no `<a id=` tag; their headings carry layer prefixes, so the heading-derived slug of "#### AL.3.12.1 The function-field pair Euler product" is not `function-field-rs-euler-product`. Of this README's 31 distinct cross-roadmap fragments, 26 resolve to nothing; only the three ArithmeticGaloisRepresentations §2.7 headings and two others resolve through heading slugs. The previous review resolved these anchors at the then-indexed head; the suppliers have since made the same anchor removal this head makes.

**Repair.** Cite by section number, as this head already does internally. The mapping at the current heads (link text → section): Rank-one local zeta integral and functional equation → AL.1.3.2; The global standard L-function → AL.2.4.1; Hecke continuation and functional equation → AL.1.6.2; Canonical rank-one comparison → AL.1.5.3; Hecke, eigensystem and Rankin–Selberg data → AL.3.9.4; Niceness with specified root number and conductor → AL.3.9.3; Continuation and the Rankin–Selberg pole criterion → AL.3.6.1; Archimedean realization of holomorphic multiples → AL.3.3.3; Boundedness on finite vertical strips → AL.3.9.2; Archimedean Whittaker comparisons → AL.R.1; GLₙ isobaric sums → AL.R.4; Strong multiplicity one for isobaric sums → AL.3.7.2; The standard local L-factor → AL.2.1.4; The global Rankin–Selberg functional equation → AL.3.6.2; Rankin–Selberg local integrals → AL.3.2.1; Global Rankin–Selberg unfolding → AL.3.5.3; Archimedean GLₙ parameters → AL.R.2; unramified pure realization → AL.3.10 (theorem AL.3.10.14); Real coefficients of unitary self-dual factors → AL.2.1.7; The function-field pair Euler product → AL.3.12.1; Cuspidal pair degrees and poles over a function field → AL.3.12.2; The self-pair polynomial reflection → AL.3.12.3; The open-disc zero–pole index → AL.3.13.1; GL2AutomorphicRepresentationsAndTransfer R17.4.1 → "Unramified base-change Satake rule" (its line 1755, a consumer mention, not a dependency). The three ArithmeticGaloisRepresentations §2.7 links that still resolve by heading slug may stay or become "§2.7, Standard-test-function evaluations" and so on.

## R03 (P3) — Residue scanner: 29 hits on the word "packet"

**Location.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` lines 39, 106, 110, 212, 1209, 1665–1743 (the gate's residue list at this head).

**Claim.** The gate's residue rule treats "packet" as process vocabulary; every hit is the literature's term (L-packet, tempered packet, wave packet).

**Witness.** Line 1675: "with `t=0` the packet is the whole tempered packet, not only its generic member"; line 212: "wave-packet". The gate at this head reports `residue=29 … FAIL` and every other check at 0; the previous review's 16 anchor hits are gone.

**Repair.** None textual: renaming L-packets or wave packets would be invented vocabulary. The board waives these hits or narrows the rule; acceptance is unavailable while the gate fails.

## Previous findings

- R01 — repaired: no `<a id=` line remains in the README (count 0); the sixteen anchors are deleted and the internal links they served now read "§2.3a (GLₙ normalized intertwining estimates)", "§3.6a …", "§3.6b …", "§3.6c …", "§4.15a …", "§4.15b …", "§4.15d …", "§1.15c"; each number matches the heading that followed the deleted anchor (table below). The repair exposed R02 (the suppliers' anchors are gone too) but introduced no new defect of its own.
- R02 — not repaired: the 29 "packet" hits stand unchanged (gate `residue=29`); re-raised as R03 above.

## Verified sound

**Gate.** The worker's gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=29 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`; only residue fails (R03). The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and nothing else. The dependency check run by me:

```
depcheck: 201 roadmaps, 1330 edges, 0 problem(s)
```

No change outside the roadmap folder: `git diff --stat origin/main...HEAD` excluding the folder is empty.

**Lean file.** Unchanged since c5cfb92 (diff empty). Elaborated again with `lake env lean`: exit 0, three `declaration uses 'sorry'` warnings (lines 40, 67, 102) and nothing else. The seven elaborated signatures in the worker's signature file equal those checked at c5cfb92 and 3faace5 (`analytic_fredholm`, `Modular.nonholomorphic_eisenstein`, `Modular.completed_eisenstein_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`, `Modular.automorphic_green`, `Modular.green_kernel_continuation`); no section binder is used, so none is lost. The headline list, the not-statable docstring and the one-tactic probe (the three sorried theorems fail `simp`) were checked at c5cfb92 and carry forward unchanged. The definition `nonholomorphic_eisenstein` is `½·y^s·Σ_{gcd(c,d)=1}|cz+d|^(−2s)`, which is exactly DIT16 (5.2) (cached text line 503–508, printed p.961), so the README's §1.15 and the Lean statement use the same `E`.

**Changed passages.** Every deleted anchor sat directly under its own heading; the section number now cited equals the heading the anchor sat under:

| Deleted anchor (previous head line) | Section it sat under | Now cited as | Correct |
|---|---|---|---|
| `eisenstein-fredholm-continuation` (1200) | 1.15a | not cited elsewhere | — |
| `rank-one-scattering-ratio` (1227) | 1.15b | not cited elsewhere | — |
| `unitary-hecke-functional-equation` (1255) | 1.15c | "§1.15c" at lines 39, 106, 1195, 1461, 1480 | yes (heading line 1249) |
| `gln-normalized-intertwining` (1590) | 2.3a | "§2.3a" at line 2031 (§3.6a) | yes (1582) |
| `rs-vertical-strip-bounds` (2022) | 3.6a | "§3.6a" at line 2048 (§3.6b) | yes (2012) |
| `standard-order-one` (2046) | 3.6b | "§3.6b" at line 2065 (§3.6c) | yes (2034) |
| `standard-superpositivity` (2065) | 3.6c | "§3.6c" at line 2082 (§3.6d) | yes (2051) |
| `trivial-function-field-pole-clearer` (2084) | 3.6d | not cited elsewhere | — |
| `number-field-residual-blocks` (2525) | 4.14 | not cited elsewhere | — |
| `residual-rs-product` (2554) | 4.15a | "§4.15a" at line 2563 (§4.15b) | yes (2534) |
| `residual-rs-telescoping` (2569) | 4.15b | "§4.15b" at lines 2580 (§4.15c), 2603 (§4.15d) | yes (2547) |
| `residual-rs-index` (2590) | 4.15c | not cited elsewhere | — |
| `rs-normalizing-scalar` (2609) | 4.15d | "§4.15d" at line 2620 (§4.15e) | yes (2583) |
| `self-pair-normalizer-reflection` (2634) | 4.15e | not cited elsewhere | — |
| `solvable-gln-base-change` (3783) | 7.1 | not cited elsewhere | — |
| `ramakrishnan-degree-one` (3869) | 7.2 | not cited elsewhere | — |

No internal `](#…)` link remains (count 0), so no internal link dangles. Two sibling roadmaps still link a deleted fragment (ArithmeticGaloisRepresentations line 5234 and AnalyticNumberTheoryPartI line 3613, both `#unitary-hecke-functional-equation`): those are their own P3 repairs, not this roadmap's. AnalyticNumberTheoryPartII line 3837 links the heading slug of §1.5, which still resolves. The line-3701 link to GL2AutomorphicRepresentationsAndTransfer (merge order line 85, after this roadmap at 79) is a consumer mention ("The consumer … uses this power-sum identity"), not a `*Needs:*` edge, so it is not an upward dependency.

**Sampled targets on changed lines, source by source.**

- §1.15 Completed Eisenstein series (its `*Needs:*` line changed): DIT16 cached text lines 514–524 (printed p.962): `E*(z,s)=Λ(2s)E(z,s)`, constant term `Λ(2s)y^s+Λ(2−2s)y^(1−s)` (5.3), entire except simple poles at `s=0,1`, functional equation (5.4), `Res_{s=1}E* = −Res_{s=0}E* = 1/2` (5.5). The README's definition, constant term, poles and Check "residues at 0 and 1 are −1/2 and +1/2" are exactly this; the locator "§5, (5.3), p.962" is right.
- §1.25 and §1.26 (their `*Needs:*` lines changed): [GZ86] Chapter IV §§1–2, pp.271–273, paywalled (DOI 10.1007/BF01388809), uncertified as in the two previous reviews; the mathematics of the two definitions was recomputed at c5cfb92 and is untouched.
- §4.15d The Rankin–Selberg normalizing scalar (its `*Needs:*` line changed): Yu22 cached text (arXiv 1807.04659v5) lines 1542–1561, printed pp.29–30: §5.1.2 begins on p.29; (5.1.1) `n_β(π,z)=q^((1−g)n_in_j)·L(Π_i×Π_j∨,z)/L(Π_i×Π_j∨,q^(−1)z)` (the fraction bar is lost in the extraction, the numerator and denominator are as the README states); (5.1.2) the product over `β>0`, `w(β)<0` of `n_β(π,λ^(−β∨))`; (5.1.3) the Levi-root grouping. The README's single-root formula, inversion-root product and character substitution match; the locator is right.
- §7.1a Quantitative Hecke roots and low-degree comparison (the anchor above §7.1 was deleted): Ram15 (fetched this round from the author's page, 17-page preprint pagination as the reference says) lines 177–183 (p.5): Theorem 1.2, the Luo–Rudnick–Sarnak bound `|α_{j,v}| < q_v^(1/2−1/(n²+1))` extended to isobaric sums of unitary cuspidals through their constituents (lines 184–187, exactly the README's "apply to every unitary cuspidal constituent … `m≤n`"); lines 207–210 (p.6): Proposition 2.1, isobaric sums of unitary cuspidal representations agreeing at almost all places of every degree `m≤(n²+1)/2` are isomorphic; lines 241–243 (p.6): Lemma 2.3, absolute convergence of the incomplete Euler products over places of degree `>(n²+1)/2`; lines 262–267 (p.7): Lemma 2.5 via the bound. Ram18 lines 247–269 (pp.7–8): Proposition 2.1 and Claim 2.2 apply Ram15's Proposition 2.1 with relative degrees over `F` and no normality of the extension, as the README says. Sar03 lines 264–266 (p.8): (14), the same bound with `≤`. All four locators are right.

**Adversarial table.** Rows for the statements the diff leaves untouched carry forward from the review at c5cfb92 (36 rows) and the review at 3faace5 (10 rows), all with "none" in the change column; rows below are for the statements on changed lines.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §1.15 residues of `E*=Λ(2s)E` | `s→1`; `s→0` | constant term `Λ(2s)y^s+Λ(2s−1)y^(1−s)`; `Λ(u)~1/(u−1)` at `u=1`, so `Λ(2s−1)~1/(2(s−1))`: residue `+1/2` at `s=1`; `Λ(2s)=Λ(1−2s)~−1/(2s)`: residue `−1/2` at `s=0` | equals DIT16 (5.5) and the Lean limits `−1/2`, `1/2` | none |
| §1.15 uncompleted residue `3/π` | `s→1` | `φ(s)=Λ(2s−1)/Λ(2s)`, residue `(1/2)/Λ(2)`, `Λ(2)=π^(−1)·1·π²/6=π/6`, so `3/π` | correct | none |
| §1.15 same `E` in README and Lean | `(c,d)=(1,0)` and `(0,1)` | Lean: `½y^s Σ_{gcd=1}|cz+d|^(−2s)`; DIT16 (5.2): `Σ_{Γ∞\Γ}Im(γz)^s = ½(Im z)^s Σ_{gcd(c,d)=1}|cz+d|^(−2s)`; the pair `(0,±1)` contributes `y^s` in total | identical normalization | none |
| §4.15d prefactor `q^((1−g)N_iN_j)` | `g=1`; `g=0`, `N_i=N_j=1` | `g=1`: `q^0=1` (the Check); `g=0`: `q^1=q` | matches Yu22 (5.1.1) | none |
| §4.15d Weyl product | identity `w`; simple reflection in `GL₂` (`N₁=N₂=1`); `w=(1 2 3)` in `GL₃` | identity: no inversion root, empty product `1`; simple reflection: one root `β=e₁−e₂`, one factor; 3-cycle: two inversion roots, two factors (length 2) | matches Yu22 (5.1.2), length-additivity Check consistent | none |
| §7.1a exponents `θ_n`, `D_n`, tail | `n=1`; `n=2`; `n=3` | `θ₁=0, D₁=1`, tail `d≥2` exponent `2d/2=d≥2`; `θ₂=3/10, D₂=2`, first omitted `d=3`, exponent `6/5`; `θ₃=2/5, D₃=5`, first omitted `d=6`, exponent `12/10=6/5` | `2d/(n²+1)>1 ⇔ d>(n²+1)/2 ⇔ d>D_n`; the Checks' values `θ₁=0`, `D₁=1`, `6/5` are right | none |
| §7.1a bound sign | Ram15 Thm 1.2 strict `<`; Sar03 (14) `≤` | README states `≤` | weaker than the source, holds | none |
| §7.1a relative versus absolute degree | `Nv=N(𝔭_F)^d`, `d>D_n` | majorant `Σ_{𝔭_F}[L:F]·N(𝔭_F)^(−2d/(n²+1))`, convergent iff `2d/(n²+1)>1` (Dedekind zeta of `F`); same condition as Ram15's absolute-degree proof | README's relative-degree statement is Ram18 Claim 2.2's use, with the bounded number of places over each `F`-prime as stated | none |
| Internal renumbering (R01 of previous review) | the 8 anchors that were cited | anchor line vs heading line, see the table above | all 8 correct | none |
| Supplier fragments on changed lines | 2 ArithmeticGaloisRepresentations, 9 AutomorphicLFunctionsAndLocalFactors | 0 `<a id=` tags at either head; 3 of 5 AGR fragments resolve by heading slug, 0 of 23 AL fragments | R01 (two targets absent), R02 (stale fragments) | findings |

**Cross-roadmap citations resolved this round** (at the indexed heads or on main): AutomorphicLFunctionsAndLocalFactors AL.0, AL.1, AL.2, AL.3 and the sections listed under R02; ArithmeticGaloisRepresentations §2.7 (three subsections present, two absent: R01); LFunctions Layer 5 "finite-order Hecke L-functions" (line 930 of its head); GL2AutomorphicRepresentationsAndTransfer R17.4.1 (line 1755 of its head, consumer only); SmoothRepresentationsOfLocalGroups SR.3.3 (cited at line 3699, unchanged, resolved at 3faace5). The worker's resolver lists no cross-roadmap citation found nowhere; its nine "Lean names found nowhere" are the seven declarations of this file plus two ArithmeticLocallySymmetricSpaces names already resolved at c5cfb92.

**Duplication and ownership.** The diff adds no object; the ownership record of c5cfb92 stands. Ownership against open pull requests whose files the brief did not provide was checked through the roadmap index only.

**Declared gaps.** None (no readable `design/plan.json`); no `*Needs:*` line cites a roadmap later in the merge order (depcheck 0 problems).

## Not verifiable

- [GZ86] (§§1.25, 1.26 on changed lines; also §§0.35–0.37, 2.24, 2.25): paywalled at DOI 10.1007/BF01388809; uncertified, as the previous two reviews recorded.
- [Tre67], [Lan80], [Sha10], [AC89], the BL24 published pagination: unchanged from the previous reviews and not touched by the diff.
- Whether the two ArithmeticGaloisRepresentations §2.7 targets of R01 existed at an earlier head of that pull request could not be checked (only the current head is indexed); the finding stands on the current head either way.

## Source issues

- **Misprint** in Ram15 at (2.4), printed p.7 (preprint pagination): the inner sum over Satake parameters runs over indices between 1 and 2; it should run over indices between 1 and n, the paper treating general n; affects nothing (the n = 2 case of the cited model proof was carried over).
- **Misprint** in Ram15 at Lemma 2.3, printed p.6: the second incomplete L-function is written with a lower-case superscript for the set S; it should be the same set S as the others; affects nothing.
