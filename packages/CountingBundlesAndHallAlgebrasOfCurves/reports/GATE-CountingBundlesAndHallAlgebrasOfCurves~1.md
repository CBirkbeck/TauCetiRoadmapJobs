# GATE-CountingBundlesAndHallAlgebrasOfCurves~1: answers to the human review

Review answered: CBirkbeck, 2026-10-25T17:42:02Z, on head 51072a4. It makes four points, H01–H04. Repairs are committed as 2a1d1ff5 on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied differently

The fibrewise cotangent quotient over the singular closure P cannot be repaired from any available source, and nothing but the bounded-characteristic count used it. So the whole route built on it is deleted rather than given an envelope. Removed: old §§7.3a–7.6 and 8.2–8.6, 8.8, the deformation half of old §8.7, the two-line-chart contract with EndoscopicTransferAndUnitaryTraceComparison, the QuiverRepresentations supplier section, the King criterion in the reductive-GIT contract, ACK07 and the framing worked example. The general Białynicki-Birula–Hesselink theorem is kept as new §8.1, because §9.1 applies it to H through the proper Hitchin map. Old §§8.9 and 8.10 become §§8.2 and 8.3, and the coprime count now rests only on the all-characteristic Hall comparison in §8.3, which adds the genus-zero case. Scope and ownership now says, with S16 line 2638, why S16 §§6.6–6.9 is not a route.

The counterexample checks out numerically:

- dim E=2·5·7=70 and dim T_xQ°°=4+49−1+1=53, so the conormal space has dimension 17 while C=14<17.
- The map H→Hom(V₁,V₂) is injective, and V₁*⊠V₂ is irreducible, so the G-span of x is E and T₀P=E.

S16's own proof of Proposition 6.9 also goes through the surjection (P×E*)//G→(T*P)//G (S16 line 2913–2916). So the limit property rests on the same object.

The sentence "the Hall route does not supply this geometric input" is disputed. After the repair, no theorem consumes Y:

- Layer 9 needs only §7.3 and §8.1.
- Downstream consumers receive §§8.3 and 10.4; the old text already called the deformation "a proof ingredient".

## H02 (CBirkbeck) — applied

Conjecture (v) is removed from §11.6, together with its interface bullet, its Check and its §11.2 Need. The §11.2 pointer "formulated in §11.6" now says that Mellit's theorem places `A_{g,p,α}` in R_g by a different route (M20P, Theorem 7.1 line 2433, Corollary 7.4 line 2503). This follows the reviewer's out-of-scope option, so no new targets are added:

- A Scope and ownership paragraph states the theorem: the count is a coefficient of H^HLV at t=1, it lies in ℚ[q,σ^(±1)], Weyl averaging puts it in R_g, and it is independent of the degree.
- The M20P reference is added.
- `Suggested.lean` now reads "four conjectures" instead of "five".

## H03 (CBirkbeck) — applied

The README now gives the actual path: the heading reads `From TauCetiRoadmap.RepresentationTheory.ArtinAlgebras`, and all six mentions read "RepresentationTheory/ArtinAlgebras Layer 0". Its Layer 0 paragraphs (Indecomposables, Uniqueness, Recognition, the radical in a Krull-Schmidt category) were checked at the open head and match the contract. It is a new folder by another author, so it is an admissible supplier. QuiverRepresentations is cited as RepresentationTheory/QuiverRepresentations Layer 2, as it stands on main. The PR description's dependency and merge-order lists are outside the files this job may edit; the worker should add the ArtinAlgebras pull request there.

## H04 (CBirkbeck) — applied

There is now one supplier. Scope line 17 drops "a symmetric-function Part II" and names the QSeriesPartitionsAndMockModularForms Macdonald contract as the single owner of both modified-Macdonald admissibility and Mellit's regular-sequence theorem. That contract is built on the stable symmetric-function ring and Hall inner product of RepresentationTheory/SchurWeyl Layer 7, with no second carrier:

- The S-twist is stated as `(p_λ,p_μ)_S=(p_λ,p_μ)∏_i S(q^(λ_i),t^(λ_i))`, from M18 line 49–58.
- A new `From TauCetiRoadmap.RepresentationTheory.SchurWeyl` contract has been added.
- §10.3 and the Layer 10 Dependencies now list SchurWeyl Layer 7.

