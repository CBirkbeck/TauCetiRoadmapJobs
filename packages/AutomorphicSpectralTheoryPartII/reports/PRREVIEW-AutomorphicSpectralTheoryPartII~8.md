# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at fa09a92)

**Verdict:** accepted

**Summary.** Accepted: the full re-review found no false, unsupported or unowned statement; every recomputed Check, the fifteen sampled statements read against BPLZZ and BPCZ, and the three Lean headlines agree with their sources and with each other. There are two small corrections (the owner cited for the primary factors and their products is not the owner on main; one locator points at the neighbouring subsection) and two format notes, none blocking. Two points are left for the human reviewers: the parallel between the order of Layer 2 and BPCZ §§2.4–2.5, and the direction of the dependency on GanGrossPrasadUnitaryGroups recorded in the pull request's generated blocks.

## C01 — The primary factors, their locally uniform products and exact zero orders are owned on main by AnalyticNumberTheoryPartI §0.15, not by GlobalHolomorphicFunctions

A reader who looks for the supplied convergence and simple-zero statement under the cited heading does not find it. The README says (Scope and ownership, line 1563) "GlobalHolomorphicFunctions, **Preparatory primary factors and locally uniform products**, owns the elementary factors, locally uniform product construction and exact zero divisor", and repeats the attribution in the Summary (line 5), in the *Needs* of §0.2 (line 91), in the supplier contract (line 1699) and in the docstring of `finite_rank_weierstrass_product` in `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean` (lines 90–93). On main, `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md` has no section of that title: its layer is "Layer 1: preparatory locally uniform products" (line 876), whose §1.1 (lines 880–884) states that the factor `E_p`, its normalisation and simple zero, the compact-summability product theorem and the product with exact orders "are AnalyticNumberTheoryPartI §0.15", and whose Scope (lines 43–46) says the same. `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` §0.15, "Weierstrass primary factors and locally uniform products" (line 530), is the statement used here: for nonzero points `a_i` with `Σ_i (R/|a_i|)^(p_i+1) < ∞` for every R, the product of `E_(p_i)(z/a_i)` converges locally uniformly to an entire function with order at z equal to the number of i with `a_i = z`; constant `p_i = p` and distinct points give exactly the first four conjuncts of the Lean headline. GlobalHolomorphicFunctions §1.3 owns only the equivalence, at constant genus, between rank summability and absolute locally uniform convergence.

The smallest change: cite AnalyticNumberTheoryPartI §0.15 for the factor, the convergence and the exact orders in those five places (it is on main and earlier in the merge order, so no order changes), and keep GlobalHolomorphicFunctions Layer 1, §1.3 for the constant-genus criterion if it is wanted. The growth bound `exp(C(1+|z|)^(p+1))` remains this roadmap's own.

## C02 — The quotient height of §2.1 is BPCZ §2.4.1, not §2.4.2

The locator of §2.1 (line 482) reads "(BPCZ §2.4.2–2.4.3, Lemma 2.4.3.1, pp.203–205)" for the weights and for the imported height `n_P(x)=inf‖px‖` with `σ_P=1+log n_P`. In BPCZ, §2.4.2 is the height on adelic vector spaces (bpcz line 907); the height on G(𝔸), its quotient version `‖x‖_P` as an infimum over `M_P(F)N_P(𝔸)` and `σ_P` are §2.4.1, pp.202–203 (bpcz lines 853–869), and the weights and Lemma 2.4.3.1 are §2.4.3, pp.204–205 (bpcz lines 923–962). The locator would be right as "BPCZ §2.4.1, pp.202–203, and §2.4.3, Lemma 2.4.3.1, pp.204–205".

## N01 — Two sentences say the roadmap follows a source

The Summary (line 3) says "For the analysis on automorphic quotients it follows Beuzart-Plessis, Chaudouard and Zydor", and the proof route of §2.1 (line 492) begins "Follow Lemma 2.4.3.1". The first would read as well as "The analysis on automorphic quotients uses the weighted spaces of Beuzart-Plessis, Chaudouard and Zydor"; the second as "Use the argument of Lemma 2.4.3.1".

