<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6783848181 -->
Review (codex) of bd5007c

Verdict: needs_changes

1. **F01** (P1) The p-adic topology makes the finite-K pieces discrete, not compact

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:851`: “with its p-adic topology”; `:869`: “with its induced topology”; `:873`: “The invariant piece is compact in its induced topology.” The topology propagates through §§5.3–5.4 to the topological factorisation at `:1061`.

   **Claim:** H⁺ = lim_k colim_K H¹_ét(M^p_(n,K), (O_L/p^k)(1)) has the p-adic topology, but every (H⁺/p^k)^(G_K), with its induced topology, is a compact Pontryagin dual of finite smooth length.

   **Witness:** At p=5, L=ℚ₅, n=0, K unramified quadratic, integral Steinberg measures μ_j=δ_(5^j)−δ₀ pair to 1 with 1_(5^jℤ₅×). Their reductions give infinitely many distinct G_K-fixed points in a discrete quotient.

   Here are the details needed to reproduce the contradiction. Over K the level-zero space splits into two copies of Ω (the repaired §0.1). Its geometric integral cohomology contains the mass-zero integral measures on ℙ¹(ℚ₅), by the integral Steinberg comparison explicitly imported at README:107 from ProetaleCohomologyOfPAdicCurvesAndTowers §6.9 (`packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:741`). The twist (1) makes the Galois action on this Steinberg term trivial; G_K fixes the components. These measures therefore satisfy the almost-smooth condition of §5.1. The saturation in §5.2 makes their nonzero reductions in geometric integral cohomology nonzero reductions in H⁺ as well.

   For different j and l, the indicator of 5^jℤ₅× distinguishes μ_j from μ_l modulo 5. Thus (H⁺/5)^(G_K) is infinite. The topology declared in §5.1 makes 5H⁺ open, hence H⁺/5, and its invariant subspace, discrete. An infinite discrete space is not compact. The same example shows the action is not continuous in that topology: for μ=δ₀−δ_∞, u(5^j)→1, but u(5^j)μ−μ=μ_j never belongs to 5H⁺. In compact convergence, by contrast, μ_j→0. This is the norm-versus-compact-convergence obstruction of the previous F01, now in the integral arithmetic space rather than in the notation Π*.

   The cited source does not justify the topology replacement. CDN23 Proposition 5.19, printed pp. 69–70, uses topological O_L[[H]]-modules (CDN23 line 2683), and Remark 5.20 uses the natural topologies on the torsion cohomology stages and their inverse limit (CDN23 line 2691). These retain compact infinite mod-p pieces. Algebraic p-adic completeness in Corollary 5.17 does not identify this topology with the topology having p^kH⁺ as a neighbourhood basis.

   **Exact repair:** Give the finite-K torsion groups their natural profinite cohomology topologies, form the indicated topological inductive limits over K and the projective limit over k, and specify the topology on L⊗H⁺ induced by this construction. Retain p-adic separatedness/completeness as algebraic assertions. Carry those stage topologies through the evaluation and completed sums in §§5.4 and 6.6; distinguish algebraic p-adic completion from a declaration that every torsion quotient is discrete. Keep the p-adic topology specifically assigned to the multiplicity module m_(n,B) in §5.3, as CDN23 line 2744 does; it is not the erroneous topology on H⁺. Add the level-zero measure sequence as a negative-control Check.

   **Repair tested on the witness:** On the integral Steinberg lattice, the repaired topology is pointwise convergence on continuous integral functions, equivalently compact convergence on its bounded set. Every continuous f has f(5^j)−f(0)→0; a finite-net argument makes this uniform on compact sets of functions. Thus μ_j→0. The mod-5 dual of the smooth Steinberg representation is infinite profinite, not discrete, so the compactness assertion and continuous G-action are consistent.

2. **F02** (P3) A smooth vector need only have an open stabilizer

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:480`: “fixed by G, as a smooth vector must be”.

   **Claim:** The first Check of §3.1 identifies smoothness with invariance under all of G. Constancy on a single half-plane is an invariant special case, not the smooth-vector criterion used in the preceding proof.

   **Witness:** On split level zero take f=(1,−1). Its Lie derivative is zero; its stabilizer has even determinant valuation and is open. But diag(p,1) swaps the components, sending f to −f≠f.

   This uses the package's own repaired component action (§0.1 and §7.5), in characteristic zero, including p=2. It does not refute the smoothness theorem of §3.1: the proof there correctly concludes locally constant orbit maps.

   **Exact repair:** Replace the implication by “a smooth vector is fixed by an open subgroup”; describe constants on Ω as a special case fixed by its natural G-action. If working inside M^p_0, distinguish one component's stabilizer from the full action that exchanges components. Add the displayed two-component example to the Check.

   **Repair tested on the witness:** f is fixed by the open kernel of v_p(det) modulo 2, has zero infinitesimal action, and is not fixed by diag(p,1). The corrected criterion accepts f without asserting G-invariance.

## Previous findings, checked first

The round-3 review and round-4 repair report were read as claims to verify. None of their five findings was marked not actionable. The earlier settled continuous-cohomology supplier contract remains settled; it is not re-raised.

