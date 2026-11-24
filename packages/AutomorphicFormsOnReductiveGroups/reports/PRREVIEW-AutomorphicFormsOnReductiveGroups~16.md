# Review of AutomorphicFormsOnReductiveGroups (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 52 changed lines since `592bdb1`. The two new sections are mathematically sound as stated. In §6.8a, holomorphic discrete series as lowest-weight modules, the chamber convention, the lowest-`K`-type formula and the contragredient route agree with §§2.4, 2.6, 6.1 and 6.8. In §7.5a the class-set inner product and the perfect pairing hold, and the pairing matches Thorne's proof of Lemma 6.4. The supplier, scope and dependency sentences match the head. There are no findings. There are three small corrections, one about the description's claim of source generality and two about §6.8a's citation and its unstated bounded realization, plus one format note. The human reviewers have one point to decide: §6.8a's sources could not be read.

## C01 — The description says every added section is stated in the generality of its source, but §7.5a states more than its source

The description says that 50 roadmaps "receive 216 sections, each a theorem published before 20 November 2026 and stated in the generality of its source, with that source named." In this folder that is not true of §7.5a. Its perfect pairing (line 1253) is stated for every `G` satisfying §7.4's two hypotheses and every finite free `O_E`-module with a continuous level action. Its only source, Thorne's proof of Lemma 6.4 (arXiv v1, p.34), treats definite unitary groups and the lattices `M_{λ,{χ_v}}`, and the README says so itself. The first statement of §7.5a, the independence of the Hermitian class-set product, names no source. The generalization is correct and §7.5a proves it. Only the description is off. It would be accurate to add: "or, where a section states more than its source (for example AutomorphicFormsOnReductiveGroups §7.5a), the general statement with its proof in the section".

## C02 — §6.8a's citation gives no theorem or page

The route of §6.8a (line 1094) cites "Harish-Chandra, *Representations of semisimple Lie groups IV–VI*; Knapp, *Representation theory of semisimple groups*, Ch. VI". That is about 150 pages of journal text and a whole chapter. Every other result in Layer 6 gives a theorem or section with pages. A reader therefore cannot find the statement that supports the three assertions, or the square-integrability of the holomorphic model. Neither text has an open legal copy, so this review could not supply the locators. Please give the theorem and page in Knapp, Ch. VI, and in the relevant paper of the series (probably VI).

## C03 — Layer 6's Dependencies say §6.8a constructs the Harish-Chandra decomposition and the bounded realization, but §6.8a states neither

The new sentence in Layer 6's Dependencies (line 1111) says that §6.8a constructs both objects on LieGroups Layer 7's complexification. In §6.8a they appear only as the first step of the route (line 1094), with no hypotheses or conclusion. An implementer who proves the lowest-weight theorem another way therefore has no stated target for them, and a later consumer of the bounded realization has nothing to cite. LieGroups Layer 7 supplies only the universal complexification (`exists_connected_complexification`). It has no decomposition `P⁺K_ℂP⁻`. One option is a short statement in §6.8a: for linear connected semisimple `G` with `G/K` Hermitian, `G ⊂ P⁺K_ℂP⁻` with unique factorization, and `gK ↦` the `P⁺`-component of `g` is a holomorphic diffeomorphism of `G/K` onto a bounded domain in `𝔭⁺`. The other is to reword the Dependencies sentence to call these steps of the route.

## N01 — The letter `E` changes meaning within §7.5a

