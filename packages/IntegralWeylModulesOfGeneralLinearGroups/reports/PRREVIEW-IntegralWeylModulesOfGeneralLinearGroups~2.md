# Review of IntegralWeylModulesOfGeneralLinearGroups (pull request #2888 at 9ceb4ee)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/IntegralWeylModulesOfGeneralLinearGroups/`
**Verdict:** needs changes

**Summary.** Needs changes, for three findings:
- `Suggested.lean` leaves out two headline theorems that can be stated at the pins in the polynomial model: the sandwich exponent and the block-cut bound.
- The results the README credits to the formal proof have no locator in it, and 2.1 (e) and 3.3 have neither a route nor a source.
- One sentence in a Check of 2.2 (c) is false.

Every numerical Check was recomputed and holds. The bounds of 0.3, 1.1, 2.1 (b) and 2.2 also held on many further weights. There are five small corrections and two format notes. Scope and licence questions about the formal proof are left to the human reviewers.

## R01 (P2) — The sandwich exponent (headline 1) and the block-cut bound of 2.1 (b) can be stated at the pins, but `Suggested.lean` leaves them out

**Why it matters.** The acceptance test states only the branching integer and the Fischer norm of `v_λ`. It states nothing about the two lattices the roadmap is about.

**Why they are statable.** The module docstring explains the omission by saying "Neither Mathlib nor Tau Ceti has these carriers at the pins". That is not the test. A headline that needs a few simple definitions is stated with them.

Here the definitions are the README's own Conventions, on native carriers:
- the column substitution `x ↦ x·(1 + T·e_{st})` and the row substitution `x_b ↦ x_b + T·x_a`, each as an `MvPolynomial.aeval` into `Polynomial (MvPolynomial (Fin N × Fin N) R)`;
- the divided row operator, as the `T^k` coefficient of the row substitution;
- `∇_R(λ)`, as `MvPolynomial.restrictSupport` on the monomials of column degrees `λ⁰`, intersected with the kernels of (column substitution − `Polynomial.C`);
- `Δ_R(λ)`, as the `Submodule.span` of the images of the file's own `highestWeightVector` under words in the divided row operators.

With these definitions I elaborated three statements at the pins, each with `sorry` as the only warning:
- the global form, `lcm(1, …, λ⁰_0 + N − 1)^{N(N−1)/2} • ∇_ℤ(λ) ≤ (dim V_λ) • Δ_ℤ(λ)`;
- the local form over a discrete valuation ring of characteristic `0` and residue characteristic `p`, with exponent `(N(N−1)/2)·Nat.log p (λ⁰_0 + N − 1)`;
- the global block cut of 2.1 (b), `c₁c₂·lcm(1, …, w)^{a(N−a)}·∇_ℤ(λ) ⊂ Δ_ℤ(λ)` from the two block hypotheses.

**Smallest change.** Add these definitions and state 0.3 (b)–(c) and 2.1 (b). Keep in the docstring, as not statable, only the headlines that still lack a carrier (the equivariant maps of 1.1 and the slopes of 3.2 (b)–(d)).

## R02 (P2) — The results credited to the formal proof have no locator in it, and 2.1 (e) and 3.3 have neither a route nor a source

**Why it matters.** A reader who wants to check 0.3a, 0.3 (b), 1.1, 2.1 (b) and (d), 2.2, or the bound of 3.3 has nothing to open.

**How I know.** The References entry for `[FormalProof]` says it "is the source of 0.3, 0.3a, 1.1, 2.1 (b), (d), 2.2 and of the clauses of 3.2 and 3.3 that it states" (line 431). It names no module, file or theorem, and none of these sections cites it inline. The formal proof has about 175,000 modules, so a bare citation locates nothing. Modules whose names match this material do exist (for instance under `Formalism/BranchSandwichDivisors`, `Formalism/GradedWeylDivisibility` and `Formalism/SharpRestriction/Divisibility/HookProducts`), so locators can be given.

Two stated results have nothing else behind them:
- 3.3: the route stops after reducing to one summand ("The remaining steps of the route are not given here", line 328), so the constant `4·f·ν·R·log(νR)` is unsupported as written.
- 2.1 (e): the route is "not given here" (line 210), and no source is named.

The classical citations also lack theorem or page numbers: Kostant 1966 for 0.3 (a), Doubilet–Rota–Stein and De Concini–Eisenbud–Procesi for 0.1, Carter–Lusztig for 2.1 (d). Only the Jantzen citations are located (II.5.6, II.8, II.6).