## N02 — A bold label that is not the cited section's title

Scope and ownership (line 1563) cites "ModularCurvesPartII §1.4a, **Lattice sigma function**"; on main that section is titled "Sigma, quasi-periods and the oriented Legendre relation". Use the title, or drop the bold.

## Verified sound

**Previous findings.** The previous review (of 63133f5) was an acceptance with no finding and no correction; nothing to carry. Its two remarks without a change request still describe this head (the §4.8 heading; the module docstring's names for §§2.7–2.8 and §§4.8–4.9).

**Adversarial table.**

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `finite_rank_weierstrass_product` (§0.2) | Λ=∅; Λ={0}; Λ={0,a}, p=0; Λ=ℤ, p=1; z=0 with 0∉Λ | 1, never 0; z, derivative 1; z(1−z/a), derivatives 1 and −1; \|E_p(w)\|≤exp(C_p\|w\|^(p+1)) summed over rank majorant; z⁰·∏E_p(0)=1≠0 | true | C01 (owner of first four conjuncts) |
| `polynomial_zero_fiber_interpolation` (§0.3) | ψ≡0; n=0; q constant c; ψ=sin(π·), q=z² | ν=0; one point, ν=0 or 1; exp(Σz_j^(2q₀)) zero-free; modulus ≤exp(C(1+‖z‖)^(d·deg q) − Σy_j^(2q₀)+O(1)) on strips, q₀ odd | true | none |
| `affine_lattice_interpolation` (§0.3) | k=0; n=0; n=k=1, a=0, b=1, A={0}; b=(1,1) dependent; ℤ[i]⊂ℂ | lattice {a}; ν=0 or 1; exp(z²)sin(πz)/(πz): 1 at 0, 0 on ℤ∖0; excluded by hypothesis; excluded (ℝ-rank 2) | true | none |
| §0.2 Checks | p=0,1,2 at w=2 and w=1; Λ={0,1,2}, z=3 | −1, −e², −e⁴; derivatives −1, −e, −e^(3/2); 3·(−2)·(−1/2)=3, partial −6 | true | none |
| §0.9 difference operators | f=z, λ=1; s(z)=−z on z and on 1; f/z on 1 | z−1; 2 and 0; 1/z not polynomial; t_λt_η f(α)=f(α−λ−η) | true; bplzz lines 645–653 | none |
| §0.10 strip estimates | S=(1−s)/ℓ_s on z²+z; μ/ℓ_s | 2; value at 0 is 2f′(0); source has exponent shift r_S for S, none for division (bplzz lines 658–663, 684–689) | true | none |
| §1.1 Schwartz descriptions | exp(−(log t)²); 1/cosh(log t); compact G | transform √π·exp(λ²/4); π/cos(πλ/2), poles ±1; S=C∞; equality with ⋂C^p iff centre compact (bplzz lines 540–546) | true | none |
| §1.2 integrated action | π_t(x)=exp(itx), L(X)f=−f′ | π_t(L(X)f)=−∫f′e^(itx)=it·π_t(f); t=1,2 give i, 2i; f=exp(−πx²), t=0 gives 1 | true | none |
| §1.4 translated characters | torus, τ of weight λ | δ(z) acts by z(α+λ); t₋λz(α)=z(α+λ) matches; source's t_λz gives z(α−λ) | true (README corrects the source's sign) | none |
| §1.5 generic semisimplicity | collision locus w(ν+λ)=ν+λ′, w≠1 or λ≠λ′ on a₀ | proper affine subspace of the twist space; pieces then have distinct characters, filtration splits | true; bplzz lines 971–984 | none |
| §1.6 L² estimates | max over θ∪{1} against the source's max over θ | README bound is the weaker one, so follows from (2.4) (bplzz line 814); SU(2): 0 in lattice, not a character | true | none |
| §1.7 moderate-symbol multiplier (headline) | μ=1; SU(2) | identity; lattice ρ+X*=ℤ contains 0, characters are ±1, ±2, …; kernel stated on actual characters | true; bplzz lines 548–553, 1039–1040 | none |
| §2.1 weights | w=1; w=exp(t) on ℝ_{>0}; w=n_P^a | C_U=1; w(2t)/w(t)=exp(t) unbounded; weight; w(xg)≪w(x)‖g‖^N (bpcz line 938) | true | C02 (locator) |
| §2.3 depth and modulus | GL₂ Borel, diag(a,1); GL₃ Borel, diag(t²,t,1), t=2; Res_{K/F}GL₂ degree 2, norm 2 | both ≍\|a\|; min(t,t,t²)=2 against product 16; \|N(a)\|^(1/2)=4^(1/2)=2 | true; bpcz lines 999–1082 | none |
| §2.16 constant terms | P=Q; GL₂ Borel as \|a\|→0 and →∞; mass-one compact quotient | identity, δ_P^P=1; δ^(cN)n^N≍\|a\|^(cN−N) bounded for c≥1, \|a\|^((c+1)N) against rapid decay; ⟨CT1,1⟩=1=⟨1,EP1⟩ | true; bpcz lines 1416–1454 | none |
| §§2.17–2.18 | quantifiers in (2); direction of w′≪w | N before r in both texts; embedding needs L²_w⊂L²_w′, surjection needs L²_w′⊂L²_w | true; bpcz lines 1460–1471, 1599–1618 | none |
| §3.8 kernels | ℝ/ℤ, f=e₋ₙ; trivial group | ∫e₋ₙ(y−x)φ(y)dy=eₙ(x)⟨φ,eₙ⟩: projector onto eₙ; f=eₙ gives e₋ₙ; f(1) | true; bpcz lines 2420–2429 | none |
| §§3.9–3.10 | circle, Y=iD−1 and Y=D on conj(e₁) | Ye₋₁=0, Ye₁=−2e₁, so 0≤0 against false 2≤0; coefficient −i on both sides | true; bpcz lines 2431–2443, 2481–2508 | none |
| §4.1 T-characters | T all finite places; S₃ model, K=⟨(12)⟩ | H_G^T=ℂ; (23)(1,1,−2)=(1,−2,1) not fixed; e_Kδ_(23)e_K gives (−1/2,−1/2,1) fixed | true; bplzz lines 1063–1107 | none |
| §4.2 CAP | torus; T all finite places; changing finitely many χ_v | no proper parabolic; condition vacuous, so CAP when a proper cuspidal datum exists; unchanged | true; bplzz lines 1091–1095 | none |
| §5.3 isolation (headline) | M=G with different finite characters; χ occurring in a datum | μ∞⁰⊗(h−χ_σ(h)): values 0 and nonzero; annihilator would vanish at χ, so excluded; 2·3/6=1 | true; bplzz lines 1428–1448 | none |
| §5.4 non-CAP isolation (headline) | M=G occurrence; proper M occurrence | (a_G^G)*=0, so occurrence is χ_σ=χ and the sum is L²_cusp[χ]; implies CAP, excluded | true; bplzz lines 1120–1130, 1449–1458 | none |
| §5.5 preservation | π not automorphic; G=GL₁ with π=ω⊗χ at one place | subspace may be 0 with π(μ⋆f)=π(f); nearly equivalent to ω, gives the line of ω | true; bplzz lines 53–63, 81–84, 1125 | none |
| §4.5a counting (Check) | PGL₂(ℤ)∖ℍ; definite quaternion | area π/6, Weyl R/24 even forms, R/12 both parities; finite dimension, any d>0 | true | none |
| §3.6a (WR) constants | GL₁, GL₂, GL₃, product | 1, 2/5, 1/5, min=1/5; lapid line 724 gives 2/(n²+1) | true | none |