| Previous finding | Repaired passage in this package | Verification and status |
|---|---|---|
| F01, Banach-dual topology | README:47: “write W* for its continuous dual with the topology of uniform convergence on compact subsets of W”; §4.10 distinguishes agreement on bounded sets. | Repaired at the cited Banach-dual sites and in the Lean docstring. **Partly repaired package-wide:** the same topology pattern remains in §§5.1–5.2, R01. Dirac differences have norm 1 but compact-convergence limit 0. |
| F02, coefficient-dual fibre and rank | README:1072: “Ǎ/TǍ = 0 while Ǎ[T] = L·ev₀”; Layer 6 Example: “The family ρ_(B,M) has rank two”. | **Repaired.** On A=L⟨T⟩, multiplication by T on Ǎ is the surjective left shift on bounded sequences, with kernel L·ev₀. Ordinary fibre is 0; torsion is L. The rank-two assertion now applies only to ρ. |
| F03, arithmetic descent | README:45: “Σ₀ is connected over ℚ_p and splits as Ω⊔Ω only over a field containing ℚ_p²”. | **Repaired.** Frobenius swaps the two height classes. Over ℚ_p, its unramified quadratic extension and a ramified quadratic extension, H⁰ has dimensions 1,2,1. The Layer 7 split examples now explicitly extend scalars. R02 catches a different residual misuse of the same component action. |
| F04, weighted quotient | README:1111: “two copies of π′⊗Sym¹”; the algebraic action on Sym¹ is retained. | **Repaired.** At k=1, pI acts by p on the middle term and cokernel, while four smooth copies would give 1. At k=0 the scalar is 1. |
| F05, special-type inverse twist | README:1004: “the G-factor by χ_G⁻¹”; the following Check uses a cubic character at p=7. | **Repaired.** If χ(a)=ζ₃, the dual scalar is η(a²)⁻¹ζ₃; the erroneous positive twist gives η(a²)⁻¹ζ₃². A quadratic test alone would miss it. |

The repair passages and their consumers were read again: Conventions, §§0.1–0.2, 4.2, 4.9–4.14, 6.1–6.6, 7.2, 7.5–7.6, their Examples, source correction E20 and the module docstring. Unchanged text was not accepted merely on the strength of the earlier review's prose summaries: all 51 numbered targets were reread; only earlier rows with explicit computed values were reused as tests.

## Verified sound

There are **two findings: one P1 and one P3**. The package remains repairable within its present scope. The findings are mathematical/topological and a false Check, not missing Lean carriers or a reason to re-plan the roadmap.

### Principles, shape and completeness

The README has 51 numbered targets, eight layers, 51 Needs lines, eight Examples subsections and eight Dependencies subsections. I read every Needs line, convention, definition, API and Check. The 17 subsections with explicit definitions/API introductions have at least three Checks (counts 5,4,3,3,4,3,4,3,3,3,3,3,3,4,3,6,3 in subsection order). The other theorem subsections have hypotheses and source locators. R02 is a false Check rather than a missing Check count.

The Part II boundary is explicit in the Summary and ownership section. The base owns the correspondence, analytic quotient, coordinate operator, abstract line independence and conditional trivial-central-character comparison. This package adds the embedded comparison, homographic covariance, global-hypothesis discharge, general-central-character realisation and geometric/arithmetic consequences. It imports full Weil–Deligne type rings and the projective envelopes rather than constructing competing objects. The half-plane's integral and pro-étale comparisons remain with the general geometric supplier. The first-cover model here adds Teitelbaum's explicit equivariant geometry to that supplier's existence statement.

Layer order is mathematical: the equation and pairing feed the common dual; covariance and global inputs feed realisation; geometric multiplicities and integral blocks feed typewise factorisation. Layer 7 collects consequences with their individual Needs. I found no layer named after a source chapter, instruction to follow a source's arrangement, unexplained source-order dependency, computational algorithm, copied source passage, process narrative, machine path, HTML anchor or pull-request number in the roadmap text. Main-branch examples consulted for shape were QuadraticCharactersAndReduction, LocalGaloisGroups and ProfiniteCohomology. The sparse metadata contains only the topic and adds no incompatible claim.

The p>2 hypothesis is confined to the mod-p finite-length input in Layer 5; p>3 is retained where generic semisimplicity is used in Layer 6. The geometric theory and p=2,3 conventions are not narrowed to those primes. Non-p-central intrinsic types are distinguished from their zero multiplicities in the p-central quotient. No route-specific shortcut was found.

### Computed adversarial evidence

These rows record actual values, including all 15 seeded targets, the headline statements, all five previous repairs, and both findings. Elementary tests distinguish wrong models and hypotheses; they do not substitute for the cited deep theorems. The full working ledger also records values for the remaining numbered subsections.