**Smallest change.** For each item credited to the formal proof, give the module and theorem name, saying which clauses of 3.2 and 3.3 it covers. For 2.1 (e), cite a located statement that a simple module is the socle of the induced module of its highest weight, or write the route.

## R03 (P2) — The last sentence of the rank-two Check of 2.2 (c) drops the term `κ₀(x_p − x_m)/ℓ` and is false when `x_p > x_m`

**Why it matters.** The sentence (line 258) reads as the large-`ℓ` form of (c): "For `ℓ > h`, `c_W = (q + 2j)(h − 1)/(ℓ − 1) + e_cl < q + 2j + e_cl`".

**Why it is false.** For `ℓ > h` it is true that:
- `ι_ℓ = 0`, because the integers of `[x_m, x_p]` lie in `(top, top + ℓ)`;
- `D_ℓ(I) = 0`, because then `d_ℓ = x_m − top`;
- `H_ℓ(I) = 0`.

But the term `κ₀·(x_p − x_m)/ℓ` remains. A counterexample satisfying every hypothesis of (c):
- `GL_4`, `λ = (2, 1, 0, 0)`, with shifted weights `(5, 3, 1, 0)`;
- `κ₀ = 3`, `j = 0`, `t = 1`, `q = 0`, `top = 0`, `x_m = 1`, `x_p = 5`, `h = 5`, `ℓ = 7`.

Then `c_W = e_cl + 3·4/7 = 12/7`, since `e_cl = ex((2, 1, 0), 7) = 0`. The sentence gives `c_W = 0` and asserts `c_W < 0`. The bound of (c) itself held in all 678,424 instances I tested.

**Smallest change.** "For `ℓ > h`, `ι_ℓ = D_ℓ(I) = H_ℓ(I) = 0` and `c_W = (q + 2j)(h − 1)/(ℓ − 1) + e_cl + κ₀(x_p − x_m)/ℓ`."

## C01 — The scope sentence "all statements are over rings of characteristic 0" is contradicted by 0.1 and 2.1 (d)–(e)

The Summary (line 3) excepts only "the specialisation to fields of characteristic `p` in 0.2". But:
- 0.1 is stated over every integral domain, so over `𝔽_p` as well;
- 2.1 (d)–(e) concern subquotients of `∇_O(λ)/ϖ`, which are modules over the residue field.

The Scope paragraph (line 371) has the same tension, and the pull request's description repeats the sentence. It would read: "… except 0.1, which holds over every integral domain, and the residue-field statements of 0.2 and 2.1 (d), (e)."

## C02 — The family index describes 0.2 as the closed lowest alcove, which the roadmap excludes

The entry for this roadmap in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 124) lists "Weyl and dual Weyl modules in the closed lowest alcove". But 0.2 assumes `⟨λ + ρ, α^∨⟩ < p` and says the closed-alcove form is Jantzen's and not stated here. It would read "below the upper wall of the lowest alcove".

## C03 — The docstring's claim that Tau Ceti has no lattice generated by the Kostant form from a highest-weight vector is wrong at the pin

The claim is at lines 18–20 of `Suggested.lean`. At the pin:
- `LieAlgebra.Basis.highestWeightLattice` (`TauCeti/Algebra/Lie/HighestWeight/Lattice.lean:54`) is the orbit of the highest vector of `L(λ)` under `LieAlgebra.Basis.kostantForm`.
- That form is `TauCeti.UniversalEnvelopingAlgebra.kostantForm` on the simple generators (`Kostant/Basis.lean:98`).
- `isLattice_highestWeightLattice` (line 137) proves it is a full lattice for dominant integral `λ`.

It is stated for split Lie algebras with a nondegenerate Killing form, so it covers `𝔰𝔩_N` but not `𝔤𝔩_N`, and it has no dual lattice. It would read: "Tau Ceti has the Kostant orbit lattice of the highest vector for split semisimple Lie algebras (`LieAlgebra.Basis.highestWeightLattice`), but not for `𝔤𝔩_N`, and no dual lattice."

## C04 — The operator `𝔭_{ij}` in the route of 2.1 (b) is not a projector when `j − i ≥ 2`

The route calls `𝔭_{ij}` "the truncated extremal projector of its `𝔰𝔩_2`". Its `k = 0` coefficient is `(j − i − 1)!/(j − i)! = 1/(j − i)`, so for `j − i ≥ 2` it is not a projector. It is `1/(j − i)` times the `(i, j)` factor of the extremal projector of `𝔤𝔩_N` on ad-weight 0, whose coefficients are `(j − i)!/(k!(k + j − i)!)`.