SchurWeyl is cited as it stands on main, where Layer 7 names the stable ring and Hall product as a separately stated later step. The open SchurWeyl pull request revises an existing roadmap, so it is not cited as a supplier.

## Verification record

**Ownership.** The searches covered main and all open roadmap pull requests at their heads:

- Macdonald or modified-Macdonald theory: no owner other than this contract.
- Stable symmetric functions: main's SchurWeyl Layer 7 defers them; the open SchurWeyl revision adds them.
- ArtinAlgebras: a new folder in an open pull request by another author.

`roadmaps resolve` reports no unresolved cross-roadmap citation and no unresolved Lean name. Every edited citation was checked:

- EndoscopicTransfer §3.7(a) and its single-frame Quot open.
- SchurWeyl Layer 7 on main.
- QuiverRepresentations Layer 2 on main.

**Sources.** M20P (Mellit, arXiv:1710.04513v1) was fetched through the sources service from arXiv and cited with the numbering of the version read. This job may not edit `sources.toml`, so the worker needs to:

- add an entry for M20P (theorem locators Theorem 7.1 and Corollary 7.4, cited for Scope and ownership and §11.2);
- drop ACK07, which is no longer cited.

No text was missing, so no `needs-references.toml` was written.

**Signatures.** I appended `#check @name` for all five declarations to `Suggested.lean`, elaborated once with `lake build`, and restored the file. The signatures of `bundleDegree`, `IsAbsolutelyIndecomposable`, `absIndecCount`, `nilpotent_matrix_count` and `absIndecCount_eq_of_degree` are unchanged and match their README statements; only the docstring changed.

**Adversarial pass on added or changed statements.**

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §8.1 stratum count | P¹, t·[x:y]=[tx:y], over 𝔽_Q; A^n of weight 1; a point | Q·1+1=#P¹; Q^n; 1 | holds | P¹ added as a Check |
| §8.1 hypotheses | A¹ with weight −1 | t·1→∞; naive count 1≠Q | excluded by the limit and positive-weight hypotheses | negative-control Check added |
| §8.1 opposite strata on the reduced core | char 2, g=1, r=2, d=1 | m=1, b=0, D=1; core Pic¹; scheme fibre locally Pic¹×Spec k[a]/(a²) | rank 0 on the reduced core only | Check kept |
| Layer 8 rank-one example | H=Pic^d×A^g, weight 1 on H⁰(Ω) | n=g, opposite rank 0; q^gP(1)=q^D A(1,d), D=g | holds | Example added |
| §8.3 genus zero | P¹: r=1 and r=2 with d odd | D=0 gives 1=1; D=−3 gives 0=0 | holds | sentence and Check added |
| §8.3 characteristic two | y²+y=x³ over 𝔽₂ and 𝔽₄ | #E=3, #H=6; #E=9, #H=36 | holds | none |
| EndoscopicTransfer contract witness | P¹, L₁=O(−n), O(a)⊕O(−a), a=n+2 | H¹(O(−2))=1≠0; H⁰(O(−2a−2))=0, so O(a) is invariant | outside the presentation and unstable | witness added |
| SchurWeyl Hall product | (2), (1,1), mixed pair, empty partition | z=2, 2, 0, 1 | holds | Check added |
| S-twisted pairing | λ=(1); λ=(2) at q=2, t=3 | −(q−1)(t−1)=N_(1)(1), untwisted gives 1; −48 against −4 for the wrong model | holds | Check added |
| Mellit parabolic note | rank one | T¹ coefficient of H^HLV at t=1 is ∏(1−σ_i⁻¹)(q−σ_i)·∏p₁[X_k]=P(1)·∏p₁ | consistent with the §11.2 rank-one Check | none |
| Reviewer's T*P counterexample | g=1, (r,d)=(1,0), 𝔽₁₇, h=5 | dim E=70, T_xQ°° of dimension 53, conormal 17 at x and 0 at the cone point 0 | the quotient is not separated | route deleted |
| §11.6 after removing (v) | remaining Checks | 3 Checks left | meets the minimum of three | none |

No suspicious instructions appear in the review text.

**Build.** `lake build TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves.Suggested` printed "Build completed successfully (9034 jobs)", with two `declaration uses sorry` warnings at lines 83 and 93.

**Gate.** The gate returned:

`gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

**Dependency direction.** The depcheck (`--movable`) printed `depcheck: 55 roadmaps, 631 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
