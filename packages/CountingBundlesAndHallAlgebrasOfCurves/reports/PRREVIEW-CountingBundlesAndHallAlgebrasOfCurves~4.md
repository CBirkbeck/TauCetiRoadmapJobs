# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at fbebf39)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines changed since 601e2d6 (6 insertions, 19 deletions, README only). The change deletes the `gap:stable-symmetric-functions` contract and replaces it by a citation of RepresentationTheory/SchurWeyl §§7.3–7.6 on main, which now own the stable ring Λ_R, its Hall form, ω and the stable Frobenius characteristic; the Macdonald contract, §10.3's `*Needs:*` line, the Layer 10 Dependencies list and the Scope paragraph are re-pointed accordingly. Every claim the new paragraph makes about §§7.3–7.6 is what those sections state. One registration item from the previous report remains.

## R01 (P3) — The plan's `reductive-character-git` needs still asks for King's invariant-subspace criterion

**Location:** `packages/CountingBundlesAndHallAlgebrasOfCurves/design/plan.json`, top-level `gaps`, slug `reductive-character-git` (“the Hilbert–Mumford and King invariant-subspace criteria”); `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:103` (“the Hilbert–Mumford criterion, geometric free projective-group quotients”).

**Claim:** The gap the intake announces on the supplier's job is the gap the README's contract states and the retained route consumes.