The route is consistent with its own normalisation. `Inv(T) = (dim V_{λ′}·dim V_{λ″}/dim V_λ)·id`, so `S₀(T) = ∏(j − i)^{−1}·Inv(T) = 1/z`. Nothing stated changes. Naming it "`1/(j − i)` times the `(i, j)` factor of the extremal projector of `𝔤𝔩_N`" would be accurate.

The same paragraph uses `j` both as a root index and for `j − i − 1`, in "`(j + k + 1)!/(j!·k!)`". A separate letter would help.

## C05 — The description's inventory of `Suggested.lean` mixes theorems and definitions

The description says "2 headline theorems … and 5 definitions with real bodies". It then lists, among the examples, the theorem `branchingInteger_ne_zero_and_abs_le`, followed by "and others". The only declaration left out is the second theorem, `fischerNormSq_highestWeightVector`.

It would read: "2 theorems (`branchingInteger_ne_zero_and_abs_le`, `fischerNormSq_highestWeightVector`) and 5 definitions (`interlacingDefectSet`, `branchingInteger`, `leadingMinor`, `highestWeightVector`, `fischerNormSq`)". Update the counts once R01 is addressed.

## N01 — LaTeX inside code spans

`\overline{f_α}` appears in the Conventions (line 19), and `\overline{g_μ}` in 3.1 (line 274). Use `f̄_α` / `ḡ_μ` or `conj(f_α)`.

## N02 — 3.1 changes two conventions

3.1 indexes from `1`, and its Fischer form is conjugate-linear in the second argument. The rest of the README indexes from `0`, and the Conventions conjugate in the first argument. This is harmless for the norms stated, but one convention would spare the reader a check.

## Questions for the author