- Source locators read against the text: 46 (bplzz 31, at lines 53–98, 394–443, 451–512, 540–578, 590–599, 603–607, 621–624, 645–691, 744–775, 803–824, 971–984, 1039–1042, 1063–1130, 1149–1198, 1217–1234, 1263–1279, 1325–1333, 1352–1376, 1428–1437, 1449–1487, 2104–2180; bpcz 14, at lines 706, 853–869, 923–994, 995–1082, 1117–1133, 1298–1344, 1416–1471, 1536–1543, 1599–1618, 2420–2443, 2481–2508; lapid 1, at line 724). All fifteen sampled targets agree with their locators; C02 is the one inexact locator.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): `SchwartzMap` (Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75), `Differentiable` (Mathlib/Analysis/Calculus/FDeriv/Defs.lean:172), `Multipliable` (Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:115), `MeasureTheory.Lp` (Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89), `CentroidHom` (Mathlib/Algebra/Ring/CentroidHom.lean:56), `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164). Neither pin has an elementary Weierstrass factor or canonical product for entire functions (the only matches are power-series Weierstrass preparation).
- Cross-roadmap citations resolved: AutomorphicSpectralTheory §§0.11–0.15, 0.50, 1.5–1.10, 2.1–2.5, 2.3a, 3.1–3.6, 3.6a, 4.1–4.5, 4.14a, 5.1, 6.1–6.4, 7.1a; AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.1–2.4, 2.7, 3.4–3.5, 4.1–4.2; AdelicAlgebraicGroups §§2.1–2.3, 3.1, 3.4–3.6, 4.6–4.7; ArithmeticLocallySymmetricSpaces ALS.F.6 (iv); AutomorphicLFunctionsAndLocalFactors AL.R.2, AL.R.4, AL.3.6.1–2, AL.3.7.2; SmoothRepresentationsOfLocalGroups SR.1–SR.4; PseudodifferentialOperators §§5.1, 6.1; SpectralManifolds SM3; ReductiveGroups Layer 7; LieGroups Layers 6–7; OperatorIdeals OI-B32–B41, OI-B84, Part C; VonNeumannAlgebras V4.Core; CongruenceSpectralGap §5.1; PDE Layer 1 (targets A1–A5); ZerosOfLFunctions 5.1–5.6, all on main; LocallyConvexDuality §§5.1–5.2 and GanGrossPrasadUnitaryGroups §§6.2a–6.4 at their open heads. Two do not resolve as written: C01 and N02.
- Declared gaps: the sixteen slugs each appear once in the supplier contracts with the supplier and sentence of the plan; none asks for something a supplier on main already states (searched AutomorphicFormsOnReductiveGroups for Plancherel, Kostant centralizer and minimal types; AdelicAlgebraicGroups for fibre bounds; OperatorIdeals for the Hilbert–Schmidt composite; SmoothRepresentationsOfLocalGroups for exponential-polynomial Hecke values).
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside the folder.
- Automatic checks at this head: all passed. Elaboration of `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean`: three `declaration uses sorry` warnings (lines 95, 108, 118), nothing else; `#check` of the three theorems returns the signatures compared above with the README (no binder lost; the seven definitions have real bodies).
- Headlines and padding: the Summary's analytic headlines (canonical-product bound, two interpolation theorems) are stated; the multiplier theorem (§1.7), isolation (§5.3) and non-CAP isolation (§§5.4–5.5) need the reductive Schwartz algebra and the automorphic Hilbert decomposition, absent at the pins, and are named in the module docstring. One-tactic probe on a copy of the file: `simp`, `rfl`, `infer_instance`, `aesop` and `decide` each fail on all three theorems; none is padding.
- The pull request's text: each sentence of the title, summary block and prose was read against this head (rank-zero sets admitted against bplzz lines 394–404; arbitrary measurable weights; T possibly infinite; Lean imports only Mathlib; three files added, 1845 lines, nothing removed) and none is contradicted.