| Statement | Instances tried | Computed values on each side | Result / change |
|---|---|---|---|
| Conventions, §§0.1 and 7.5: levels and descent | p=2,3; n=0; split and nonsplit quadratic fields | First full-cover degrees p²−1 are 3,8. Frobenius on L² swaps coordinates. Fixed-space dimensions are 1,2,1 over ℚ_p, unramified quadratic, ramified quadratic. | Descent repair passes; split copies over ℚ_p would give 2,2,2. |
| §§0.2–0.4: multiplicity, dual, Tate convention | Z=W⊗ρ; basis e₁,e₂ | Hom_Ǧ(ρ,Z)=W, evaluation gives W⊗ρ. Wedge sends e₁ to e₂*⊗(e₁∧e₂). Fil⁰ dimension 1, Fil¹ dimension 0; φ on ℚ_p(1) is p⁻¹. | Multiplicity is not the isotypic tensor product; twist and dual match. |
| §§1.1–1.2: equation, polynomial injectivity | Lines Le₁,Le₂; trivial rank-one equation | Filtered lattices Re₁+tRe₂ and tRe₁+Re₂ intersect in tR²; N is R² for both. ∇1=0, so nonzero P=X fails on the rank-one trivial equation. (∇−1)(tx)=t²∂x. | Weight and nontrianguline hypotheses discriminate; ∂-bijectivity is imported. |
| §§1.3–1.5: P-finite and infinitesimal conventions | p=2, cyclotomic i; weights 0,1 | σ(i)=−i, whereas a constant shell is unchanged. Nonzero constant trace sum is p^(nk)≠0. Casimir is 0; −∂²t=−t∂²−2∂. | Equivariance, infinite slope and operator ordering are real conditions. |
| §1.6: differential residue pairing | Laurent monomials and one trace step | res(dt/t)=1, res(dt)=0; p^(−n−1)Tr(1)=p⁻ⁿ. Under res(fg dt/t), the orthogonal of L[[t]] is tL[[t]], not t²L[[t]]. | Corrected t factor and trace normalisation pass. |
| §1.7: Kirillov duality and smooth criterion | One-shell support; zero functional; p=2 | Pairing sum has exactly one nonzero shell contribution; zero functional gives 0. Constant trace is p^(nk), not 0; ζ₂−1=−2≠0. | Compact support and trace-vanishing criterion retained. |
| §2.1: embedded common dual | Two-chart sections; two period lines | (0,y), y≠0, is not zero; both zero restrictions give 0. Distinct D⁺ lattices intersect in tR², despite identical N. | Abstract isomorphism does not replace embedded equality; second chart/fixed radius remain inputs. |
| §2.2: homographic covariance | Translation, Weyl element, scalar matrix | u⁺z=−1; w u⁺w(z)=z²=−z²u⁺z. Translation conjugates ∂ to ∂−b; scalars leave ∂ unchanged. | Signs and map directions pass. |
| §§2.3–2.4: irreducibility and weight change | Smooth subrepresentation; k=0,1,2 | π is nonzero inside Π^an and vanishes in Π^an/π. Central weight-two correction a⁻²a²=1. Casimir at k=0,1 is −1/2,0; determinant factor at k=2 is p, compensated by δ₂(p)²=p⁻¹. | Quotient and unitary twist are essential; no assertion of irreducibility of Π^an itself. |
| §3.1: global hypotheses and smoothness | f=z; two components; ρ=1⊕1; tree displacement | Lie values on z: −1,−z,z,z². On f=(1,−1), Lie values 0 but diag(p,1)f=−f. Hom(1⊕1,1)=L². Scaled u(p⁻¹) has elementary divisors 1,p², tree distance 2. | Global proof inputs resolved; smoothness Check needs R02; irreducibility and affinoid stabilizers cannot be omitted. |
| §3.3: all supercuspidal central characters | Quadratic character of ℤ₇×; marked lines | Character group of 𝔽₇× has order 6; square characters form order-3 subgroup, so its order-2 character is not a square. diag(1,2)(e₁+e₂)=e₁+2e₂. | Generalisation cannot assume a character square root; scalar ambiguity is correctly marked. |
| §§4.1–4.2: slope and Steinberg | Slope 1/2 versus 0; Dirac measures | Positive-slope φ=1 period term is 0; slope-zero trivial term contains 1. δ_a−δ_b has mass 0 and residues +1,−1; δ_a has mass 1. μ_j has norm 1 and compact limit 0. | Slope restriction and repaired Banach-dual topology pass. |
| §4.3: partial operator | Eigenvalues 1,2; dimension 0 | Completing column (−2,3) gives trace 3, determinant 2; (2,3) gives determinant −2. Dimension 0 has empty spectrum. | Source sign corrected; no arbitrary full-domain spectrum claim. |
| §4.4: period multiplicities | V=0; V=L; period-line V | H_C(0)=0; H_C(L)=L⊗_ℚ_p F, dimension [F:ℚ_p] over L. H_M(V_(M,ℒ)) has dimension 1. | Correct tensor base and rank-one period multiplicity. |
| §§4.5–4.6: Galois comparison/classification | Quadratic L; N(e₂)=e₁; two embeddings of F | L⊗_L L has dimension 1; L⊗_ℚ_p L has dimension 2. ker N and coker N each have dimension 1. Weight totals: 0+1=1 over ℚ_p, (0+0)+(1+1)=2 over quadratic F. | No false H¹ vanishing; rational-base classification kept distinct from general F. |
| §4.7: line extension | Rescale generator by a; two different lines | Quotient normalisation contributes a⁻¹, so total a·a⁻¹=1. Distinct lines intersect in 0; corresponding extension preimages intersect in dO[M] over ℚ_p. | Rational function base, source/target and normalisation pass. |
| §4.8: bounded vectors | Scalar p-action; trivial action; seminorms indexed by i | Orbit norms p⁻ⁿ are unbounded as n→−∞; trivial orbit has one value. Bounds r_i=i exist separately but have no common finite upper bound. | Per-seminorm quantifier is correct. |
| §4.9: étale equals bounded | Translates of z; constants; torsion stages | Translates z−b have unbounded constant term. Constants are bounded but have supercuspidal multiplicity 0. L⊗(O_L/p^k)=0 for every k. | Bounded-function elimination applies in the geometric setting; p cannot be inverted before limits. |
| §4.10: bounded duals | Π=L and Π=St^cont | Scalar case all topologies agree. In St*, μ_j→0 compactly but ‖μ_j‖=1. On each fixed norm ball pointwise and compact convergence agree. | Previous F01 repaired here. |
| §§4.11–4.14: occurrence, Banach multiplicities and socle | Two allowed rank-two factors; dim JL(M)=d; special character; dimension-three V | Direct sum has length 2. Differential multiplicity dimension d; étale multiplicity dimension 2d. Special-character multiplicity dimension 1. Absolutely irreducible dimension-three V has multiplicity 0. Non-p-central types give 0 geometrically. | Hypotheses, dual direction and three cases agree with sources. |
| §§5.1–5.2: topology and saturation | p=5, level 0; ramified O with ϖ²=p | μ_j mod 5 are infinitely many distinct fixed points. Declared topology: discrete; claimed topology: compact. O/p has length 2, k_L length 1. pH is complete/torsion-free but not saturated. | R01; saturation and ramified-coefficient Checks themselves pass. |
| §§5.3–5.5: evaluation, completion and dual finiteness | End(P) acts by composition; coordinates p^i; absent block | (f∘e)(x)=f(ex). Mod p^k only the first k coordinates of (p^i) may survive; (1,1,…) has infinite support. Absent block has m=0, dual 0, generator count 0. | Balanced tensor and algebraic completion pass; retain stage topology under R01. Finiteness belongs to the dual over R^ps. |
| §§5.6,6.1: type sectors and interpolated family | Central character δ; empty type locus; nonempty point | δ⁻²δ²=1. Empty ring R=0 gives zero family. ρ_x has dimension 2; Π(ρ_x)* is infinite-dimensional. | Rank-two language now applies only to ρ. |
| §6.2: special-type twist | p=7, χ(a)=ζ₃, χ(p)=1 | Actual dual scalar η(a²)⁻¹ζ₃ equals the inverse-twist formula; positive twist gives η(a²)⁻¹ζ₃². Quadratic twist would give equality and miss the defect. | Previous F05 repaired. |
| §§6.3–6.4: rigidity and annihilator | diag(1,T); L[T]/T² | Matrix rank 2 generically, 1 at T=0. On L[T]/T², T acts as 0 on every closed fibre but T·1≠0 globally. | Fibre tests alone do not prove the annihilator; stronger integral route retained. |
| §6.5: typed multiplicity | R=L; coefficient dual action | Ř=L, so tensor formula reduces to ordinary multiplicity. (r₁r₂ℓ)(s)=ℓ(r₁r₂s). | Module side correct; dual local freeness is a target, and p>3 retained. |
| §6.6: factorisation and coefficient-dual specialisation | A=L⟨T⟩; κ quadratic over L | T on Ǎ is left shift: kernel L·ev₀, cokernel 0. Flat P gives (P⊗Ǎ)[T]=P/TP, ordinary fibre 0. Hom_L(κ,L) has L-dimension 2 and κ-dimension 1. | Previous F02 repaired. Topological factorisation still depends on repairing R01. |
| §§7.1–7.2: weighted realisation | u(b)w; scalar a; k=0,1 | Automorphy denominator is b−z by both cocycle computations. Scalar factor a⁻ᵏ. At k=1: middle p⁻³p⁴=p, line preimage p⁻¹p²=p, quotient p; four smooth copies would give 1. | Previous F04 repaired, k=0 recovers the de Rham row. |
| §7.3: first cover | p=2,3; three marked projective points | Full degrees 3,8; component counts 1,2 and component degrees 3,4. Derivative of z−z^p mod p is 1. diag(1,c) fixes 0,∞ but sends 1 to c. | Small-prime model and need for third line pass. |
| §7.4: Iwasawa invariants | Zero class; trivial representation as negative control | Every specialization of 0 is 0. For trivial V=L, H¹_e(ℚ_p,L)=0, whereas H¹_f(ℚ_p,L) has dimension 1. | The condition is exponential image, not crystalline local condition; theorem is rank two on the specified nontrianguline type. |
| §7.5: infinitely primitivable functions | Split f=(1,−1), j=0,1,2 | j-th derivatives of (z^j/j!,−z^j/j!) equal (1,−1). Pullbacks have equal coordinates. | Corrected containment passes, conditional on the fixed-radius supplier gap on supercuspidal sectors. |
| §7.6: filtered derived realisation | Nontrivial supercuspidal sector; trivial sector | H¹[−1][1] is in degree 0; Hom dimension 2, Fil⁰ dimension 1, Fil¹ dimension 0. Trivial sector has H⁰≠0. | Fixed sector, shift and filtration are necessary and present. |
| §7.7: boundary sheaf | Empty open; disjoint pair; collar shift i↦i+c | Empty sections 0; disjoint pair gives two factors; shifted indexing has the same cofinal limit. | Sheaf construction is a target; conjectural identification is not asserted. |