- 0.3 (a) states, over a DVR, the admissible lattice `U_ℤ·v` and the contravariant duality `∇_O = Δ_O^∨`. The Scope paragraph assigns these to ReductiveGroups §§9A and 10B. Is the new content of (a) only that every `U_ℤ`-stable `M` with `M ∩ (V_λ)_λ = O·v` lies between the two lattices? If so, would (a) cite §§9A, 10B for the rest? I did not find that minimal–maximal property stated in §10B, so I cannot tell whether it is a restatement.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.1 basis, saturation | `GL_3`, all 28 `λ` with `λ_0 ≤ 6` | Smith invariants of all bideterminants all `1`, weight by weight; ranks = Weyl dims (8 for `(2,1,0)`); 9 column-strict fillings vs rank 8 | holds |
| 0.3a step projector | `N = 2`, weight 0 of spin `j`; `End(K²)` | `Σ_q(−1)^q C(j+q,q)C(j,q)/(q+1)` = 1 at `j = 0`, 0 for `j ≥ 1`; `L = 1`, exponent 1 at `p = 2`, attained by `e_00` | holds |
| 0.3 (b) sandwich | `GL_3`, 28 weights × `p ∈ {2,3,5,7}` | least exponent ≤ `e − v_p(dim)` in 112/112; `(6,3,0)`: 3 = e; `(5,2,0)`: 2; `(4,2,0)`: 0; `(2,1,0)`: 1 | holds |
| 0.3 Check, divided powers | `(4,0)`, `p = 2` | undivided index at `(0,4)` = 24 (`v_2 = 3 > e = 2`); divided indices 1,4,6,4,1 | holds |
| 0.2 open alcove | `(a,0)`; `(4,2,0)`, `p = 3` | `a = p`: `C(p,1) = p`; `a = p−1`: `Δ = ∇`; Steinberg `(4,2,0)`: all invariants 1 | holds |
| Conventions duality `Δ = ∇^∨` | `(2,0)`, `(2,1,0)`, `(2,2,0)`, `(3,1,0)`, `(4,2,0)`, `(3,2,1,0)` | det Gram(Δ) = index = 2, 3, 8, 4096, 819200000000, 54481006265625 | holds |
| 1.1 (a), (d) `c_Br` | 1815 interlacing pairs, `N ≤ 5` | `c_Br ≠ 0` and `|c_Br| ≤ (λ_0−λ_{N−1}+N−2)^{(N−1)D₁}` throughout; values 4, −36, 576, −120 match | holds |
| 1.1 (a) integrality | 50 `GL_3 ↓ GL_2` pairs | `c_Br·io⁰` integral 50/50; `io⁰` non-integral 15/50; max `⟨ξ,ξ⟩_λ` = 1 | holds |
| Lean `branchingInteger` | `m = 2`, `decide`; `m = 0` | `(3,1,0)/(2,0)` = 4, `(4,2,0)/(4,0)` = 576; `m = 0`: value 1, bound `(−1)^0 = 1` | holds |
| 2.1 (b) block cut | `GL_3` (`λ_0 ≤ 6`), `GL_4` (`λ_0 ≤ 4`), all `a`, `ℓ ≤ 7` | 1148 cases, no violation; `(6,3,0)`, `ℓ = 3`: bound 3 = ex 3 | holds |
| 2.1 (d) linkage Check | `(3,0)` vs `(2,1)`, `(2,0)` vs `(1,1)`, mod 3 | `{0,2} = {2,0}`; `{2,2} ≠ {1,0}` | holds |
| 2.2 (a), (b) | 24456 (weight space, prime) cases, 5 block shapes, `ℓ ∈ {2,3,5}` | no exponent above `e_L + v_ℓ(D)`; corollary of (b) never exceeded | holds |
| 2.2 Checks | `(w,2,0)`, `3 ≤ w ≤ 9`; `(w,1,1)` | divisors `[1,8],[2,10],[1,36],[2,28],[1,80],[2,54],[1,140]` as claimed; `w−2`; `w−1` | holds |
| 2.2 (c) bound | 678,424 instances, `GL_2`–`GL_4` | no exponent above `⌊c_W⌋` | holds |
| 2.2 (c) Check sentence | `GL_4` `(2,1,0,0)`, `κ₀ = 3`, `ℓ = 7`, `h = 5` | `c_W = 12/7` vs claimed `0`, "`< 0`" | false (R03) |
| 3.1 hook product | 78 shapes, `l ≤ 3`, `n ∈ {l, l+1}` | Fischer norm = `H(a)` throughout; `(2,1)`: 3, `(2,2)`: 12 | holds |
| 3.2 (a), Lean `fischerNormSq_highestWeightVector` | `N ≤ 5`, `|λ⁰| ≤ 7` | `∏λ⁰_s! ≤ H ≤ (λ⁰_0+N−1)^{C(N,2)}∏λ⁰_s!` all; `‖v_{(3,2,1,0)}‖² = 45 = H(3,2,1)` | holds |
| 3.2 (c) slopes | `(2,0)`; `(3,2,1,0)` | `μ(Δ) = −0.231 ≥ −1.386`; `μ(Δ) = −0.494 ≥ −9.64` | holds |
| 3.3 bound | `ν = 1`; `ν = 2` standard | both sides 0; `μ_max(M) = 0 ≤ 8f·log 2`; general route absent | unsupported (R02) |
| 3.4 Check `k = 1` | fractional ideal `𝔞`, twist `s` | both sides `s·log N(𝔞)`; opposite sign gives `−s·log N(𝔞)` | holds |
| Headline 1 statability | polynomial-model definitions | global, local and block-cut statements elaborate at pins | statable (R01) |
| 2.1 (b) route `𝔭_{ij}` | `j − i = 2` | `k = 0` coefficient `1/2`; `S₀(T) = 1/z` consistent | mislabelled (C04) |

- Source locators checked against text: 0 of 3 located citations (all Jantzen, not available); the announcement was read in full (`Announcement`, pages 1–4) and gives no locators for this material.
- Tau Ceti declarations opened at the pin:
  - `kostantForm` (`Kostant/Form.lean:125`), `LieAlgebra.Basis.kostantForm` (`Kostant/Basis.lean:98`);
  - `highestWeightLattice` (`HighestWeight/Lattice.lean:54, 137`), `orbitOfRep` (`Algebra/Module/IntegralOrbit.lean:40`);
  - `complementedLattice_lieSubmodule_of_isSemisimple_center` (`Reductive/CompleteReducibility.lean:107`);
  - `hsymm_mul_schurPoly` (`Schur/Pieri.lean:393`), `sum_aeval_schurPoly_mul_aeval_schurPoly` (`Schur/Cauchy.lean:71`);
  - `hookLength` (`HookLength/Basic.lean:138`), `prod_hookLength_mul_prod_betaNumber_sub_eq_prod_factorial` (`HookLength/BetaNumbers.lean:241`);
  - `weylDimension` (`WeylDimension/Basic.lean:180`), `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`Schur/Basic.lean:216`), `weylModuleOfShape` (`WeylModule/Basic.lean:431`).
- Mathlib declarations opened at the pin: `Nat.factorization_choose_le_log` (`Data/Nat/Choose/Factorization.lean:195`), `Nat.Prime.emultiplicity_factorial` (`Data/Nat/Multiplicity.lean:97`), `Ring.choose` (`RingTheory/Binomial.lean:386`), `MonomialOrder`, `LieModule.Weight`, `SemistandardYoungTableau`.
- Cross-roadmap citations resolved, 24 in all:
  - on main: ReductiveGroups §§9A, 10B, 10D; ClassicalGroups §0.4, Layer 3, §§4.1, 4.2, 5.1, 6.1, 6.6; GroebnerGeometry G5; SchurWeyl Layers 0, 5, 7; CompactGroups §4.1;
  - at the open heads: SlopesOfHermitianVectorBundles §§1.2, 1.3, 1.7, 2.1, 2.2, 2.4 (b), 3.5; HermitianFormsAndLattices §4.0 (dual `{x : h(x, L) ⊆ O_E}`, so self-dual lines have slope 0, as the Checks of 3.3 need).
- Automatic checks: all passed at this head. The dependency check reports `depcheck: 170 roadmaps, 1984 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings. `#check @name` for all 7 declarations matches the README; no binder is lost.
- One-tactic probe: `simp`, `positivity` and `exact?` close none of the sorried statements. No padding.