**Witness:** The slug sets now agree (six in the plan, six in the README, symmetric difference 0; `two-line-chart-epimorphism` and `stable-symmetric-functions` are gone from both). The `needs` sentences of `reductive-character-git` do not: the plan's asks for King's invariant-subspace criterion, README:103 does not, and no target of the README mentions King, an invariant-subspace criterion or ACK07 (zero hits for each; the manifest's `ACK07` entry is cited nowhere in the README). The criterion belonged to the two-Hom-frame route that the package dropped.

**Exact repair:** In the plan's `gaps` entry `reductive-character-git`, replace “the Hilbert–Mumford and King invariant-subspace criteria” by “the Hilbert–Mumford criterion”, so that the `needs` sentence equals README:103's. No README change.

**Repair test:** After the edit the six `needs` sentences of the plan and the six contracts of README:95, 103, 109, 125, 145, 163 agree word for word (the other five already do at this head). The supplier's §4.19 character-quotient continuation then receives exactly what §§7.3 and 8.1 consume: character-linearized GIT for products of general linear groups, Hilbert–Mumford, free projective-group quotients, base change and the projective morphism to the affine quotient.

## Previous findings

- R01 — partly repaired: the README no longer states a `gap:stable-symmetric-functions` contract and cites SchurWeyl §§7.3–7.6 instead; the plan's `gaps` drop `two-line-chart-epimorphism`, so the slug sets are 6/6; the King clause of `reductive-character-git` remains in the plan and not in README:103. Re-raised as R01 above.
- R02 — repaired: `sources.toml` now records `M20P` (arXiv 1710.04513v1, certified, locators §2.1 Proposition 2.1 pp.6–7, §2.3 pp.10–11, §7.1 Theorems 7.1–7.2, Proposition 7.3, Corollary 7.4 pp.54–55; `cited_for` Scope, the SchurWeyl contract and 11.2); README:21, 137, 1457 and 1585 cite it.

## Verified sound

I read the whole diff, the four changed passages in context (README:17, 135–147, 1373–1383, 1412–1430), the module docstring and five declarations of `Suggested.lean` (unchanged since 601e2d6: `git diff --stat` of the folder lists the README only), the previous report, the plan's `gaps` and the manifest. The PR's outside-folder diff against `origin/main` is empty and the worktree is clean.

### Gate, dependency check and elaboration

Reran the gate on fbebf39: every scanner is zero and the result is OK (my invocation prints no `build` field; the worker's run reports `build=0`). Dependency check output, verbatim:

```text
depcheck: 239 roadmaps, 2347 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` exits 0 with exactly the two `sorry` warnings (lines 84 and 94). A scratch copy with `#check @name` for all five declarations elaborated: `bundleDegree`, `IsAbsolutelyIndecomposable` and `absIndecCount` keep `k`, `[Field k]`, `X`, `[X.Over (Spec k)]` and their rank, bundle and degree arguments; `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`; `absIndecCount_eq_of_degree` keeps `[Finite k]`, `IsProper`, `SmoothOfRelativeDimension 1`, `GeometricallyConnected`, then `r d d'`. Every binder is as the README states and nothing changed, so the earlier one-tactic probes (`simp`, `rfl`, `infer_instance` on both theorems, all failing; PRREVIEW~2) stand: no padding, and the headline list of the docstring is unchanged, so no newly statable headline is absent.

### The re-pointed supplier: RepresentationTheory/SchurWeyl on main

Resolved at `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` on main (merged; not an ORDER line, so no direction question). Each claim of README:137 against the section that makes it:

| README:137 claim | SchurWeyl section and line | Agrees |
|---|---|---|
| Λ_R for every commutative ring R, degree-n part = compatible families under setting the last variable to zero | §7.5, lines 826–828 (`Fin.snoc MvPolynomial.X 0`) | yes |
| graded R-algebra, specialization to every finite alphabet, projection in degree n an isomorphism for N≥n | §7.5, lines 829–832 | yes (`d ≥ n`) |
| stable Schur basis; e, h, p families; p_j → ∑xᵢʲ for j>0; no stable p₀ | §7.5, lines 833–836 and the fourth Check | yes |
| ω | §7.5, lines 838–841 | yes |
| Hall form, Schur orthonormal, distinct degrees pair to zero, ⟨p_μ,p_ν⟩=δz_μ | §7.5, lines 841–845 | yes |
| z_μ=∏ j^(m_j) m_j! | `TauCeti.zPart` at the pin, `RepresentationTheory/Symmetric/ClassSize.lean:77–78` | yes |
| over a ℚ-algebra, free polynomial ring on p₁,p₂,… | §7.5, lines 845–851 | yes |
| naturality under coefficient change | §7.5 line 850 (“coefficient-change naturality”); §7.6 line 882 (Λ_ℤ→Λ_ℂ) | yes |
| §7.6: ch_n to Λ_(ℂ,n), χ^λ ↦ s_λ, projection at every N≥n is the finite characteristic | §7.6, lines 877–879 | yes |
| isometric for (f,g)=(1/n!)∑f(σ)g(σ⁻¹), the native `TauCeti.ClassFunction.characterPairing` | §7.4 line 797–798 and §7.6 line 880; the pin's `RepresentationTheory/CharacterTable/Pairing.lean:58–61` defines it as `(Nat.card G)⁻¹ * ∑ g, f₁ g * f₂ g⁻¹`, bilinear, no conjugation | yes |
| §§7.3–7.4 supply the finite Frobenius characteristic in N≥n variables and the finite Hall form | §7.3 lines 711–713 (`TauCeti.frobeniusCharacteristic n d h`, n ≤ d); §7.4 lines 792–798 (`hallForm d R n`, `hallForm_psumPart` for n ≤ d) | yes |
| “the same ring and Hall pairing are the ones of M20P” | M20P line 203–205 (compatible families F_N with F_{N−1} = F_N(…,0)); M20P line 415–416 (Hall product by (h_μ,m_λ)=δ, equivalent to Schur orthonormality) | yes |

No object of §§7.3–7.6 is restated in this README: the deleted contract's interface (coefficient change, specialization, Schur basis, Hall pairing, power-sum pairing, stable characteristic) is exactly what §§7.5–7.6 own, and the surviving paragraph keeps only the usage conditions (perfect pairing per homogeneous part, no completion outside the complete-Adams contract) and the four worked values. The Macdonald gap (README:145) now names Λ_R of §7.5 as its carrier; its supplier QSeriesPartitionsAndMockModularForms (ORDER line 240, before this roadmap at 345) can consume a roadmap on main, and the gap's `needs` sentence in `plan.json` is unchanged and equals the README's.

### Adversarial rows for the changed passages

| Statement | Instances tried | Values computed on each side / negative control | Result; change |
|---|---|---|---|
| README:137 degree-two Hall values | p₂=s₍₂₎−s₍₁,₁₎, p₁²=s₍₂₎+s₍₁,₁₎ | norms 1+1=2 and 1+1=2, mixed 1−1=0; z₍₂₎=2¹·1!=2, z₍₁,₁₎=1²·2!=2 | agree with ⟨p_μ,p_ν⟩=δz_μ and SchurWeyl §7.4's first Check; no change |
| README:137 one-variable specialization | N=1, n=2 | p₂↦x², p₁²↦x², s₍₁,₁₎=x₁x₂↦0; stable rank 2, image rank 1 | pairing not transported for N<n, as SchurWeyl §7.4's second Check (⟨p₂,p₁²⟩ would be 1≠0); no change |
| README:137 𝔽₂ control | (x₁+x₂)² over 𝔽₂ | =x₁²+x₂², so p₁²=p₂; s₍₂₎=x₁²+x₁x₂+x₂² and s₍₁,₁₎=x₁x₂ independent | power-sum presentation needs ℚ, as §7.5 states `[Algebra ℚ R]`; no change |
| README:137 S₂ pairings against the pinned `characterPairing` | trivial·sign, trivial·trivial, (i·trivial)² | (1·1+1·(−1))/2=0; (1+1)/2=1; (i·i+i·i)/2=−1 | bilinear formula at the pin gives −1, a Hermitian form +1: convention pinned; no change |
| README:145 S-twisted pairing, both forms | λ=μ=(1); (2); (1,1) | ∏S(q^{λᵢ},t^{λᵢ}) times z: S(q,t); 2S(q²,t²); 2S(q,t)². Plethystic: p₁[SX]=S p₁, p₂[SX]=S(q²,t²)p₂, p₁²[SX]=S²p₁², paired: S; 2S(q²,t²); 2S² | the two displayed forms agree (M18 line 48–57: modifier S_{q,t}=−(q−1)(t−1) on power sums); no change |
| README:1379 §10.3 `*Needs:*` (only the carrier name changed) | g=1, r=1 on y²+y=x³ over 𝔽₂ | one-box coefficient ∏(z−αᵢ)(1−q/αᵢ) at z=1: α+ᾱ=0, αᾱ=2, value 1−0+2=3=#E(𝔽₂) (README:1359); negative control 1/(1+z) regular at 1 with pole at −1 (README:1383) | the Laurent conclusion is what the Macdonald gap and §§10.1–10.2 feed; no change |
| README:1422 Layer 10 Dependencies | list vs. union of §§10.1–10.5 `*Needs:*` | SchurWeyl §§7.3–7.6 covers the §7.5 citation of §10.3; every other citation already listed | consistent; no change |
| README:17 Scope sentence | objects: Λ_R, Hall pairing, specializations, stable characteristic | owner SchurWeyl §§7.5–7.6 for all four; Macdonald functions remain with the QSeries gap | single owner per object; no change |

### Seeded sample and headlines (unchanged statements, carried forward)

No target of the seeded sample is touched by the diff except through §10.3's `*Needs:*` wording; each row keeps the computed evidence of the report it cites.

| Statement | Instances | Values computed on the two sides / negative control | Result and provenance |
|---|---|---|---|
| 0.1 universal counting coefficient ring | reciprocal pairs at g=1, q=2 | α+ᾱ=0, αᾱ=2 for y²+y=x³, specialization of the formal tuple to (3) | Agrees. Evidence: PRREVIEW~2, row 0.1 |
| 1.6 neutrality for finite-field algebraic bands | connected band over 𝔽_q | Lang: H¹ trivial, H² neutral class exists; non-connected control | Agrees. Evidence: PRREVIEW~2, row 1.6 |
| 4.1 curve Eisenstein series | ℙ¹, rank 1 | one-line mass 1/(q−1) | Agrees. Evidence: PRREVIEW~2, row 4.1 |
| 4.4 bundle Eisenstein residue presentation | ℙ¹, rank 2 | residue at z₁/z₂=q gives the O(a)⊕O(b) terms | Agrees. Evidence: PRREVIEW~2, row 4.4 |
| 4.5 HN relations for truncated Eisenstein series | ℙ¹, O(1)⊕O(−1) | E=3; prefactor q^(−1/2) and shifts q⁻¹ give q^(−3/2), cancelling Hall q^(3/2) | Agrees. Evidence: PRREVIEW~2, row 4.5 |
| 4.6 spherical curve Hall algebra | ℙ¹ torsion degree 1, line degree d | product at O(d+1) with coefficient 1 | Agrees. Evidence: PRREVIEW~2, row 4.6 |
| 5.3 untruncated bundle pairing | rank 1, degrees −1, 0 | pairing 0 and P | Agrees. Evidence: PRREVIEW~2, row 5.3 |
| 5.8 positive-arm plethystic product | one arm, multiplicity ≤2 | coefficients (1,1,2/3) vs exp(T+T²/6) | Agrees. Evidence: PRREVIEW~2, row 5.8 |
| 6.2 eventually periodic residue extraction | r=2, b=(2,3), K=ℚ | residues (−5/2,1/2); sums 2,3; characteristic-2 denominator (1−z)² | Agrees. Evidence: PRREVIEW~2, row 6.2 |
| 6.3 Schiffmann partition residue formula | one-box partition, g=1 | A₁=H₁/(1−z) with H₁(1)=3 at q=2 | Agrees. Evidence: PRREVIEW~2, row 6.3 |
| 7.3 stable canonical Higgs moduli | rank 1, g=1 | Pic^d×𝔸¹, dimension 2=2D | Agrees. Evidence: PRREVIEW~2, row 7.3 |
| 10.4 degree-independent universal bundle count (Lean headline `absIndecCount_eq_of_degree`) | rank-one kernel q=2, a=−1; f₂(1,5)=15=f₁(15) | both eventual counts 6; wrong q=2 shift gives 10 | Agrees. Evidence: PRREVIEW~2, Layer 10 rows |
| 10.5 positivity and constants in every degree | g=1, r=1 | constant term 3>0 at q=2 | Agrees. Evidence: PRREVIEW~2, row 10.5 |
| 11.1 quasi-parabolic bundles and absolute counts | one marked point, full flag, rank 1 | count P, flag trivial | Agrees. Evidence: PRREVIEW~2, row 11.1 |
| 11.3 slope-cut and fixed-HN absolute counts | rank 1, d=−1,0, ν=0 and duals | lower-cut 0, P; upper-cut dual degrees 1, 0 give 0, P | Agrees. Evidence: PRREVIEW~2, rows 11.3–11.4 |
| 1.4 `nilpotent_matrix_count` (Lean headline) | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | 1,1,4,9 = q^(n(n−1)) | Agrees. Evidence: PRREVIEW~2, row 1.4 |
| 9.1, 9.3, 9.4 headlines | rank 1, g=1,2; 𝔸¹ | signed polynomials t²−2t³+t⁴ and t⁴−4t⁵+6t⁶−4t⁷+t⁸; q²∏(1−α⁻¹)=P | Agrees. Evidence: PRREVIEW~3, rows 9.1–9.4 |

The remaining rows of the earlier ledgers (Layers 0–8, 11, conventions) concern statements the diff does not touch or cite and are retained by reference to PRREVIEW~2 and PRREVIEW~3.

### Declared gaps

Six gaps at this head, each with a named supplier and a single `needs` sentence; the same six slugs in `plan.json` and under `## Exact supplier contracts`. None asks for what the pins, this roadmap or an earlier roadmap provide: the stable symmetric-function request that SchurWeyl §§7.5–7.6 already supply is the one the change deleted. The one textual divergence is R01.

## Not verifiable

- **M20:** Theorem 1.1, pp.302–303; Theorem 5.2, pp.312–321; Definition 5.1 and Lemma 5.1, pp.315–319. Settled uncertified in the manifest; cited by locator only, not requested.
- **FH58:** Theorem 1, p.499. Settled uncertified; the finite-matrix enumeration row is independent evidence.
- **HES81:** Theorem 5.7. Settled uncertified; unchanged use.
- **Open work without supplied files:** the two suppliers of the retained gaps that live in open pull requests (AlgebraicModuliForArithmeticGeometry §4.19, QSeriesPartitionsAndMockModularForms §3.5) are not touched by this diff and were resolved in PRREVIEW~2; they were not re-read this round.
- No new text is missing; `needs-references.toml` was not created.

## Source issues

The changed passages cite SchurWeyl, M20P lines 203 and 415 and M18 lines 48–57, all of which say what the README attributes to them. The S16 errata recorded in the previous reports are carried forward unchanged:

- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says a repeated indecomposable contributes n copies of its radical; it should be the full n-by-n matrix radical block; affects the proof.
- **Misprint** in S16 at §4.2, formula preceding (4.1), printed p.316: the source says the torsion correction is q^(−l/2) regardless of bundle rank; it should be q^(−rl/2); affects a stated result.
- **Misprint** in S16 at §5.6, identity preceding (5.18), printed p.333: the source says the arm-zero volume prefactor is q^(−∑r_i²); it should be q^(−(g−1)∑r_i²); affects the proof.
- **Misprint** in S16 at Corollary 1.9, printed p.305: the source says the origin count is the positive Fourier sum of differential residues; it should be the negative sum with the displayed definition of A⁰; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), printed p.301: the source says the reciprocal nilpotent-cone count has prefactor q^(2D); it should be q^D; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), printed p.301: the source says component multiplicity is read in cohomological degree D; it should be degree 2D; affects a stated result.
- **Misprint** in S16 at §6.11, equations (6.11)–(6.12), printed pp.351–352: the source says affine ranks D and b shift cohomological degree by D and b; it should be 2D and 2b, with the displayed twists unchanged; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed pp.301–302: the source says positivity has a Weyl-invariant integral representative in the free polynomial ring; it should be positivity of a representative whose class is Weyl invariant on the paired cone; affects a stated result.
- **Misprint** in S16 at §6.10, paragraph after (6.10), printed p.350: the source says coefficients of A give multiplicities of unshifted eigenvalue monomials; it should include q^D and combine coincident specialized monomials; affects the proof.
- **Misprint** in S16 at §6.11, Hitchin equivariance paragraph, printed p.351: the source says scaling Higgs fields gives weight one on the Hitchin base; it should give weight i on the ith characteristic coefficient; affects the proof.
