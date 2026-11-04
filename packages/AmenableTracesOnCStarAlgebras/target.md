Verdict: design
Name: AmenableTracesOnCStarAlgebras
Base: none
Owner: none

## Scope

The roadmap owns the trace-level finite-dimensional approximation theory of C*-algebras: tracial
states on a C*-algebra `A` (unital or not, separable or not), amenable traces, quasidiagonal
traces, uniform amenable traces, and the characterisations, permanence properties and standard
examples of these classes. Its general setting is an arbitrary complex C*-algebra with nets of
completely positive contractive (c.p.c.) maps into full matrix algebras; separability gives
sequences and unitality gives unital completely positive (u.c.p.) maps, both as theorems, not as
standing hypotheses. Brown's memoir (`brown2006`), the main readable source, assumes `A` separable
and unital throughout (`brown2006` line 358, line 584); the roadmap states everything at the
general level that Brown–Ozawa Ch. 6 (`brown-ozawa2008`, nets, unital algebras) and Brown's
nonunital reduction (`brown2006` line 1423, Proposition 3.5.10) together support, and records the
separable unital statements as Checks.

Owned here:

- **Tracial states.** For a C*-algebra `A`: tracial states as states with `τ(ab)=τ(ba)`, the
  equivalence with `τ(a*a)=τ(aa*)` (polarisation), faithfulness, the tracial state space `T(A)`
  with its weak-* topology (compact for unital `A`), the unique extension of a tracial state on
  an ideal or on `A` to its unitization, the GNS representation `π_τ` with its vector trace
  `τ''` on `π_τ(A)''`, and the fact that `ker π_τ` is a closed ideal with `τ` descending to a
  faithful tracial state on `A/ker π_τ`. On `M_n(ℂ)` (Mathlib's `CStarMatrix`): the normalised
  trace `tr_n` is the unique tracial state, the 2-norm `‖x‖₂=tr_n(x*x)^{1/2}` with
  `‖xy‖₂≤‖x‖‖y‖₂`, `‖xy‖₂≤‖x‖₂‖y‖`, `‖x‖₂≤‖x‖`, `|tr_n(x)|≤‖x‖₂`, and the comparison with the
  Hilbert–Schmidt norm.
- **The c.p.c. toolkit specific to matrix targets.** Compositions of c.p.c. maps with
  *-homomorphisms, compressions `x↦PxP` and their unital normalisations, c.p.c. maps built from
  positive functionals (the map `a↦(ω_{ij}(a))` into `M_n` from a positive matrix of
  functionals), amplification `φ⊗id_k`, direct sums of c.p.c. maps into block-diagonal matrix
  algebras, the Kadison–Schwarz inequality `φ(a)*φ(a)≤φ(a*a)` for u.c.p. (and 2-positive
  unital) maps, its c.p.c. form `φ(a)*φ(a)≤‖φ‖ φ(a*a)`, and the 2-norm multiplicative-domain
  estimates that turn asymptotic multiplicativity on a generating set into asymptotic
  multiplicativity on the generated C*-algebra. The general CP theory (Stinespring, Choi, Arveson
  extension, Tomiyama) is imported from CStarAlgebras C4 and VonNeumannAlgebras V13a, never
  re-proved.
- **Amenable, quasidiagonal and uniform amenable traces.** The three approximation classes
  `AT(A)`, `AT(A)_QD`, `UAT(A)` of `brown2006` Definitions 3.1.1, 3.3.1 and 3.2.1 (lines 589,
  1078, 953), in net form for arbitrary `A` and in the c.p.c. form for nonunital `A`, the
  inclusions `AT(A)_QD ⊆ AT(A)` and `UAT(A) ⊆ AT(A)`, the sequence reduction for separable `A`,
  the u.c.p. reduction for unital `A`, and the definition "`A` admits a faithful amenable
  (resp. quasidiagonal) trace".
- **The characterisation theorems** listed under Final targets: the hypertrace (Connes–Kirchberg)
  characterisation with its representation independence, the finite-rank-projection and
  Kirchberg tensor-norm forms, the nuclear and exact cases, and the quasidiagonal-algebra
  consequences.
- **Permanence**: convexity and closure, faces, restriction to subalgebras, lifting from and
  passage to quotients, ideals, unitization, tensor products.
- **Examples**: finite-dimensional, commutative, AF and UHF algebras, reduced group
  C*-algebras of discrete groups, and the concrete witnesses recorded as Checks.

Not owned here (imported by name and section): completely positive maps and dilation theory,
nuclearity, exactness, local reflexivity, the Choi–Effros lifting theorem and quasidiagonality
of algebras (CStarAlgebras C4–C9); states, GNS, normal states, the trace on finite factors,
hypertraces on `B(L²(M))`, the Powers–Størmer inequality, Connes's Følner criterion, injectivity,
semidiscreteness and the injective-iff-hyperfinite theorem (VonNeumannAlgebras V0, V4–V6, V13);
AF and UHF algebras and the trace spaces of AF algebras (CStarClassification CL2–CL3); reduced
group C*-algebras, their canonical trace and the amenable-group nuclearity theorem
(OperatorAlgebraDynamics D2, D6 and D2.FreeGroups); Følner sets and invariant means
(AmenableGroups). The AF-embedding theorem of Schafhauser (`schafhauser2020` line 75, Theorem A)
and the Tikuisis–White–Winter quasidiagonality theorem (`tikuisis-white-winter2017` line 53,
Theorem A) are consumers: this roadmap supplies the notions in their statements and the
"only if" half of Schafhauser's theorem, not their proofs. Connes's embedding problem and
Kirchberg's factorization property for groups are out of scope.

## Final targets

Throughout, `A` is a complex C*-algebra, `τ ∈ T(A)` a tracial state, `M_k` the `k×k` matrices
with normalised trace `tr_k` and 2-norm `‖·‖₂`. "Asymptotically multiplicative in 2-norm" for a
net `φ_i : A → M_{k(i)}` of c.p.c. maps means `‖φ_i(ab)−φ_i(a)φ_i(b)‖₂ → 0` for all `a, b`;
"recovers `τ`" means `tr_{k(i)}(φ_i(a)) → τ(a)` for all `a`. A trace is **amenable** if such a
net exists, **quasidiagonal** if a net exists with the operator norm in place of the 2-norm, and
**uniform amenable** if a net exists with `‖tr_{k(i)}∘φ_i − τ‖_{A*} → 0` in place of pointwise
recovery (`brown2006` lines 589–592, 953–958, 1078–1084; `brown-ozawa2008` Ch. 6 for the net
form).

1. **Tracial states and the matrix 2-norm.** `τ` is tracial iff `τ(a*a)=τ(aa*)` for all `a`;
   `tr_n` is the unique tracial state on `M_n(ℂ)`; `‖·‖₂` is a norm on `M_n` dominated by the
   operator norm with `‖xy‖₂ ≤ ‖x‖‖y‖₂` and `‖xy‖₂ ≤ ‖x‖₂‖y‖`; and `|tr_n(x)| ≤ ‖x‖₂ ≤ ‖x‖`.
   The GNS representation of a tracial state has the trace vector cyclic and separating for
   `π_τ(A)''`, the vector state `τ''` is a faithful normal tracial state on `π_τ(A)''`, and
   `ker π_τ = {a : τ(a*a)=0}` is a closed two-sided ideal (`brown2006` Ch. 2 for the matrix
   conventions, lines 362–364 of `tikuisis-white-winter2017` for the notation; the GNS facts from
   VonNeumannAlgebras V0 and V6; `pedersen2018` Ch. 3 and Ch. 5 as the textbook background for
   states and traces). On a simple C*-algebra every tracial state is faithful.
2. **Elementary inclusions and reductions.** Quasidiagonal traces are amenable and uniform
   amenable traces are amenable. If `A` is separable the nets in all three definitions may be
   taken to be sequences; if `A` is unital the maps may be taken u.c.p.; for nonunital `A`, `τ`
   has the c.p.c. approximation property iff its unique extension to the unitization has the
   u.c.p. one (`brown2006` line 1423, Proposition 3.5.10). Asymptotic multiplicativity on a set
   generating `A` as a C*-algebra implies it on `A` (Kadison–Schwarz, `paulsen2002` Ch. 3 as
   background and CStarAlgebras C4 as the owner, and the 2-norm estimates).
3. **The Connes–Kirchberg characterisation.** For unital `A` and `τ ∈ T(A)` the following are
   equivalent (`brown2006` lines 804–816, Theorem 3.1.6, with the footnote at lines 819–821;
   `brown-ozawa2008` Ch. 6, the theorem characterising amenable traces; the origin of the
   hypertrace idea is `connes1976`, cited as background):
   (a) `τ` is amenable;
   (b) for every faithful representation `A ⊆ B(H)` there is a state `ψ` on `B(H)` with
       `ψ|_A = τ` and `ψ(uTu*) = ψ(T)` for all unitaries `u ∈ A` and `T ∈ B(H)` (a hypertrace);
   (c) the same for some faithful representation;
   (d) the positive functional `a⊗b^{op} ↦ τ(ab)` on `A ⊙ A^{op}` is bounded for the minimal
       C*-norm;
   (e) the *-homomorphism `A ⊙ A^{op} → B(L²(A,τ))`, `a⊗b^{op} ↦ π_τ(a)Jπ_τ(b)*J`, is bounded for
       the minimal C*-norm;
   (f) for every (equivalently some) faithful representation `A ⊆ B(H)` there is a u.c.p. map
       `Φ : B(H) → π_τ(A)''` with `Φ(a) = π_τ(a)` for `a ∈ A`.
   In the concrete case `A ⊆ B(H)` with `A ∩ K(H) = 0`, these are also equivalent to the
   existence of a net of nonzero finite-rank projections `P_i` with
   `‖aP_i − P_i a‖_HS / ‖P_i‖_HS → 0` and `⟨aP_i, P_i⟩_HS / ‖P_i‖²_HS → τ(a)` (`brown2006` lines
   897–910, Theorem 3.1.7 (3)). Representation independence of (b) is `brown2006` line 595,
   Proposition 3.1.2. For nonunital `A` the statements are made through the unitization.
4. **Nuclear algebras.** If `A` is nuclear then every tracial state on `A` is amenable, indeed
   uniform amenable (`brown2006` line 1707, Theorem 4.2.1; the proof uses that `π_τ(A)''` is
   injective for nuclear `A`, CStarAlgebras C6 and VonNeumannAlgebras V13).
5. **Exact algebras.** If `A` is exact and `τ ∈ T(A)`, then `τ` is amenable iff `τ` is uniform
   amenable iff `π_τ` is a nuclear map into `π_τ(A)''` iff `π_τ(A)''` is injective; for
   separable `A` (so that `π_τ(A)''` has separable predual) these are equivalent to
   hyperfiniteness of `π_τ(A)''` (`brown2006` lines 1925–1932, Corollary 4.3.6, which uses local
   reflexivity of exact algebras, CStarAlgebras C9; `schafhauser2020` lines 86–88; `kirchberg1993`
   §3 for the general exact case, uncertified). Conversely, for every unital `A`, injectivity of
   `π_τ(A)''` implies amenability of `τ` (target 3 (f) with a conditional expectation).
6. **Permanence.** `AT(A)` and `AT(A)_QD` are convex and weak-* closed, `UAT(A)` is convex and
   norm closed, and `AT(A)` is a face of `T(A)` (`brown2006` lines 1218–1221, 1283, Propositions
   3.5.1 and 3.5.3). The three properties pass to restrictions to C*-subalgebras, lift along
   quotient maps, and (for amenable and uniform amenable) pass to the induced faithful trace on
   `A/ker π_τ` (for amenable traces, given a c.p.c. splitting of the quotient map), to the
   normalised restriction to an ideal with nonzero restriction, and extend uniquely from an ideal
   to `A` (`brown2006` lines 1306–1315, 1338–1349, 1452–1454, 1469–1471, Propositions 3.5.5,
   3.5.6, 3.5.8, 3.5.11, 3.5.12); tensor products of amenable (quasidiagonal) traces are amenable
   (quasidiagonal) on the minimal tensor product (`brown2006` line 1317, Proposition 3.5.7). In
   the form the AF-embedding theorem needs: if `ι : A → B` is a *-homomorphism, `τ_B ∈ AT(B)`,
   and `τ_B ∘ ι` is a state, then `τ_B ∘ ι ∈ AT(A)`, and it is faithful when `τ_B` is faithful
   and `ι` is injective.
7. **AF-embedding necessity.** If `A` is separable and `A ⊆ B` is a C*-subalgebra of a simple
   unital AF algebra `B` with tracial state `τ_B` (unique or not), then `A` is exact and the
   restriction of `τ_B` to `A` is a faithful amenable trace; so every C*-subalgebra of a simple
   unital AF algebra is separable, exact and admits a faithful amenable trace (`schafhauser2020`
   lines 69–70; exactness from CStarAlgebras C7, nuclearity of AF algebras from C6; faithfulness
   from simplicity of `B` and target 1).
8. **Quasidiagonal traces and quasidiagonal algebras.** If `A` is separable and quasidiagonal
   then `A` admits a quasidiagonal trace, and every state of `A` is a limit of states factoring
   through norm-asymptotically-multiplicative u.c.p. maps to matrices (`brown2006` lines 1097–
   1100, 1952–1955, Propositions 3.3.2 and 4.3.7). If `A` admits a faithful quasidiagonal trace
   then `A` is quasidiagonal (`brown2006` lines 1554–1558, proof of Proposition 4.1.3, for
   separable unital `A`; `tikuisis-white-winter2017` lines 418–431, Proposition 1.4, states the
   nuclear case).
9. **Examples.** Finite-dimensional and commutative C*-algebras, AF algebras and UHF algebras:
   every tracial state is quasidiagonal, hence amenable (finite-stage *-homomorphisms into matrix
   algebras compressed by the trace; `brown2006` §3.4, locally finite-dimensional traces). The
   unique trace of a UHF algebra is faithful, amenable and quasidiagonal. For a discrete group
   `Γ` with canonical trace `τ` on `C*_r(Γ)`: `Γ` is amenable iff every tracial state on `C*_r(Γ)`
   is amenable iff `C*_r(Γ)` has at least one amenable trace iff `τ` is amenable (`brown2006`
   lines 1515–1540, Proposition 4.1.1 and Corollary 4.1.2; the proof passes through the
   nuclearity of `C*_r(Γ)` for amenable `Γ`, OperatorAlgebraDynamics D6, and through invariant
   means and Følner sets, AmenableGroups Layers 2 and 5). In particular `C*_r(F_2)` has no
   amenable trace, and a quasidiagonal `C*_r(Γ)` has amenable `Γ` (Rosenberg's observation,
   `brown2006` lines 1541–1549).

Checks the design must carry: `A = M_n`, `ℂ⊕ℂ` (two extreme traces, both amenable, `AT` is the
whole simplex), `C(X)` for a compact metric `X` with a measure, the CAR algebra with its unique
trace, `C*_r(ℤ) ≅ C(𝕋)` with Lebesgue trace, and `C*_r(F_2)` with `AT = ∅`.

## Suppliers

- **CStarAlgebras** (PR #860, another author's open pull request): C3 (cb maps, Smith's lemma),
  C4 (`CompletelyPositiveMap` API, `‖φ‖=‖φ(1)‖`, Schwarz inequality for unital 2-positive maps,
  multiplicative domains, Stinespring, Choi/Kraus for maps between matrix algebras), C5 (minimal
  and maximal tensor products, needed for targets 3(d)–(e)), C6 (nuclearity, `A**` semidiscrete,
  nuclearity of AF algebras and `C₀(X)`), C7 (exactness, `A` exact iff a faithful representation
  is a nuclear map, Choi–Effros lifting), C8 (quasidiagonality of algebras through u.c.p. maps to
  matrices; this roadmap's quasidiagonal traces refine that criterion), C9 (local reflexivity of
  exact algebras, used in target 5).
- **VonNeumannAlgebras** (PRs #889 and #1041; line 5 of the merge order): V0 (positive
  functionals, states, `PositiveLinearMap.GNS`, state separation), V4 (normal states, preduals;
  normal states of `B(H)` dense in its state space), V5 (`tracialState_unique` on factors,
  `M_n(ℂ)` with `tr/n`), V6 (tracial standard form `L²(M,τ)`, the conjugation `J`, the hyperfinite
  II₁ factor `R`), V13a (Arveson extension, Tomiyama, injectivity by CP extension), V13b
  (semidiscrete iff injective, the commuting-representation minimal-norm criterion, hypertraces on
  `B(L²M)` for finite algebras, Powers–Størmer, Connes's finite-rank Følner criterion, injective
  iff hyperfinite with separable predual). Target 3's proof of (b)⇒(a) is the C*-version of
  V13b's finite trace criterion and must consume it rather than re-prove it.
- **CStarClassification** (PR #863; line 217 of the merge order): CL2 (AF algebras, local
  characterisation), CL3.4 (`T(A) ≅ S(K₀(A),[1])` for unital AF algebras, traces from finite-stage
  matrix traces), CL3.5 (UHF algebras are simple with a unique trace).
- **OperatorAlgebraDynamics** (main, and PR #1137 for D2.FreeGroups): D2 (reduced group
  C*-algebras `C*_r(G)`, the faithful expectation and Fourier coefficients for discrete `G`,
  amenable `G` gives `C*(G) = C*_r(G)` and nuclear crossed products), D6 (amenability iff
  nuclearity of the reduced algebra for étale groupoids, which covers discrete groups),
  D2.FreeGroups (the canonical faithful tracial state `τ(x) = ⟨δ_1, xδ_1⟩` on `C*_r(Γ)`, trace
  uniqueness for Powers groups, `reducedFreeGroup_trace_unique`).
- **AmenableGroups** (main): Layer 2 (discrete means), Layer 5 (`amenable_iff_hasFoelnerSets`).
- **Mathlib**: `CompletelyPositiveMap` (`A →CP B`), `PositiveLinearMap` and
  `PositiveLinearMap.GNS`, `CStarMatrix`, `Matrix.trace`, `CStarAlgebra`,
  `NonUnitalCStarAlgebra`, `Unitization`.

In the merge order the new roadmap goes after CStarClassification (line 217); its other suppliers
are on main, earlier in the order, or another author's pull requests.

## Consumers

- **CStarClassification**, through a future Part II on AF embeddings: the hypotheses of
  `schafhauser2020` Theorem A (separable, exact, UCT, faithful amenable trace) and the
  "only if" half (target 7) are stated here.
- **A future quasidiagonality roadmap** (Tikuisis–White–Winter, `tikuisis-white-winter2017`
  Theorem A: every faithful trace on a separable nuclear UCT algebra is quasidiagonal): its
  statement needs quasidiagonal traces and target 8.
- **OperatorAlgebraDynamics** (D2.FreeGroups and the KMS/tracial sections of D7): the
  group-algebra examples of target 9 and the trace-space permanence of target 6.
- **FactorRigidity** (PR #876): II₁-factor representations of C*-algebras with amenable traces
  (Brown's Popa algebras) and the identification of amenability of `π_τ(A)''` with
  `L²(M) ≺ coarse(M)` in its Layer 1.3; FactorRigidity currently cites only VonNeumannAlgebras,
  so it needs no change now.
- **FreeProbability** (main) and **TemperleyLiebOperatorAlgebras** (PR #867): tracial states on
  C*-probability spaces and on the Temperley–Lieb C*-towers are candidates for amenability
  statements.

## Sources

Manifest keys are those of `packages/AmenableTracesOnCStarAlgebras/sources.toml`; passages cited as
`<key> line N` refer to the cached line-numbered texts.

- `brown2006`: N. P. Brown, *Invariant means and finite representation theory of C*-algebras*,
  Mem. Amer. Math. Soc. 184 (2006), no. 865; arXiv:math/0304009v2 (open repository, certified).
  Definitions 3.1.1, 3.2.1, 3.3.1; Theorems 3.1.6, 3.1.7, 3.2.2; Propositions 3.1.2, 3.3.2,
  3.5.1–3.5.12, 4.1.1–4.1.3, 4.3.7; Theorem 4.2.1; Corollary 4.3.6. Standing hypotheses: `A`
  separable unital (line 358). The arXiv v2 numbering is the one quoted; the design must check
  it against the published Memoir.
- `schafhauser2020`: C. Schafhauser, *Subalgebras of simple AF-algebras*, Ann. of Math. 192
  (2020), 309–352; arXiv:1807.07381v2 (open repository, certified). Introduction (lines 69–96),
  Theorem A (line 75), Theorem B (line 106), Proposition 1.1, Theorem 1.2.
- `tikuisis-white-winter2017`: A. Tikuisis, S. White, W. Winter, *Quasidiagonality of nuclear
  C*-algebras*, Ann. of Math. 185 (2017), 229–284; arXiv:1509.08318v2 (open repository,
  certified). Theorem A (line 53), Definitions 1.1–1.2 (lines 371–380), Proposition 1.4 (line
  418), Remark 1.5 (line 452, nonunital case).
- `kirchberg1993`: E. Kirchberg, *On non-semisplit extensions, tensor products and exactness of
  group C*-algebras*, Invent. Math. 112 (1993), 449–489, doi:10.1007/BF01232444 (paywalled;
  recorded uncertified, cited by locator: §3, amenable traces on exact algebras). The GDZ
  digitisation of Inventiones (`gdz.sub.uni-goettingen.de`, PPN356556735) may hold volume 112;
  the fetcher could not see its table of contents.
- `brown-ozawa2008`: N. P. Brown, N. Ozawa, *C*-Algebras and Finite-Dimensional Approximations*,
  AMS GSM 88, 2008, doi:10.1090/gsm/088 (paywalled; waived by a human, cite by locator): Ch. 6
  for amenable traces in net form and the hypertrace theorem, Ch. 7 for quasidiagonal traces.
  Every statement it would certify is also in `brown2006` for separable unital `A`.
- `connes1976`: A. Connes, *Classification of injective factors*, Ann. of Math. 104 (1976),
  73–115, doi:10.2307/1971057 (paywalled; waived, cite by locator, Theorem 5.1): the origin of
  hypertraces and of the injective-iff-hyperfinite theorem. The roadmap consumes those results
  from VonNeumannAlgebras V13b, so this is a background citation only.
- `paulsen2002`: V. Paulsen, *Completely Bounded Maps and Operator Algebras*, Cambridge 2002,
  doi:10.1017/CBO9780511546631 (paywalled; waived, cite by locator): Ch. 3 for the Schwarz
  inequality, which CStarAlgebras C4 already owns; background only.
- `pedersen2018`: G. K. Pedersen, *C*-Algebras and Their Automorphism Groups*, 2nd ed., 2018
  (paywalled; waived, cite by locator): Ch. 3 and Ch. 5 for states, GNS and traces, owned by
  VonNeumannAlgebras V0; background only.

The four waived works are settled in the manifest and are never to be requested again; the
design cites them by chapter or theorem number only.

## Risks

- **Nonseparable exact case.** The readable proof of target 5 (`brown2006` Corollary 4.3.6) is
  written for separable unital `A` and ends in hyperfiniteness, which VonNeumannAlgebras defines
  only for separable predual. The general exact statement ("amenable iff `π_τ(A)''` injective")
  rests on `kirchberg1993`, which cannot be read. The design should prove the separable
  statement first and derive the general one through local reflexivity (CStarAlgebras C9) and
  the general injective-iff-semidiscrete theorem of V13b; if that route fails, the general
  statement stays a target with its hypothesis stated, not a silently dropped case.
- **Net versus sequence generality.** Brown's memoir works with sequences and separable
  algebras; the net formulations for arbitrary `A` are in `brown-ozawa2008` Ch. 6, which is
  waived and cannot be read. The design must prove the net statements itself (the arguments are
  the same) and record that the certified text covers the separable case.
- **Dependence on open pull requests.** Four suppliers (CStarAlgebras, VonNeumannAlgebras,
  CStarClassification, OperatorAlgebraDynamics at #1137) are open pull requests by another
  author. Section names and Lean names quoted here (`tracialState_unique`,
  `CompletelyPositiveMap`, `reducedFreeGroup_trace_unique`) are at the heads of 2026-11-04 and
  must be re-checked by the design.
- **Opposite algebras and `A ⊙ A^{op}`.** Targets 3(d)–(e) need the opposite C*-algebra and the
  minimal norm on `A ⊙ A^{op}`; CStarAlgebras C5 constructs the tensor products and FactorRigidity
  Layer 1.3 already uses `M⊙Mᵐᵒᵖ`, but the design must confirm the C*-structure on `MulOpposite`
  is exposed in a way the owner accepts, or add the interface.
- **Hypertrace interface with V13b.** VonNeumannAlgebras V13b constructs hypertraces on
  `B(L²M)` for finite von Neumann algebras; the C*-level hypertrace of target 3 must be the same
  object restricted along `A → π_τ(A)''`, otherwise two roadmaps plan the same construction.