In §7.5a's first paragraph (line 1249), `E` is "a field of characteristic zero with an involution `c`", and `M` is called "the level coefficient module `M` of §7.4". In §7.4 and in §7.5a's second paragraph, `E` is a finite extension of `ℚ_ℓ`, and §7.4's `M` is a module over an `O_E`-algebra. Using another letter for the field with involution, and citing §7.4's abstract carrier (any right `J`-module), would remove the clash.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.8a holomorphic chamber, `W_K`-invariance | `SL₂`; `Sp₄`, `λ=(2,1)` | `SL₂`: `⟨(k−1)α/2,α^∨⟩=k−1>0` for `k≥2`, `=0` at `k=1` (limit excluded). `Sp₄`: coroot pairings `2,3,1`; after the `W_K` swap `1,3,2`, all positive | holds |
| 6.8a: `𝔭⁻` kills `σ₀` | `D_k⁺`; `Sp₄`, `k=3` | `Y_cv_k=(k−k)/2·v_{k−2}=0`. `Sp₄`: `𝔭⁻⊗σ₀` weights `(1,3),(2,2),(3,1)` lie outside `(3,3)+ℕ𝔭⁺`, hence vanish by Blattner | holds |
| 6.8a: `K`-module `S(𝔭⁺)⊗σ₀` | `SL₂`; `Sp₄`, `k=3` | `SL₂`: weights `k,k+2,…`, each once, which are the `D_k⁺` types. `Sp₄`: `S(Sym²ℂ²)=⊕V_(2a,2b)`, giving types `(3+2a,3+2b)` | holds |
| 6.8a: `K`-types in `λ₀+ℕ𝔭⁺` | `Sp₄`, `k=3` | `(3+2a,3+2b)=(3,3)+(a−b)(2,0)+2b(1,1)` | holds |
| 6.8a route: holomorphic model is `π^∨` | `SL₂` at `i` | Constants have `K`-character `e^{−ikθ}`, i.e. `σ₀^∨`. `X_c` and `T^{1,0}_i` both have character `e^{2iθ}`, since `d(r_θ·z)/dz` at `i` is `e^{2iθ}` | consistent |
| 6.8a: §6.1, §6.8 conventions | `Sp₄`, `k=3` | `λ₀=(2,1)+(3/2,3/2)−(1/2,−1/2)=(3,3)=det³`, matching §6.8's check; `𝔭⁺` roots as in §6.1 | consistent |
| 6.8a Check 1 | §2.6 formulas, `ℓ=k` | `X_cv_k=(2k/2)v_{k+2}=kv_{k+2}` and `Y_cv_k=0` | true |
| 6.8a Check 2 (negative control) | `D_k⁻`, `ℓ=−k`, `k=2` | `Y_cv_{−k}=((k+k)/2)v_{−k−2}=kv_{−k−2}`; at `k=2` this is `2v_{−4}≠0` | true |
| 7.5a `classSetInner_independent` | `t↦γtu`; `Γ_i=S₃` | `f(γtu)=σ(u)⁻¹f(t)`, and the form is `J`-invariant. `Γ_{γtu}=γΓ_tγ⁻¹` (AdelicAlgebraicGroups §3.4 on main); order 6 is kept | holds |
| 7.5a `classSetPairing_perfect` | `C₂`, `S₃`; `ℓ=2,3,5` | `ℓ∤|Γ|` makes the averaging `e` an adjoint idempotent, so the pairing is block diagonal. Trivial `S₃` with `ℓ=3`: `1/6∉ℤ₃`, so the hypothesis is needed | holds |
| 7.5a Check, `GL₁/ℚ` | `J=Ẑ^×` | `h=1`, `Γ=ℚ^×∩Ẑ^×={±1}`, `(1,1)=1/2=mass`, matching AdelicAlgebraicGroups §4.5a. A unit for `ℓ` odd; `1/2∉ℤ₂` | true |
| Sample §7.5a: Thorne locator | arXiv v1 | Lemma 6.4 stated on p.33, pairing `Σ⟨f(t),g(t)⟩/#stab` and its perfectness on p.34 | matches |
| Sample §§7.4, 7.5: BCGP25 | arXiv v1 | `f(gu)=u⁻¹f(g)`, pp.130–131; Def. 5.7.2, p.131: torsion-free projection at one place | matches |
| AdelicAlgebraicGroups supplier sentence | §4.5a at head | Mass `Σ|Γ_i|⁻¹`, hypothesis `G(F∞)/A_G(ℝ)⁰` compact; absent on main, added by this pull request | consistent |
| Description: "generality of its source" | §7.5a against Thorne | Thorne covers definite `U_n` with lattices `M_λ`; §7.5a covers every `G` compact at infinity | C01 |
| Headline `compactFinite_dense_locallyConvex` (unchanged) | trivial `K`; `ℤ` control | Trivial `K`: every orbit has span ≤1, so the set is all of `E`. The `ℤ` regular rep has infinite orbit span, so compactness is used | holds |