Overlap check: read AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, GanGrossPrasadUnitaryGroups; nothing shared. The compact Paley–Wiener multipliers and compact-test kernels stay with AutomorphicSpectralTheory §§6.1–6.4 and are extended, not restated; the transfer-preservation theorem is GanGrossPrasadUnitaryGroups §6.3a; the T-multipliers and isolation theorems are stated only here (a search of every roadmap on main and at the open heads for the isolation theorems, T-multipliers and Delorme's multipliers finds no second statement). Ownership against the other open pull requests was checked by that search only.

Source independence: 15 passages compared with 3 sources (bplzz, bpcz, lapid), none shared beyond definitions the mathematics forces (longest common run about nine words, the opening quantifiers of BPCZ Lemma 2.10.1.1 in §3.9); largest share bplzz, 47 of 92 parenthetical locators; contents compared with bplzz: independent (Layer 0 draws on its §§2.1, 2.2 and 2.4, Layer 1 on §§2.3–2.4 and Appendix A, Layers 4–5 on §3, with Layers 2–3 from other sources between them). Bernstein's text could not be read.

Research link: The headline targets are the multiplier and isolation theorems of Beuzart-Plessis–Liu–Zhang–Zhu (2021 preprint, Theorems 2.13, 3.6, 3.19), used there for the Gan–Gross–Prasad conjecture, with the quotient analysis of Beuzart-Plessis–Chaudouard–Zydor (2022) and Lapid (2013); rests on the sources read (bplzz §§1–3, bpcz §2).

## Not verifiable

- `bernstein` (cited at §§2.7–2.8): settled as uncertified, cited by locator only.
- The primary texts of Delorme, Sakellaridis, Aizenbud–Gourevitch, Trèves, Donnelly, Müller, Arthur, Müller–Speh, Brumley and Kostant: not opened; the README locates each at its use in bplzz, bpcz or lapid, and those uses were read where sampled (bplzz lines 741–761, 1267, 1460–1461, 2099–2180; lapid line 724).
- The placement of complex conjugation in BPCZ Lemma 2.10.2.1: the extraction drops overlines; the reading used in §3.10 is the one forced by (2.10.2.6) (bpcz line 2524).
- The description's count of earlier review rounds: a record of the board, not of this head.

## Source issues

- **Gap** in bplzz at Corollary 2.6, pp.9–10: the source says complex-linear coordinate forms can be chosen integral on any lattice of the complexified space; it should assume the lattice lies in the integer span of a complex basis; affects the proof.
- **Error** in bplzz at §2.2, first notation list, p.10: the source says the automorphisms of the root datum of order at most two form a finite set; it should say this only for the Weyl coset of the real form (a rank-two torus has infinitely many); affects nothing.
- **Misprint** in bplzz at Lemma 2.22, proof, p.16: the source says the annihilating polynomial has roots the translates of z by the weights under the stated translation convention; it should use the opposite translation (roots z(α+λ)); affects nothing.
- **Error** in bplzz at Remark 2.16, p.12, and the proof of Proposition 2.24, p.18: the source says the infinitesimal characters of irreducible admissible, respectively tempered, representations are exactly the union of the shifted strips; it should say they are contained in it (SU(2): the lattice point 0 is not one); affects a stated result.
- **Misprint** in bplzz at Theorem 3.19, p.29: the source says the decomposition used is (3.9); it should be (3.2); affects nothing.
- **Gap** in bplzz at the sentence after Theorem 3.19, p.29: the source says Theorem 1.3 follows from the cuspidal strong multiplicity one theorem; it should use the isobaric classification cited in its introduction; affects the proof.

## For the human reviewers

- Arrangement: against bplzz (47 of 92 locators) the layers are independent. Inside Layer 2, §§2.1–2.18 run in the order of bpcz §§2.4.1–2.5.15 (`2.1 ↔ 2.4.1–2.4.3`, …, `2.18 ↔ 2.5.15`); the *Needs* chains 2.1→2.2→2.3, 2.6→2.7→2.8→2.10→2.11, 2.9→2.12→2.13→2.14, 2.16→2.17→2.18 force most of that order.
- The pull request's generated blocks list GanGrossPrasadUnitaryGroups (#1404) as a supplier that merges first; the README names it only as a consumer (line 1545) and owner of §6.3a, and its open head addresses its isolation contract to AutomorphicSpectralTheory, not to this roadmap.
- `bernstein` (cited at §§2.7–2.8) could not be read; its two uses are also located in bpcz §2.5.5, which was read.
