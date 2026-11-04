# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at 8842d06)

**Verdict:** accepted

🤖 AI-assisted incremental re-review of 10 changed lines since 3533dfa. No findings remain. Both previous findings are repaired; the weighted identity and new consistency Checks agree with the body of Chaudouard–Laumon II. This verdict means ready for a human’s final approval.

## Previous findings

- R01 — repaired: README §4.3b, lines 1766–1778, restores the centre-index prefactor, cites the body theorem and stabilizing definition, gives coefficient 1 for Sp₄/SO₄, and checks the full-Levi specialization and a proper Levi in Sp₆.
- R02 — repaired: README §3.18a, line 1613, now gives page 14 for §4.1. Pages 7–8 correctly locate §§3.2–3.4; the previous report’s demand for page 9 confused those sections with Propositions 3.2–3.4.

## Verified sound

**Scope and mechanical evidence.** Compared the requested head with 3533dfa: only `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` changed, with six inserted and four deleted lines. `Suggested.lean` and `metadata.toml` are unchanged. The diff against `origin/main` outside the folder is empty, and the worktree remains clean. No edits were made to the pull request.

The supplied worker gate reports all counters zero, including `build=0`. Independently rerunning the gate produced:

```text
gate EndoscopicTransferAndUnitaryTraceComparison: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The independent targeted `lake build TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison.Suggested` exited 0: `Build completed successfully (8976 jobs).` Direct `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` also exited 0 with no output or warnings. Its single import is `Mathlib`; its 44 lines contain zero definitions, instances, theorems or examples. There are zero declaration signatures to compare, zero lost-binder probes, zero padding tactics to try, and no missing Tau Ceti object file to build.

The dependency command with `--movable`, the supplied order and main content printed:

```text
depcheck: 208 roadmaps, 1490 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or `moved:` line. No supplier edge was added by this repair.

**Source verification.** Four texts were fetched through the sources service from arXiv or Numdam. The two Chaudouard–Laumon texts use the exact arXiv v1 versions cited by the README. These are source-content checks, not proofs of the cited deep theorems.