- Source locators checked against the text: 4 (Thorne Lemma 6.4, pp.33–34; BCGP25 §5.7, pp.130–131, and Definition 5.7.2).
- Library and supplier declarations opened: LieGroups Layer 7 (`exists_connected_complexification`, no `P⁺K_ℂP⁻`); LieHighestWeight Layers 3, 7 and 9; AdelicAlgebraicGroups §3.4 (`levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹`) and §4.5a; ALS.F.1 (linear real groups).
- Cross-roadmap citations resolved: 6 (LieGroups Layer 7; LieHighestWeight Layers 3, 7, 9; AdelicAlgebraicGroups §§3.4, 4.5a). Consumers checked: DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8 cites §6.8a; ThetaChainsOnDefiniteUnitaryGroups §3.10 cites §7.5a.
- Record check: 8 layers at the merge base and the head; 0 removed or retitled. No section id reused; 0 Lean declarations changed.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with one `sorry` warning. The elaborated type of the single theorem matches README §2.1 and has no lost binder. One-tactic probe decided by reading: it is a density theorem, not closable in one step.
- Gate rerun: every check passes except the one for changes outside the folder, which lists only the pull request's own roadmap folders. Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Overlap check: scanned AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors (main), AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactorsPartII, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, ExceptionalThetaCorrespondencesForG2 (open); nothing shared. Owners: §6.8a here, with DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8 citing it. §7.5a here. SerreWeightAndLevelOptimisation §6.9 only assumes Kisin's pairing. ShimuraVarieties uses a bounded realization but owns no such target.
- Source independence: changed passages only. 3 passages of §7.5a were compared with Thorne arXiv v1, pp.33–34: the formula is forced and no run of more than three words is shared. The changed passages cite 3 sources with one locator each; §6.8a could not be compared (Knapp and Harish-Chandra unreadable). Arrangement not compared: no layer was added, removed or reordered.
- Research link: §7.5a is the duality step in Thorne (2012), Lemma 6.4, the freeness of algebraic modular forms over the diamond group ring used in patching for definite unitary groups. §6.8a is Harish-Chandra's (1955–56) holomorphic discrete series, feeding Layer 6's coherent cohomology (Harris; Boxer–Pilloni). Rests on the README and Thorne's text.

## Not verifiable

- Knapp, *Representation theory of semisimple groups* (1986), Ch. VI: Princeton University Press, with no open copy; the sources service found no legal source.
- Harish-Chandra, *Representations of semisimple Lie groups IV–VI*, Amer. J. Math. 77–78 (1955–56): no legal open copy found by the sources service.

Automatic checks set aside as false positives: the rule that a pull request must change nothing outside the roadmap's own folder (so that no stray edit to another roadmap or to the repository slips in unreviewed), when run again without the list of folders this pull request carries as its own, counted the 112 files in those folders as outside changes; every one lies in a roadmap folder the pull request adds or revises and that has its own review, so none is a stray edit.

## Source issues

- none

## For the human reviewers

- Not tested: §6.8a's only sources, Knapp 1986 Ch. VI and Harish-Chandra IV–VI (README lines 1094, 1386, 1407), have no legal open copy. §6.8a's wording and locators were not compared with them.