### Source sample and manifest

All five manifest works were readable in the supplied legal cache: DLB17, CDN20, CDN23, COLMEZ19POIDS and TEI90. Every cited work has an entry; no new source fetch or manifest change was needed. There is no author-flagged unverified locator left in the package. Page references below are the printed pages of the versions the README identifies, not the PDF page counter (CDN23's counter is one greater). The sample contains 15 targets.

| Target | Text opened at its locator | Hypotheses/support checked |
|---|---|---|
| 0.1 | DLB17 lines 104–116, p. 3; CDN23 lines 205–235, pp. 5–6; CDN23 line 2343, p. 61 | DLB cover level r equals CDN level 2r; p-central quotient and the Frobenius component action. DLB's split description over ℚ_p is corrected, not copied. |
| 1.2 | DLB17 Lemme 6.3, line 1250, p. 31; Proposition 6.4, line 1259, pp. 31–32 | Nonzero polynomial, absolute irreducibility, dimension two and nontriangulinity; de Rham hypothesis added for ∂-bijectivity. Supplier owns the latter. |
| 1.6 | DLB17 Proposition 7.7, lines 1550–1569, p. 38 | Differential residue pairing, trace normalisation and orthogonal lattice; the printed t^k is corrected to t. |
| 1.7 | DLB17 Théorème 7.8, line 1581, p. 38; Proposition 7.9, line 1593, and Théorème 7.11, line 1615, p. 39 | P-finite Kirillov pairing and infinite-trace smoothness criterion. The final locator is a theorem, as this README says. |
| 2.1 | DLB17 Proposition 8.2, line 1661, pp. 40–41; Théorème 8.3, line 1690, p. 41; Théorème 8.6, line 1828, p. 43 | Embedded dual and common equation; both-chart injectivity and fixed-radius qualification, not only abstract independence of Π^an/π. |
| 2.2 | DLB17 Proposition 9.6, line 1946, p. 46; Théorème 9.7 and Lemme 9.8, lines 1967–1999, pp. 47–48 | Invertibility, homographic conjugation and operator ordering. The inverse-element argument supplies the second inverse. |
| 3.1 | DLB17 Théorème 3.2, line 662, p. 16; Lemme 3.5, line 759, pp. 18–19; Proposition 3.6, line 783, p. 19; Théorème 4.1, line 804, p. 20; Théorème 5.1, line 999, p. 24; Théorème 5.5/Lemme 5.6, lines 1071–1113, pp. 26–27; proof line 1184, pp. 29–30 | Local analyticity, smooth compact-support cohomology, nonzero global map and two-dimensional de Rham multiplicity. Globalisation's unramified twist is removed through the named Hecke-character supplier. R02 concerns the package's Check, not the source theorem. |
| 4.4 | CDN20 §2.1.2 and Remark 2.3, lines 809–821, p. 21 | L⊗F-module, finite period multiplicity; rational base distinguished from general F. |
| 4.7 | CDN20 §2.1.5, lines 917–951, pp. 23–24; Propositions 2.9 and 2.10, lines 952–971, p. 24 | Rank-one filtration line, normalised extension and rational function space in intersections. General-central-character realisation is supplied here by §3.3. |
| 4.9 | CDN20 Proposition 2.12, lines 1020–1072, pp. 25–27; CDN23 Proposition 5.6, line 2420, p. 63; proof of Théorème 5.24, line 2791, p. 73 | Étale injection and bounded vectors; use of bounded functions in the tower's geometric setting. This does not justify changing the integral arithmetic topology in §5.1. |
| 4.13 | CDN23 Théorème 5.8, lines 2465–2474, p. 64; Lemme 5.9, lines 2481–2500, pp. 64–65 | Absolutely irreducible admissible unitary Π, Hom out of compact-convergence Π*, rank-two/special/zero alternatives. The missing printed p-central restriction is made explicit in the package. |
| 5.2 | CDN23 Corollaire 5.17, line 2658, p. 69; Proposition 5.19, line 2673, pp. 69–70; Remarque 5.20, line 2691, p. 70 | Algebraic saturation/completeness and finite-length duality supported. Topology of the preceding package definition is incompatible: R01. |
| 5.5 | CDN23 Théorème 5.22, lines 2746–2756, pp. 71–72 | Compact O_L-dual of m, finite generation over R_B^ps, residual finite-Hom input and p>2. Not a finite-generation assertion for m itself. |
| 6.5 | CDN23 Théorème 5.24, line 2779, p. 72; proof lines 2837–2851 and footnote 32, line 2861, p. 74 | Dual multiplicity, closed-point torsion versus fibre, local freeness step and p>3. Package states the missing proof as its own target. |
| 7.4 | DLB17 Théorème 1.9, lines 434–443, p. 11; §12.1, line 2785, p. 66 | D(Γ)-rank two and all-level exponential-image condition, supplied Iwasawa comparison, distinct cover and cyclotomic indices. |

I also opened the repaired coefficient-dual passage in CDN23 lines 2837–2851, its Banach-dual footnote at lines 182–184, COLMEZ19POIDS Remarks 0.2 and 0.11 and Theorems 0.3/0.6 (lines 153–180, 215–239, 328–340), and TEI90 Theorem 5, Corollary 6 and Theorem 8 (lines 177–184, 232–242, 298–309; printed pp. 73–77). The weight twist, first-cover component degrees and extra marked-line condition were checked against these passages. The source issues found are listed below rather than silently inherited into the roadmap.

### Pinned library audit and headline coverage

The pins read from `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches used objects and hypotheses, including Robba equations, Kirillov models, Drinfeld towers, locally analytic/Banach representations, Iwasawa cohomology and typed multiplicities. A categorical Drinfeld object or an algebraic Steinberg-group occurrence is not the geometric/representation carrier required here.

| Pinned declaration opened | File and line | What it supplies, and does not supply |
|---|---|---|
| Bornology.IsVonNBounded | `Mathlib/Analysis/LocallyConvex/Bounded.lean:61` | Absorption by every zero-neighbourhood. It assumes neither Hausdorffness nor local convexity. |
| NormedSpace.image_isVonNBounded_iff | `Mathlib/Analysis/LocallyConvex/Bounded.lean:495` | One norm bound on an image over a nontrivially normed field. |
| WithSeminorms.isVonNBounded_iff_seminorm_bounded; image variant | `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679` | A separate bound for each seminorm, not a uniform bound over the family. |
| WithSeminorms.banach_steinhaus | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:164` | Uniform boundedness on a barrelled source; not equality of arbitrary dual topologies. |
| Representation | `Mathlib/RepresentationTheory/Basic.lean:48` | Algebraic monoid homomorphism to linear endomorphisms; no analytic or Banach representation structure. |
| LinearMap; Submodule | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Algebraic linearity and closure under algebraic operations; no continuity or topological closedness. |
| Module.Basis; Module.finrank | `Mathlib/LinearAlgebra/Basis/Defs.lean:89`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Algebraic coordinates and rank.toNat. Infinite rank has finrank 0, so finite-dimensional hypotheses cannot be omitted. |
| BDeRhamPlus; BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88` | Period rings of a perfectoid field; not the Galois representation functor D_dR or Drinfeld cohomology. |

All backticked library names in the README were resolved at these pins. There is no backticked own declaration falsely promised by the README. No TauCeti import is used or needed. No fully qualified declaration can collide with a sibling's Lean file because this package declares none.

| Headline from Summary/scope | README target | Named in module docstring; missing carrier checked |
|---|---|---|
| Galois-socle theorem and dimension≥3 vanishing | 4.14 | Yes: rigid Drinfeld tower, its étale cohomology, Banach correspondence. |
| Banach multiplicities | 4.12–4.13 | Yes: same cohomology, admissible Banach representations and compact-convergence dual action. |
| Arithmetic factorisation | 6.6 | Yes: additionally blocks, projective envelopes, full-type rings and interpolated Banach family. |
| General supercuspidal realisation | 3.3 | Yes: rigid functions/de Rham cohomology, locally analytic vectors. |
| Discharge of global hypotheses | 3.1 | Yes: completed quaternionic cohomology and uniformisation. |
| Topological irreducibility and weight change | 2.3–2.4 | Yes: locally analytic representations, Robba module and equivariant sheaf. |
| Weighted BGG realisation and first cover | 7.2–7.3 | Yes: weighted tower functions, BGG map, equivariant semistable model and comparison. |
| Iwasawa invariants | 7.4 | Yes: tower functions, D(ℤ_p×), representation Iwasawa cohomology/exponential. |
| Infinitely primitivable functions | 7.5 | Yes: rigid half-plane and covers. |
| Filtered derived realisation | 7.6 | Yes: coadmissible distribution modules/derived category, rigid de Rham complex and D_dR. |

These cannot be made native headline statements by adding a few simple definitions at the pins. The docstring does not claim that generic linear spaces, duals or period rings are absent; it names the missing structured mathematical carriers. No arbitrary Prop predicate or weakened stand-in is used.

I ran the prescribed `lake env lean` invocation on this package's `Suggested.lean` from the pinned content checkout: **exit 0, no output and no warnings**. Its sole import is `import Mathlib`; no object-file build was necessary. It has one module docstring and the correct namespace, and no set_option, sorry data, lemma or admitted example. The exhaustive one-tactic probe inventory is **0 sorried theorems**. The exhaustive `#check @name` binder inventory is **0 named declarations**. There is consequently no probe to run or hidden section hypothesis to lose. No statable headline or padding declaration was found.

### Supplier order, ownership and open-head overlap

The prescribed dependency check was run against this README, the supplied merge order and the content checkout. Its complete output was:

    depcheck: 236 roadmaps, 2148 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. Every supplier citation and Needs line was compared with the named sections in the available copies. The three resolver leads are existing board-package sections, not missing mathematical owners. The board package index was read before reaching this conclusion.

The following table records the substantive supplier resolutions and ownership boundaries. Line numbers for open roadmaps refer to their README at the supplied indexed head, not to search excerpts.

| Supplier and copy | File/line and sections resolved | Ownership boundary checked |
|---|---|---|
| PadicLocalLanglandsForGL2Qp, PR #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205` (§0.1), `:1300` (§4.1k), `:1416` (§4.2a), `:1657` (§4.11), `:2013` (§5.12), `:2311` (§6.9); also cited §§0.2,1.1–1.4,1.6,2.5,2.7,3.1–3.8,3.11,4.9,5.1–5.8,6.7 | Existing correspondence, analytic-vector functor, P-algebraic model, equation action, blocks/type rings and conditional realisation imported. Part II's embedded dual/P-finite refinement/global discharge are distinct. Schikhof duality keeps its topology. |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4623` (§12.4), `:4962` (§12.19); §§12.5,12.7,12.14 | Tower, actions, central quotient and arithmetic descent; Frobenius exchange retained at lines 4969–4976. No second tower construction here. |
| LocallyAnalyticDistributions, PR #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891` (§0.0), `:1081` (§0.2), `:1344` (§0.3) | Compact-type bounded sets, limits, strict sequences and strong-dual comparison; §0.3 explicitly imports the base compact-manifold comparison. |
| LocallyAnalyticDistributionsPartII, board copy | `packages/LocallyAnalyticDistributionsPartII/README.md:213`, `:232` (§§2.2–2.3) | Odd-prime uniform form versus general ordered p-valued Frommer theorem. G₂, rather than G₁, is used at p=2. |
| LocallyAnalyticRepresentationsOfLocalGroups, board copy | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:164`, `:209` (§§0.3,0.5) | Differentiation and distribution action, not a claim that Lie-invariant vectors are G-invariant. |
| ProetaleCohomologyOfPAdicCurvesAndTowers, board copy | `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:172`, `:192`, `:741`, `:777`, `:790`, `:804`, `:817`, `:826`; §§0.3–0.4,6.2,6.5,6.9,7.1–7.5 | General-F geometric cohomology, integral Steinberg comparison and multiplicity diagram imported. This package owns rational fixed-level period lines and individual/arithmetic multiplicities. R01 contradicts the imported topology, not ownership. |
| ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PR #1757 | `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:754` (§5.4) | Finite smooth length and finite residual Hom, p>2. Its scope leaves the characteristic-zero factorisation here. |
| PhiGammaModulesAndIwasawaCohomology, PR #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1158`, `:2345`, `:2453`, `:2494` (§§2.4,5.4,5.6a,5.7) | ψ-projector, analytic Iwasawa comparison, unfiltered equation and exponential-image/annular inputs. Geometric nontriangulinity after coefficient extension retained. |
| PadicHodgeTheory, PR #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, `:894`, `:982`, `:1378` (§§3.3,4.4,5.1–5.4,8.1) | Period functors and comparisons. §4.4's Sen theory does not already give the additional continuous-H¹ tensor/limit contract. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:4055`, `:5283` (§§RD.1.73,RD.2.43) | Residue duality and application giving ∂-bijectivity imported; Part II owns polynomial injectivity and its use in the family. |
| GL2AutomorphicRepresentationsAndTransfer, PR #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:716` (R16.1.8); R16.3 and R17.3 | Full local finite-order Hecke characters, local parameters and global JL. Smooth Kirillov model (R16.2.8, line 840) is not this P-finite analytic model. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:935`, `:1719`, `:2275` (§§2.7,4.9,6.4) | Classical/p-adic forms, local–global compatibility and globalisation imported; their application discharges the base's hypotheses here. |
| HilbertModularVarietiesAndShimuraCurves, PR #1005 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1817`, `:2343`, `:2552`, `:3937`, `:3993`, `:4014` (R18.5.3, R18.5.16, R18.5.21, R18.4.24a, R18.4.25, R18.3.29) | All-level uniformisation, eigenspace multiplicity, semistable comparison and dual arithmetic normalisation. Weight-sign translation is explicit. |
| LocalGaloisDeformationRings, PR #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2367` (§3.8) | Full Weil–Deligne type quotient and integral image, not merely inertial type; no duplicate type-ring construction here. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:588`, `:1916`, `:2710` (SR.0,SR.2,SR.3.2; cuspidal-splitting at line 2744) | Smooth categories and induction imported. Complex-coefficient projectivity does not discharge the characteristic-zero L-coefficient gap. |

Object searches used the roadmaps service at the supplied open heads and on main, supplemented by the board packages and pinned source searches. I compared the scopes of the five nearest open roadmaps (#1312, #1270, #1757, #1062, #1310) explicitly. No competing owner or mutual hand-off was found for the retained Part II objects. The overlap data reports no conflicting head changing this roadmap, dropped cited id or id available only in an unacknowledged open revision. The supplied comparisons and cited sections give no contrary instance. This package drops no previous main-branch numbering: it is a Part II extension. No extra open pull requests beyond the supplied index were sought.

### Declared gaps

All three slugs match between `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json` and README Exact supplier contracts. Each has a named earlier owner and a precise mathematical need. No request duplicates an available pinned theorem or resolved supplier target.

| Slug | README contract | Audit |
|---|---|---|
| fixed-radius-divisibility | README:88; PadicLocalLanglandsForGL2Qp §6.9 | Requests the fixed admissible radius on both charts needed for an intersection argument. Full-Robba t-invertibility does not supply this. |
| cuspidal-projectivity-coefficients | README:147; SmoothRepresentationsOfLocalGroups SR.3.2 | Requests projectivity/injectivity for absolutely irreducible supercuspidal L-representations with fixed central character, char L=0. Existing complex-coefficient statement is insufficient. |
| continuous-galois-tensor-comparison | README:135; PadicHodgeTheory §4.4 | Specifies V, X, trivial Banach B, Hausdorff finite H¹, strict model, differential/limit compatibility and no extra derived-limit term. These are one coherent comparison contract, not unowned prerequisites. |

These gaps are not findings. After the two findings are repaired, any acceptance remains conditional on these contracts. The present needs-changes verdict is not conditional acceptance.

## Not verifiable

- The three board-only suppliers ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups were checked in the available package copies. Their cited sections exist there. The supplied board index does not provide an independent open-head mapping for them, so equality of those copies with an independently indexed pull-request head was not certified. This is not evidence of missing ownership.
- The three declared supplier gaps specify future proofs; this review checks the contracts, not nonexistent completed implementations. No gap is treated as proved merely because a source uses the corresponding step.
- No cited source text was unreadable, paywall-blocked or missing. No reference request is outstanding. The Lean build was available and completed. Ownership comparisons are confined to the main, packages and indexed open heads supplied for this job; no claim is made about unseen work.

## Source issues

These are issues in the texts opened, generally already corrected or explicitly isolated by the package. They are not additional package findings. Locators use printed pagination of the versions named in References.

- **Gap** in DLB17 at Théorème 9.9, p. 48 (DLB17 line 2005): the source says the module action is unique without specifying continuity; it should be uniqueness among actions continuous in the analytic-function variable; affects a stated result.
- **Error** in DLB17 at Théorème 1.10, p. 11 (DLB17 line 447): the source says infinitely primitivable functions descend to the half-plane; it should be containment in component constants times half-plane functions; affects a stated result.
- **Gap** in DLB17 at proof of Théorème 5.1, §5.3, pp. 29–30 (DLB17 line 1184): the source says the globalisation can be used in the specified isotypic part; it should be preceded by removal of the unramified local twist through a global character; affects the proof.
- **Error** in DLB17 at Proposition 7.7(b), p. 38 (DLB17 line 1568): the source says the orthogonal lattice has a factor t^k; it should be t for the stated differential residue pairing; affects a stated result.
- **Gap** in DLB17 at proof of Théorème 8.3, p. 41 (DLB17 line 1690): the source says first-chart restriction is injective on the relevant fixed vectors without the second-chart argument; it should be justified using the Weyl chart and vanishing of φ-fixed vectors; affects the proof.
- **Error** in DLB17 at proof of Proposition 8.4, p. 42 (DLB17 line 1768): the source says the needed generation holds over D(Γ); it should be generation after the stated Robba scalar extension, with a separate argument for the stronger use; affects the proof.
- **Gap** in DLB17 at proof of Théorème 9.7, pp. 47–48 (DLB17 line 1967): the source says its displayed inverse computation establishes invertibility; it should be completed by applying the identity to the inverse group element; affects the proof.
- **Gap** in DLB17 at §12.2 before Proposition 12.2, p. 67 (DLB17 line 2810): the source says coadmissibility for the de Rham complex without retaining the proved sector; it should be restricted to the supercuspidal multiplicity complex; affects the proof.
- **Gap** in DLB17 at Proposition 11.10, pp. 63–64 (DLB17 line 2685): the source says iterated divisibility makes the intersection vanish; it should be divisibility inside one fixed-radius lattice on both charts; affects the proof.
- **Gap** in DLB17 at Remarque 11.13, p. 66 (DLB17 line 2776): the source says two matched filtration lines determine the projective comparison; it should be three distinct matched lines or an equivalent extra normalization; affects the proof.
- **Misprint** in CDN23 at Théorème 5.15, p. 68 (CDN23 line 2624): the source says the coefficient dual is the dual of itself; it should be the continuous L-dual of R_(B,M); affects nothing.
- **Gap** in CDN23 at Théorèmes 5.15 and 5.24(ii), pp. 68,72,74 (CDN23 lines 2620, 2779, 2861): the source says the factorisation locally without repeating the prime restriction used for generic semisimplicity; it should be read with p>3 as required by the cited input; affects a stated result.
- **Misprint** in CDN20 at proof of Lemme 2.18, p. 30 (CDN20 line 1186): the source says the completing companion column uses positive symmetric coefficients; it should be the alternating-sign column determined by the characteristic polynomial; affects the proof.
- **Gap** in CDN20 at proof of Lemme 2.18, p. 30 (CDN20 lines 1188–1193): the source says its chosen complement yields the required disjoint extension; it should be justified for S′+AS′, not only AS′; affects the proof.
- **Misprint** in CDN20 at proof of Proposition 2.5, p. 22 (CDN20 line 875): the source says the Hom dimension is zero in the matching-type case; it should be one for matching types and zero otherwise; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, pp. 63–64 (CDN23 line 2424): the source says level at most n suffices on the p-central quotient; it should be membership in the p-central level-n type set; affects a stated result.
- **Gap** in CDN23 at proof of Proposition 5.7, p. 63 (CDN23 line 2438): the source says the DLB realisation applies to every supercuspidal type; it should be preceded by its extension beyond trivial central character; affects the proof.
- **Gap** in CDN20 at Proposition 2.9, p. 24 (CDN20 line 952): the source says the DLB comparison gives the displayed identification for general supercuspidal M; it should be accompanied by a general-central-character realisation argument; affects the proof.
- **Gap** in CDN23 at proof of Théorème 5.24(ii), p. 74 (CDN23 line 2847): the source says the dual multiplicities are locally free over the PID factors; it should be supported by a constant-rank/torsion-freeness argument; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9, p. 11 (DLB17 line 434): the source says n for both cover and cyclotomic indices; it should be separate indices with the cover fixed during specialization; affects nothing.
- **Gap** in DLB17 at proof of Théorème 1.10, §12.1, p. 66 (DLB17 line 2785): the source says the trivial-central-character supercuspidal comparison treats every nontrivial division-algebra type; it should be supplemented by the character sectors and general-central-character realisation; affects the proof.
- **Error** in DLB17 at the level-zero description, p. 3 (DLB17 line 114): the source says its ℚ_p-model is two half-planes; it should be their unramified quadratic descent, becoming split over ℚ_p²; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bd5007cdee4b4ee752d601fc7177803b9bca213c", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