| Passage checked | Legal source, locator and cache lines | Result |
|---\|---\|---|
| §3.18a, line 1613 | [cl-weighted-I](https://arxiv.org/abs/0902.2684v1), §2.1 p. 5, lines 211–220; §§3.2–3.4 pp. 7–8, lines 318–359; §4.1 p. 14, lines 611–626 | Characteristic assumption, marked Cartan lift and finite étale Weyl cover agree. Page 14 is correct. The section notation does not refer to Propositions 3.2–3.4 on page 9. |
| §4.3b recurrence and zero convention, line 1766 | [cl-weighted-II](https://arxiv.org/abs/0912.4512v1), §1.4 pp. 3–4, lines 98–146; Definition 13.2.2 and Proposition 13.2.4 pp. 72–73, lines 3189–3223 | Equal connected centres are equivalent to a finite centre quotient. Nonelliptic coefficients are explicitly zero; the recurrence has finite support. |
| §4.3b prefactor and stabilizing assignment, lines 1766 and 1772 | cl-weighted-II, Definition 16.2.1 p. 77, lines 3405–3411; Definition 16.2.4 pp. 77–78, lines 3422–3428; §19.1 pp. 98–99, lines 4477–4504 | The assignment is exactly Theorem 19.1.1’s. Substitution of the endoscopic-combination definition supplies the restored prefactor and coset index. Split, equal-characteristic, regular-semisimple and ellipticity hypotheses are retained. |
| §4.3b comparison with §4.5a, line 1766 | [wald-weighted-change](https://www.numdam.org/item/AIF_2009__59_5_1753_0.pdf), §8.4 printed p. 1815, lines 2643–2657 | Same product of centre indices. For split groups the Galois action on these centres is trivial, giving precisely the displayed coefficient. |
| New full-Levi Check, line 1777, and seeded §4.3 | [ngo](https://arxiv.org/abs/0801.0446v3), Theorem 1 p. 1, lines 16–28; equal-characteristic scope p. 2, lines 40–42 | Ordinary normalized identity has coefficient 1. The weighted formula specializes to it because finite centre indices cancel and the full-Levi weight is 1. |

The seeded sample was applied within the incremental scope: §4.3 is checked through the new full-Levi comparison. The other fourteen sampled sections are unchanged and introduce no new locator or mathematical claim in this diff; their previous review evidence is carried forward rather than presented as a fresh full review.

**Adversarial calculations.** [r4] denotes `packages/EndoscopicTransferAndUnitaryTraceComparison/reports/PRREVIEW-EndoscopicTransferAndUnitaryTraceComparison~4.md`, the report at 3533dfa. Every such row carries forward that report’s computed values for unchanged mathematics, including its earlier inherited rows. The old failing coefficient row is replaced. There are 57 rows: 50 carried forward and seven fresh. The new Sp₆ root counts were also enumerated independently in the B₃ root system; no theorem is inferred merely from elaboration.

| Statement | Instances tried | Values computed on the two sides / competing models | Result; change |
|---\|---\|---\|---|
| 1.1 crossed-module cohomology [r4] | Identity module; `[μ₂→1]` over ℝ; inversion of C₂ on C₃ | Identity: singletons. `[μ₂→1]`: H⁰ has 2 elements, cokernel's H⁰ has 1. Semidirect H⁰ has 6 elements, nonabelian. | Pass. |
| 1.2 torus duality [r4] | Split G_m; norm-one torus | H¹=0 and torsion coinvariants 0; norm-one: both C₂, invariant lattice 0. | Pass. |
| 1.3 stable classes [r4] | Regular GL₂, quadratic algebra | H¹ of centralizer torus 0; one rational class. | Pass. |
| 1.11 Kottwitz map [r4] | Norm-one torus; PGL₂; compact SU₂/ℝ | Orders 2 and 2; 2 and 2; two H¹ classes to a trivial target. | Pass. |
| 2.4 orbital normalization [r4] | Central γ | Oγ(f)=f(γ), Dγ=1; doubled centralizer measure gives f(γ)/2. | Pass. |
| 2.7 product normalization [r4] | Scalars c, c⁻¹ | Product 1; one factor alone gives c. | Pass. |
| 3.4 companion section [r4] | X²−3X+2 | Trace 3, determinant 2. | Pass. |
| 3.11 Picard dimension [r4] | Pic(ℙ¹); nodal curve; two components | `−1=0+0−1`, `0=1+0−1`, `0=2+0−2`. | Pass. |
| 3.13 δ and codimension [r4] | t²−ε, t²−ε² | δ=0 and δ=1; moving-node codimension 1. | Pass. |
| 3.14 support inequality [r4] | Abelian fibre dim 1; point | 2 and 2; 0 and 0. | Pass. |
| 3.15 purity [r4] | Point; BC₂; BG_m | 1; no positive cohomology; nonzero H². | Pass on DM scope. |
| 3.18 shift and twist [r4] | r=2, q=3 | Shift 4; Frobenius on (2) is 1/9. | Pass. |
| 3.18a cover degree [r4] | `Sp₄`, char 7, eigenvalues `1,2,−1,−2` | Differences `−1,2,3,3,4,1` all nonzero mod 7; `\|W(C₂)\|=2²·2!=8`; orderings `4!=24`. | Pass. |
| 3.18a general position [r4] | `Sp₄`, `ξ=(√2,√3)`; `SL₂`, `ξ=0` | Borels: `ξ∉ℤ²`. Klingen Levis `GL₁×SL₂`: `X^*(M)=ℤe_i`, values `±√2,±√3`. Siegel Levis `GL₂`: `X^*(M)=ℤ(±e₁±e₂)`, values `±√2±√3`. None integral. `ξ=0` projects to `0∈X_*(B)`. | Pass. |
| 3.18a `SL₂` stability interval [r4] | Saturated eigenlines of degrees `d₁,d₂`; split `(d,−d)` with `ξ₁=1/2` | `⁺a_B={H₁>0}`, `⁺a_B̄={H₁<0}`; conditions `ξ₁<−d₁` and `ξ₁>d₂`; length `−d₁−d₂=long(V/(V₁+V₂))` (CL I (5.6)); for `d₁=d₂=−1` the interval `(−1,1)∋1/2`. Split: `d+1/2<0` and `−d−1/2<0` sum to `0<0`. One line only: half-line `ξ₁<−d₁`. | Pass. |
| 3.18a elliptic stratum [r4] | `M=G` | `F(G)={G}`, `⁺C_{G,m}=a_T`, `C_m=a_T`; `a_G=0`, `vol(a_G/X_*(G))=1` by the §11.11 convention; `v_G≡1`. | Pass. |
| 3.18a count formula [r4] | Theorem 11.1 term by term; one object with 2 automorphisms; measure rescaling | Displayed `vol(a_M/X_*(M))⁻¹·vol(a,t)·Σ_hΣ_X J^G_M(Ad(h⁻¹)X,1_{D₀})` identical to lines 2623–2627; cardinality `1/2`; `a_M` measure ×2 gives `2/2=1`; torus measure ×3 gives `3·(1/3)=1`. | Pass. |
| 4.3b coset index [r4] | `G=M=Sp₄`, `s=diag(−1,−1,−1,−1,1)` | `Z_{M̂}=Z_{Ĝ}=1`, coset quotient `{s}`; `Ĝ_s=SO₄∈E(s)` containing `M̂′=SO₄` as its full Levi; `{1}` would give `Ĝ_1=Ĝ∉E(s)`. | Pass. |
| 4.3b torus Levi and recursion [r4] | `M=T`; `H=M′` | `M̂′=T̂=M̂`, theorem void; `Z_{M̂′}/Z_{M̂′}=1`, `S^{M′}_{M′}=J^{M′}_{M′,M′}`. | Pass. |
| 4.6 spherical transfer [r4] | Unit; off-support | 1 and 1; 0 and 0. | Pass. |
| 4.7a JL sign [r4] | n=2, r=1; split | −1 and −1; +1. | Pass. |
| 5.2 normalized induction [r4] | GL₂, q=4 | δ_B=1/4, δ_B^{1/2}=1/2, inverse 2. | Pass. |
| 6.8 unramified BC [r4] | Root 2, degree 2; blocks 2+1 | 4 and 4; parities 1, 0. | Pass. |
| 6.16 central complement [r4] | Torus; zero test | 0 noncentral, 1 and 1; 0 and 0. | Pass. |
| 6.17 twisted distribution [r4] | Full Levi; G_m with inversion | I=J; `1−θ=2`, factor √2 vs 1. | Pass. |
| 6.28 coefficients and character [r4] | G₄, G₂,₂; Steinberg | `ι=1/4`, `τ(H)ι=1`, `τ(G)ε=1`; −1 and −1. | Pass. |
| 7.3 alternating trace and frame [r4] | H⁰,H¹ one-dimensional; scalar 2 | 1−1=0 vs (1,1); 1/2 vs 2. | Pass. |
| 7.10a correspondence [r4] | E³, scalar 2 | 3 and 3; 6 and 6. | Pass. |
| 8.2/7.10a Haar idempotent [r4] | vol 1/4, dim 3 | 3/4 vs 3. | Pass. |
| 8.9 constant term [r4] | Modulus 4, value 1/2, Weyl 4 | 2 vs 1. | Pass. |
| 8 Fourier coefficient [r4] | C₂ | `(1+1)/2=1`, `(1−1)/2=0`. | Pass. |
| 9 raw cohomology [r4] | Zero vs identity differential | Euler 0 with H⁰=H¹=E vs both 0. | Pass. |
| 10 trace recognition [r4] | Bases 1/2, 1/3 | `−1/6`; shifted `−2^{−N−1}3^{−N−1}`. | Pass. |
| 10.23 monodromy [r4] | q=3, F=diag(1,1/3) | `FNF⁻¹=N/3`; dim ker N 1 vs 2. | Pass. |
| 10.28 pair factors [r4] | Roots 2, 3 | Root 6, factor `(1−6q^{−s})⁻¹`, ε=1. | Pass. |
| 10 inner-form comparison [r4] | Trivial, Steinberg | −1, +1, sum 0. | Pass. |
| 11.0a threshold and weight [r4] | GL₄, e_F=1; rank-one hull | `p>17`; weights 1, 0, 1. | Pass. |
| 11.0f exterior-square hypotheses [r4] | `σ=χ⁻¹`, symplectic `π`; `σ∈T^S(m)` | `σχ=1`, `∧²Sym³V=Sym⁴V⊕1`, `6=5+1`, pole survives; `σ_v` ramified so `σ∉T^S(1)`. With `σ` unramified at `v`: `ω_σ\|_U=1`, `ω_π\|_U=1`, so `ω_{Σ_χ}²\|_U=χ^{2m}` (even `m`) or `χ^{4m}` (odd `m`): `χ⁴,χ⁴,χ¹²,χ⁸`; each exponent divides 24, so `χ^{24}\|_U≠1` forces each ≠1; `w₀ω=ω⁻¹≠ω`. | Pass. |
| 11.0f `D₄` Levi [r4] | `Spin₈`, central node | Roots of `M`: `e₁−e₂, e₃−e₄, e₃+e₄`, type `A₁³`; `Z(M)°=λ(G_m)`, `λ=(1,1,0,0)`; `X^*(M/M_der)=ℤ(1,1,0,0)`, `⟨χ₀,λ⟩=2`, so `λ(t)∈M_der` iff `t=±1`; on the weight `(½,½,½,½)`, `λ(−1)` gives −1, `α₁^∨(−1)` gives +1, `α₁^∨α₃^∨α₄^∨(−1)` gives −1: `λ(−1)=(−I,−I,−I)`. Kernel of `G_m×SL₂³→M` is `⟨(−1,−I,−I,−I)⟩`. `j` kernel `{(1,I,I,I),(−1,−I,−I,−I)}`; image = equal-determinant triples, dim `12−2=10`, rank `6−2=4`. `α₂`-coefficient-1 roots: `12−3−1=8`; coefficient-2: 1. | Pass. |
| 11.0f triple-product twist [r4] | Twist `σ` by `χ` with `χ_v^4\|_U≠1` | New `ω₀χ²`; square `ω₀²χ⁴\|_U=χ⁴\|_U≠1`, so `ω₀χ²≠1` too and `L(2s,ω₀χ²)` is entire and nonzero on `Re s≥1/2`. `m=1` input: roots `zac,zad,zbc,zbd` (4) vs 8 for three rank-two inputs. | Pass. |
| 11.0h converse theorem range [r4] | `n=6` | Kim Theorem 2.1 needs `m<n−1=5`, i.e. `m≤4`, as stated. | Pass. |
| 11.0h exterior-square and tensor parameter checks [r4] | Roots 1,2,3,4; (1,2),(3,5) | Product `13824=24³`; roots 3,5,6,10, determinant 900. | Pass. |
| 11.0h `SO₄` multiplicity [r4] | Dihedral order 10, `j=1,2`; `3+1`; `Sp₄` | `diag(ζ^j,ζ^{−j})` and `[[0,1],[1,0]]` preserve `x₁x₂`; dets 1 and −1 (sign); `ζ^j≠ζ^{−j}` so irreducible; sum: det `1`, symmetric rank 4, both degrees even, `m_ψ=2`. Symplectic pair: symmetric-form space 0. `3+1`: odd summand, `m_ψ=1`. `Sp₄` (type C): 1. | Pass. |
| 11 packet multiplicity [r4] | C₂ | 0 and 1. | Pass. |
| 12 tower degree [r4] | n=1 | 0, sign 1, twist 0. | Pass. |
| 12.5 period equivariance [r4] | `[[1,1],[0,1]]` | Inverse transpose `[[1,0],[−1,1]]`. | Pass. |
| 12.14 sectors and heights [r4] | C₃; rank two | Dimension 1 vs 0; shifts 2 and 1. | Pass. |
| 13 oldforms [r4] | q=3, index 48, dim 4 | 1/12 raw vs 4 normalized. | Pass. |
| 14 signed comparison [r4] | Two equal terms | 0 vs (1,1). | Pass. |
| 15 ledger and Satake export [r4] | 2,−1,3,5,7; roots 2,3 degree 2 | −210 vs 210; `X²−13X+36`. | Pass. |
| 3.18a corrected locator and Cartan cover (fresh) | Split Sp₄ in characteristic 7; regular Cartan point | Weyl-cover fibre: 2²·2!=8 lifts versus 4!=24 unrestricted eigenvalue orderings. Source §§3.2–3.4 are pp. 7–8; §4.1 starts p. 14. | Pass; page 13 corrected to 14. |
| 4.3b finite prefactor and infinite-index convention (fresh) | M̂=GL₁×SO₅, M̂′=GL₁×SO₄; generic t=2 in Sp₆ | Equal connected centres GL₁; centre quotient (GL₁×μ₂)/GL₁ has order 2. Generic centralizer GL₁×SO₄ has centre dimension 1 versus 0 for SO₇; inverse-index coefficient is defined as 0. | Pass; finite nonzero prefactor, nonelliptic terms vanish. |
| 4.3b stabilizing assignment (fresh) | Sp₄ full Levi; Sp₆ proper Levi | Definition 16.2.1 gives Jᴱ=2·(S/2)=S and Jᴱ=2·(S₊/2+S₋/2)=S₊+S₋. Definition 16.2.4 and Theorem 19.1.1 give J=Jᴱ. Old values: S/2 and (S₊+S₋)/2. | Pass; prefactor restored. |
| 4.3b repaired Sp₄ Check (fresh) | G=M=Sp₄, s=diag(−1,−1,−1,−1,1) | Z(SO₅)=1, Z(SO₄)=μ₂, coset quotient {s}; coefficient 2·(1/2)=1 in both body theorem and README. Both full-Levi weights are 1. Index {1} requests an avatar outside its domain. | Pass; previous R01 repaired. |
| 4.3b new full-Levi Check; sampled §4.3 (fresh) | M=G, elliptic centre index d; d=2; identity endoscopy control | One coset class; coefficient d·d⁻¹=1 with d finite and positive. For d=2: 2/2=1. Identity endoscopy has d=1 and coefficient 1, but lies outside M′≠M. With discriminant ratio 1 and stable term 1: ordinary normalized sides 1=1, not 1=1/2. | Pass; agrees with Ngô Theorem 1. |
| 4.3b new Sp₆ Check (fresh) | M=GL₁×Sp₄; dual coordinates (t,−1,−1), t=1,−1,2 | B₃ centralizer root counts: 6,12,4; dimensions: 9,15,7. At 1: SO₃×SO₄, centre order 2; at −1: SO₆, centre order 2; at 2: GL₁×SO₄, centre dimension 1. Coefficients 1,1,0. Dual groups Sp₂×SO₄ and SO₆ give S₊+S₋ on the right; old coefficients were 1/2,1/2. | Pass; exactly two elliptic terms. |
| 4.3b ↔ 4.5a and 11.0a (fresh) | Split Sp₄ and Sp₆ cases | Waldspurger §8.4 centre-index product is 2·2⁻¹=1 for all three elliptic terms above; CL II and README also give 1. Generic Sp₆ parameters are excluded from the elliptic index set, agreeing with coefficient 0. | Pass; characteristic-change and twisted-reduction inputs agree. |

**Affected interfaces and ownership.** Read the changed targets and their dependency lines, the cohomological input in §3.18b, unweighted comparison in §4.3, characteristic-change interface in §4.5a, twisted reduction in §4.10b and weighted identity in §11.0a. Their coefficient normalizations now agree. No new carrier or ownership boundary was introduced.

Resolved eight relevant supplier locations in five roadmaps against main or the indexed open head:

- `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3098`, §6.10 (cited as AS.6.10), supplies ordinary weighted orbital integrals; line 3184, §6.15, supplies invariantization. Its full-Levi weight is 1 and centralizer-measure scaling is inverse. The endoscopic stable avatars remain owned here.
- `TauCetiRoadmap/ReductiveGroupsPartII/README.md:4794`, RG2.3.6 on main, supplies Moy–Prasad filtrations, including the equal-characteristic local-field setting.
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2817`, §1.19 in Layer 1 on main, supplies algebraic and Deligne–Mumford stacks and representable morphisms.
- `TauCetiRoadmap/AlgebraicCurves/README.md:527` and `:571`, Layers 4–5 on main, supply Riemann–Roch and positive-degree consequences, the existing curve inputs of §§3.18a and 4.3.
- `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:5524` and `:5833`, §§5.6 and 5.8 at its indexed head, supply pure perverse decomposition and relative hard Lefschetz used through §3.18b. Its planned `CohCorr` and `CohCorr.rgammac` API resolves the worker’s two unchanged name leads; these are supplier targets, not claimed pinned declarations.

The citation resolver again found no missing cross-roadmap citation. Its rerun did not inspect pinned library names, so that output is not used as evidence about the libraries. Object searches using `roadmaps grep`, pinned trees and board package READMEs found no new conflicting owner for the repaired identity. Board designs for AbelianSurfacesModularity and LocalLanglandsCorrespondenceForG2 treat the weighted lemma as an input or hypothesis, not a construction they own. The previously reviewed ownership of truncated Hitchin fibrations and endoscopic weighted identities is retained. No additional open pull requests without checkouts supplied in the brief were independently reviewed for ownership.

**Pinned APIs and headline coverage.** Library heads match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Two native definitions were reopened. `WittVector.Isocrystal` in `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` is a module with a Frobenius-semilinear equivalence; it supplies neither a tensor G-isocrystal nor an orbital distribution. `TauCeti.reductiveCommHopfAlgProperty` in `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70`, expanded at line 78, specifies smoothness, geometric connectedness and absence of connected normal smooth unipotent subgroups. It does not define endoscopic data, Hitchin stacks or weighted orbital integrals. Searches of both pinned trees found no weighted-fundamental-lemma or truncated-Hitchin implementation replacing this target.

The unchanged module docstring accounts for the README’s headline families: stable-class classification and Kottwitz duality; Fourier compatibility of transfer; Ngô support and geometric stabilization; fundamental lemmas and smooth transfer; stable–twisted trace comparison; trace-defined local Langlands comparison and packet formulas; Igusa torsor and stabilized trace comparison; compact-unitary realization; local-tower comparison and supercuspidal cohomology; basic Hecke identities; pure unitary transfer, oldform dimensions and signed spectral exports. The changed weighted theorem still needs Hitchin, endoscopic and weighted-distribution carriers, not a few simple definitions. No newly statable headline, stand-in, padding declaration or Lean mismatch is introduced.

## Not verifiable

- The previous report’s five unchanged locator-only texts remain uncertified: `wald-weighted-twisted` Theorem 3.8; `arthur-classification` Theorems 1.5.1, 1.5.2, 2.2.1 and Chapters 6–8; `henniart09`; `jacquet-shalika90` §8 Theorem 1; `hiraga-saito12` Theorem 4.14. The previous review records their legal-access limitations; no new request is made for these settled texts.
- This round read the cited arXiv versions of Chaudouard–Laumon I and II, not a fresh comparison with published pagination. All newly added source locators were readable. Untouched mathematics and earlier source checks are carried forward under the requested incremental-review scope.

## Source issues

- **Error** in cl-weighted-II at Théorème 1.4.1, arXiv v1 printed p. 4: the source states the weighted identity without the finite centre-index prefactor; it should include `|Z_{M̂′}/Z_{M̂}|`, as Definitions 16.2.1, 16.2.4 and Theorem 19.1.1 require; affects a stated result.
- **Misprint** in cl-weighted-II at Théorème 1.4.1, arXiv v1 printed p. 4: the source indexes the sum by the centre quotient without its coset representative; it should index by `sZ_{M̂}/Z_{Ĝ}`, as the preceding paragraph and Definition 16.2.1 do; affects a stated result.