Overlap check: I read ClassicalGroups, SchurWeyl and TensorProductCombinatorics on main, and LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups and GluedTargetAndDivisionInequality at their open heads.
- Capelli generators: owned by ClassicalGroups §6.6, cited here.
- Hook lengths, Pieri rule, Cauchy identity: in SchurWeyl and Tau Ceti, cited here.
- The sandwich exponent, integral branching and the hook-product Fischer norm: owned here and cited by the three open roadmaps.
- ThetaChainsOnDefiniteUnitaryGroups §3.1 restates the definitions of `∇_ℤ(λ)` and `Δ_ℤ(λ)` with a lemma of its own. This roadmap is the earlier owner; the repair belongs in that roadmap.
- Ownership against the open pull requests of the brief's list was checked by object search (`roadmaps grep`).

Source independence: 7 passages compared with 1 source (the announcement), none shared:
- the Summary;
- the routes of 0.3a and 3.2;
- the statements of 1.1, 2.2 (definitions) and 3.3;
- the module docstring.

The formal proof's prose could not be compared, because its readable form here is compiled declarations. None of the 7 `Suggested.lean` names occurs among its declaration names.

The largest share of attributions goes to the formal proof (8 sections, 0 exact locators). The largest share of exact locators goes to Jantzen (3 of 3). Contents were compared with the formal proof's module tree: independent. Its modules mix branching with sandwich divisors and bideterminant bases with graded divisibility, while the layers here are organised by object. Jantzen's contents were not opened.

Research link: the lattices, branching maps, exponents and slopes feed the family's theta-chain roadmaps toward the Riemann hypothesis for Dirichlet L-functions, after Alpöge's formal proof (Announcement, p. 4, items 8–10, 13: lifts between definite unitary groups, norms and divisibility, Bost's slope inequality). The classical setting is Kostant 1966 and Carter–Lusztig 1974 (README References).

## Not verifiable

- 0.1: Doubilet–Rota–Stein 1974 and De Concini–Eisenbud–Procesi 1980 are cited without locators. Checked by computation instead.
- 0.3a, 0.3, 1.1, 2.1 (b) and (d), 2.2, 3.2 (b)–(d), 3.3: credited to the formal proof with no locator. Its GitHub repository is on a host the sources service does not classify. The readable copy available is compiled declarations plus a module list.
- 0.2: Jantzen II.5.6 is cited for the closed alcove, which is not stated; the book is not available legally online.
- 1.1: Zhelobenko 1973, Gelfand–Tsetlin 1950, Capelli 1887 and Howe–Umeda 1991 are cited without locators.
- 2.1 (e): no source is cited.
- 3.1: Frame–Robinson–Thrall 1954 and Capelli 1887 are cited without locators. Checked by computation.
- 3.4: no external source; the route was read.

## Source issues

- none

## For the human reviewers

- Scope: 0.3a, 0.3, 1.1, 2.1 (b) and (d), 2.2 and parts of 3.2–3.3 rest on one Lean formalization announced 20 November 2026 (Announcement, pp. 1–2: "only present Lean"). It is unpublished and unrefereed, and no published source is cited for these results.
- Licence: the formal proof's repository (README References, line 431) could not be fetched through the sources service, and its licence was not read. The announcement is on the author's own page.
- The family index says "The family follows the formal Lean proof … by Levent Alpöge" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14). The principles say a roadmap does not say it follows a source.
- Not tested: Jantzen, the source of the only exact locators, could not be read, so neither its wording nor its contents were compared.
