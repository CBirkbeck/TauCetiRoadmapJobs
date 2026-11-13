<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6856970041 -->
Red team round 1 pass b (claude) of d6f2f83

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the projective-cover pairing is imported from a supplier that does not state it, and the pin proves it

   - Location: `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1733-1735`: "the last is
     the projective-cover pairing of GL2AutomorphicRepresentationsAndTransfer §R17.5.11, read over
     `k̄` and descended to the splitting field `k` with §0.6"; also lines 99-104, 392-399, 1738, 1839.
   - Claim: §R17.5.11 supplies `dim Hom(P_σ, M) = [M : σ]`.
   - Witness: GL2AutomorphicRepresentationsAndTransfer README, §R17.5.11 (head of its open pull
     request): the pairing occurs only in the paragraph beginning "Proof:" ("the pairing is the
     dimension of Hom"); the stated API is Brauer characters, additivity and the lattice comparison.
     The pinned Tau Ceti has the statement:
     `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`,
     `TauCeti/Algebra/Module/ProjectiveCover/Multiplicity.lean:158` (split form, any field `k`,
     hypothesis `Module.finrank k (Module.End A S) = 1`, `M` finite-dimensional).
   - Repair.
     1. In "From Tau Ceti" add: "`TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`
        (`TauCeti/Algebra/Module/ProjectiveCover/Multiplicity.lean`): for a field `k`, a `k`-algebra
        `A`, a projective cover `P → S` of an `A`-module `S` with `dim_k End_A(S) = 1`, and an
        `A`-module `M` finite-dimensional over `k`, `dim_k Hom_A(P, M)` is the Jordan–Hölder
        multiplicity `TauCeti.jordanHolderMultiplicity A M S`. Applied with `A = k[Γ]`, `S = σ` and
        `M = V̄`; the hypothesis holds because `k` splits `Γ`."
     2. In §5.4 replace the quoted clause by: "the last is Tau Ceti
        `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`, with
        `dim_k End(σ) = 1` because `k` splits `Γ`." and its *Needs:* tail by "Tau Ceti
        `TauCeti.exists_projective_quotient_smul_top_linearEquiv`,
        `Ideal.nonempty_linearEquiv_of_quotient_smul_top`, `TauCeti.exists_isProjectiveCover_of_finite`
        and `TauCeti.IsProjectiveCover.finrank_linearMap_eq_jordanHolderMultiplicity`."
     3. Delete the subsection "From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer"
        (lines 392-399) and, in the scope bullet (lines 99-104), keep only: "Brauer reciprocity and
        decomposition numbers for arbitrary finite groups are not part of this roadmap: §5.4 obtains
        the instance `[L ⊗ P̃_σ : V] = [V̄ : σ]` for `Γ = GL₂(k_F)` by composing the pinned
        multiplicity formula with the pinned projective lifts and Hom base change." (The Brauer
        character comparison is not used: §5.4 itself derives that `[V̄ : σ]` does not depend on the
        lattice.)
     4. Line 414: "except for §0.6, used in §9.1"; line 1839: drop
        "GL2AutomorphicRepresentationsAndTransfer §R17.5.11; Layer 0 (§0.6);".
   - Tested on the Check of §5.4: `f = 1`, `σ = Sym^{p−1}`, `P_σ = σ`: `dim Hom(σ, St̄) = 1 = [St̄ : σ]`
     and `dim Hom(σ, k) = 0 = [k : σ]`; `End(σ) = k` over every `k`.

2. **F02** (P3) the direction of use between the two Serre-weight suppliers is reversed

   - Location: `README.md:286-287`: "The Serre weights, the compact induction and the Hecke operator
     it uses are the declarations of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 below."
   - Claim: PadicLocalLanglandsForGL2Qp §2.7 uses R07.5.15's declarations.
   - Witness: FiniteFlatGroupsAndIntegralPadicHodgeTheory README, R07.5.15, first sentence: "Use
     PadicLocalLanglandsForGL2Qp §§2.7–2.8's `SerreWeight`, `compactInduction`, `heckeOperatorT`,
     `endEquivPolynomial` and `compactInduction_free` for `F = ℚ_p`, and extend them". The order has
     PadicLocalLanglandsForGL2Qp at line 33 and FiniteFlatGroups at line 65.
   - Repair: replace the sentence by "For `F = ℚ_p` the declarations `SerreWeight`,
     `compactInduction`, `heckeOperatorT`, `endEquivPolynomial` and `compactInduction_free` are those
     of §§2.7–2.8, over a sufficiently large finite field; FiniteFlatGroupsAndIntegralPadicHodgeTheory
     R07.5.15 extends them to every `F` over `k̄` and identifies the two at `F = ℚ_p`." In the scope
     bullet (line 69) and the R07.5.15 bullet (line 301-302) replace "for every `F` including
     `F = ℚ_p`" by "for every `F`; at `F = ℚ_p` they are PadicLocalLanglandsForGL2Qp §§2.7–2.8's
     after extension of scalars to `k̄`".

3. **F03** (P3) PotentialAutomorphyInfrastructure §3.12 does not supply the derived invariants

   - Location: `README.md:330-332`: "§3.12 (derived ordinary comparison): the derived functor
     `RΓ(N(𝒪), −)` on the bounded-below derived smooth category with its Hecke action"; also lines
     75, 979, 1244.
   - Witness: PotentialAutomorphyInfrastructure README, §3.12: `derived_ordinary_comparison` is the
     isomorphism `RΓ(T_n(O)(b), ord RΓ(N_n(O), π)) ≅ ord_b RΓ(Iw_p(b,c), π)`; the derived invariants
     are the last interface bullet of §3.7 ("Derive `N`-invariants in the smooth monoid category,
     then apply exact localization").
   - Repair: lines 330-332 become "§3.7, last interface item: `N(𝒪)`-invariants derived in the smooth
     monoid category, with the Hecke action of the positive torus on each `H^i(N(𝒪), −)`; used for
     the cohomological ordinary parts `H^•Ord_B` of §2.2, whose `T`-finite Hom localisation is
     defined there."; line 75: "their derived version: the same §3.7"; lines 979 and 1244: "§3.7"
     in place of "§§3.7 and 3.12".

4. **F04** (P3) the finiteness of blocks and the Ext¹ computations are §5.2 of the supplier, not §5.1

   - Location: `README.md:803-804`: "use the finite Ext computation inside a block. *Needs:* §0.6;
     PadicLocalLanglandsForGL2Qp §§2.7 and 5.1."; also lines 289-290 and 883.
   - Witness: PadicLocalLanglandsForGL2Qp README: §5.1 defines blocks and the block decomposition;
     the list of blocks (each a finite set, cases (i)–(vi) with `p = 2, 3`) and "`Ext¹` computations
     between irreducibles" are in §5.2 ("Paškūnas's classification of blocks").
   - Repair: line 804 "PadicLocalLanglandsForGL2Qp §§2.7, 5.1 and 5.2."; line 289-290 "§5.1: blocks
     with fixed central character; §5.2: every block is a finite set of irreducibles, with the `Ext¹`
     computations between them, for every `p` (used by §1.4);"; line 883 add "5.2".

5. **F05** (P3) a layer is identified by a source's section

   - Location: `README.md:28`: "the `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł §1.4
     (Layer 1);".
   - Witness: CDN23 line 686 is the heading of its §1.4 and line 687 its standing hypothesis
     `F = ℚ_p`; §§1.1–1.6 of the README are, in order, CDN23 Proposition 1.17, 1.19, 1.20,
     Lemmes 1.22–1.23, Théorème 1.21, §1.4.3.
   - Repair: "the finite-length criteria for finitely generated smooth representations of
     `GL₂(ℚ_p)/p^ℤ`: finite type implies finite presentation, finite cosocle implies finite length,
     and the smooth-dual criterion (Layer 1);". The locators inside Layer 1 stay.

6. **F06** (P3) a pinned smoothness notion is not recorded

   - Location: `README.md:54-57` ("Suggested.lean carries a local copy of the smoothness predicate")
     and the "From Tau Ceti" list (lines 219-256).
   - Witness: `TauCeti.IsSmoothDiscrete`,
     `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259`, with
     field `stabilizer_isOpen (x) : IsOpen {g | X.ρ g x = x}`; it is the class in which the cited
     `TauCeti.ContCohomology.coindAcyclic` is stated.
   - Repair: add to "From Tau Ceti": "`TauCeti.IsSmoothDiscrete`
     (`TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean`): an object
     of `TopRep R G` with discrete underlying module and open point stabilisers; the coefficients of
     `TauCeti.ContCohomology.coindAcyclic` are of this kind. It needs a topological coefficient ring
     and a topology on the module, so `IsSmoothRep` of Suggested.lean states its second field for a
     bare `Representation`; for the discrete topology on the module the two agree."

7. **F07** (P3) the VIGNERAS11 entry gives the published title for the preprint that was read

   - Location: `README.md:2439-2442`.
   - Witness: VIGNERAS11 line 7 (the text read, arXiv:0909.4003v1) is titled "De GL(2, F) à
     Gal_{Q_p}"; `sources.toml` line 250 records that title.
   - Repair: "**VIGNERAS11** — Marie-France Vignéras, *Le foncteur de Colmez pour GL(2,F)*,
     Arithmetic Geometry and Automorphic Forms, ALM 19 (2011), 531–557; locators use the preprint
     arXiv:0909.4003v1, titled *De GL(2,F) à Gal_{ℚ_p}* (§5: …), whose numbering differs from the
     published Propositions 5.5–5.8."

8. **F08** (P2) QuiverRepresentations Layer 3 does not contain the socle, Krull–Schmidt or the left–right duality

   - Location: `README.md:387-390`: "Layer 3: finite-dimensional algebras, Jacobson radical, socle and
     radical series, injective envelopes and projective covers, Krull–Schmidt, and duality between
     left and right modules"; also line 97-98 and the twelve *Needs:* and Dependencies lines that cite Layer 3.
   - Witness: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md` (on main): the
     word "socle" occurs nowhere; Krull–Schmidt is Layer 2, §2.1 (line 481); §3.1 (lines 509-518)
     says the exchange of covers and envelopes under the `k`-dual "is the case R = k of ArtinAlgebras
     §2.3 and is not planned here". The socle is pinned: `TauCeti.socle`,
     `TauCeti/RingTheory/SimpleModule/Socle.lean:42`.
   - Repair.
     1. Replace lines 387-390 by: "Layer 2, §2.1: finite-length Krull–Schmidt decomposition.
        Layer 3, §3.1: for a finite-dimensional algebra, the nilpotent Jacobson radical, the
        semisimple quotient and projective covers; used for `GL₂(k_F)`-modules and for the
        finite-dimensional algebras `k[[K/Z₁]]/𝔪_{K₁}²` and `k[[I/Z₁]]/𝔪_{I₁}^n`."
     2. Add "### From TauCetiRoadmap.RepresentationTheory.ArtinAlgebras" with: "§2.3: for an Artin
        algebra, the duality `D` between finitely generated left and right modules, exchanging
        projectives and injectives; used with `R = k` for the dual forms of §§5.6 and 9.2."
     3. Add to "From Tau Ceti": "`TauCeti.socle`, with `TauCeti.le_socle_iff_isSemisimpleModule`
        (`TauCeti/RingTheory/SimpleModule/Socle.lean`): the socle, the largest semisimple submodule;
        `TauCeti.exists_isInjectiveEnvelope_of_finite`
        (`TauCeti/Algebra/Module/Injective/Envelope/FiniteDimensional.lean`): injective envelopes of
        finite modules over a finite-dimensional algebra, which give `Inj_Γ σ`."
     4. Add to the Conventions: "For a module `M` of finite length, `rad M` is Mathlib's
        `Module.jacobson`, `cosoc M = M / rad M`, `soc M` is `TauCeti.socle`, and the Loewy length is
        the least `n` with `rad^n M = 0`."
     5. In the scope bullet (lines 97-98) and in the *Needs:* and Dependencies lines of Layers 3, 5
        and 6, write "RepresentationTheory/QuiverRepresentations §§2.1 and 3.1; Tau Ceti
        `TauCeti.socle`" (and ArtinAlgebras §2.3 in §§5.6 and 9.2).
   - Tested on §3.5 Check 2: for `𝒟` all Serre weights, `D₀(𝒟)` has `TauCeti.socle = ⊕ σ = D₀(𝒟)`,
     semisimple, as `socle_eq_top_iff` requires.

9. **F09** (P2) §3.4 identifies `W(ρ̄)` with a set that only a later roadmap defines

   - Location: `README.md:1352-1354`: "Prove that `W(ρ̄)` does not depend on the inertial
     presentation `(s, μ)`, and that it is the set of Buzzard–Diamond–Jarvis weights of `ρ̄`"; also
     line 1132-1133.
   - Claim: a comparison target whose second term is defined in this roadmap or in a supplier.
   - Witness: the Buzzard–Diamond–Jarvis set is defined nowhere in this README or its suppliers; it
     is HilbertModularVarietiesAndShimuraCurvesPartII §0.2 (merge order line 354; this roadmap is
     line 263), whose API repeats the comparison ("For tame ρ with 1-deep parameter, W(ρ) equals
     MP.3's tame weight set"). In BHHMS23 (line 608–610 and 716–720) the set is the definition and
     the formula is the theorem, so independence of `(s, μ)` is proved through it.
   - Repair (the tame case of the notion moves down to this roadmap; record it in "Downstream
     consumers"). Insert in §3.4 before "Prove that": "For tame `ρ̄` define `W_BDJ(ρ̄)` as the set of
     Serre weights `F(λ)`, `λ = ((a_i, b_i))`, `r_i = a_i − b_i`, such that, when `ρ̄` is reducible,
     there is `A ⊆ J` with `ρ̄|_{I_F} ≅ ω_f^{Σ_i b_i p^i} ⊗ (ω_f^{Σ_{i∈A}(r_i+1)p^i} ⊕
     ω_f^{Σ_{i∉A}(r_i+1)p^i})`, and, when `ρ̄` is irreducible, there is `A ⊆ ℤ/2f` containing exactly
     one of `i`, `i + f` for every `i`, with `ρ̄|_{I_F} ≅ ω_f^{Σ_i b_i p^i} ⊗
     (ω_{2f}^{Σ_{i∈A}(r_i+1)p^i} ⊕ ω_{2f}^{Σ_{i∉A}(r_i+1)p^i})`, the `r_i` extended `f`-periodically
     (BHHMS23, §2.2, p. 14, citing Buzzard–Diamond–Jarvis; it depends only on `ρ̄|_{I_F}`)." Replace
     the sentence by "Prove that `W(ρ̄) = W_BDJ(ρ̄)` (BHHMS23, Proposition 2.4.2, p. 16); hence
     `W(ρ̄)` does not depend on the inertial presentation `(s, μ)`." In line 1132-1133 write
     "`W(ρ̄)` being then `W_BDJ(ρ̄)` (§3.4)". Add to "Downstream consumers":
     "HilbertModularVarietiesAndShimuraCurvesPartII §0.2 extends `W_BDJ` of §3.4 from tame to
     arbitrary `ρ̄`."
   - Tested on the Checks of §§3.4–3.5, `p = 17`, `f = 1`. Reducible `ω^6 ⊕ 1`: `Sym^5` with
     `A = {0}` gives `ω^6 ⊕ 1`; `Sym^9 ⊗ det^6` with `A = ∅` gives `ω^6 ⊗ (1 ⊕ ω^{10}) = ω^6 ⊕ 1`.
     Irreducible `ω₂^6 ⊕ ω₂^{102}`: `Sym^5` with `A = {0}` gives `ω₂^6 ⊕ ω₂^{6·17}`;
     `Sym^{11} ⊗ det^5` gives `ω₂^{90} ⊗ (ω₂^{12} ⊕ ω₂^{204}) = ω₂^{102} ⊕ ω₂^{6}` (`294 ≡ 6` mod 288).
     Both sets are those of the README.

Three P2 (two suppliers cited for statements they do not make, where the pinned Tau Ceti or
another roadmap on main has them; one comparison with an object that only a later roadmap
defines) and six P3 (three supplier locators, one policy wording, one pinned notion not recorded,
one reference entry). No false statement was found in `Suggested.lean` or in the README targets;
no finding touches a declared supplier gap.

Dependency check, run on the head:

    depcheck: 223 roadmaps, 1983 edges, 0 problem(s)

`packages/ModpRepresentationsOfGL2OverLocalFields` is at line 263 of `merge-order/ORDER.txt`; all
twelve named suppliers are on main (ClassFieldTheory, SchemeAndStackFoundations,
RepresentationTheory/QuiverRepresentations) or earlier in the order (lines 26, 30, 33, 65, 78, 100,
178, 192, 251).

## Verified sound

Counts: 12 declarations of `Suggested.lean` read (4 `def`, 1 `abbrev`, 7 `theorem`); 60 numbered
README sections read, every line; 128 locators checked by statement number and printed page
against the cached texts, 41 of the statements read in full; 94 Checks recomputed; 46 sibling
citations resolved in 12 roadmaps; 29 pinned declarations located.

Lean. The elaborated signatures supplied for the 12 declarations were compared with the README
statements: no binder is lost, every theorem carries its own binders, nothing changed. Imports:
the single `import Mathlib`. No `set_option`, `lemma`, `#eval`, sorry'd data or `example`. No
fully qualified name of the file is declared in another roadmap's `Suggested.lean`. Padding probe:
none of the 7 theorems follows from one tactic or one library lemma; the 5 definitions are each
used by a theorem. Headlines of the README: coherence (stated), the three `ℚ_p` criteria (stated),
finite length and subobjects of admissible finitely presented representations (stated), the Banach
approximation (stated), the counit with `Ord_B`, the absence of supersingular constituents, the
Iwahori criterion, the local bound `dim ≤ f`, the lattice with its endomorphisms (each named in
the module docstring with the missing carrier). No statable headline is absent.

Adversarial table (statement; instance; values on each side; result; change):

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `IsFinitelyPresented` | `G = 1` | exists iff `V` is a quotient of a finite-length module: finite length | agrees with §0.3 Check | none |
| `IsFinitelyPresented` | zero module | `W₁ = W₂ = 0` | holds | none |
| `IsTorsionAdmissible` | `G = 1`, `L/𝒪` | `(L/𝒪)[p^j]` of length `je` | admissible, not finite | none |
| `GL2ModScalar F ϖ` | `ϖ = 0` | defining set empty, quotient `≅ G` | excluded by `hϖ` | none |
| `GL2ModScalar` | centre of `G′`, `F = ℚ_p` | commutator has `det 1`, `det p^n = p^{2n}`: centre `ℚ_p^×/p^ℤ` | as §1.4 | none |
| `isFinitelyPresented_ker` | `G₀ ⊂ G′` | `val∘det(ϖ) = 2`: index 2 | finite index, SHOTTON20 Lemma 2.8 applies | none |
| `isFinitelyPresented_of_finite` | `F ≠ ℚ_p` | supersingular: finite type, not f.p. | hypothesis `ℚ_[p]` needed and present | none |
| `isFiniteLength_of_bounded_semisimple_quotients` | `V = I(σ)` | quotients `I(σ)/(P₁⋯P_n)`, length `≥ n` | hypothesis fails, as it must | none |
| same | `V = π ⊕ π` | semisimple quotients of length 2, one class | bound by length, not by classes | none |
| `isFiniteLength_iff_finite_smoothDualSpan` | `I(1)/(T−1)` | `0 → 1^∨ → V^∨ → St^∨`, smooth parts `1, ?, 0` | dimension 1, length 2 | none |
| same | `⊕_ℕ St` | smooth dual 0, infinite length | finite type needed and present | none |
| `smoothDualSpan` | trivial `ρ` | all of `V*` | span is a subspace | none |
| `isFiniteLength_of_admissible…` | `c-Ind_K^G k` | f.p., `V^{K₁}` infinite | not admissible | none |
| same | `χ∘det` on `G` (centre not killed) | quotient of `c-Ind_K^G k` by finitely many relations (`k[Z/Z∩K]` noetherian) | in scope, length 1 | none |
| `exists_coind_approximation_of_lattice` | `hF` at `ℚ_p`, `ℚ_{p²}`, `ℚ_p(√p)` | `(irr p, card = p)` = (T,T), (T,F), (F,T) | only `ℚ_p` excluded | none |
| same | `M = 0` | cokernel `Θ`, finite iff `E` finite-dimensional | not vacuous | none |
| same | `Θ = C(ℙ¹,𝒪)/𝒪` | `σ = 1` on `𝒪`: kernel `𝒪`, cokernel 0 | holds | none |
| §2.2 Hecke on `H¹(N₀, χ∘det)` | `t = diag(a,d)`, `v(a/d) = 1` | transfer `×q`, conjugation `÷c`: `φ ↦ χ(ad) φ(q·/c)`, `v(q/c) = ef − 1` | nilpotent iff `ef ≥ 2` | none |
| same | `ℚ₅(√5)`, `t = diag(2ϖ,1)` | `ℓ(ϖ/2)(1) = ℓ(3ϖ) = 3`, `(q/c)² = 5/4` | as the Check | none |
| §2.2 `H^i(N₀, St⊗χ)` | long exact sequence | `H^i(χ) → H^i(Ind)` iso for `i ≥ 1` forces `H^i(St) = 0` | holds for every `F` | none |
| §3.2 `t_λ` | `p = 17`, `λ = (5,0)`, `ω = ∓1` | `(0,−11)`, `(−1,−10)` | `Sym^{11}⊗det^5`, `Sym^9⊗det^6` | none |
| same | `f = 2`, `λ = ((5,0),(6,0))`, `ω = (1,0)` | `((6,0),(−1,−10))` | parity read at `i+1`, BHHMS23 (14) | none |
| §3.3 Ext | `p = 3`, `f = 1`, `r = 0, 1` | `Λ = {0,1}`, `{−1,0}`; `H¹(GL₂(𝔽₃), det)` = `B`-stable `Hom(U,k)`: dim 1 | adjacency formula holds | none |
| same | BP12 Cor. 5.6(i), `f = 1`, `r₀ = 1`, `p = 3` | `s₀ = 1`, `b ≡ a + 1` | agrees | none |
| §3.5 Check | `p = 17`, `s = −1` | exponents `6`, `102`; `3^5 = 5`, `3^{15} = 6`, `3^4 = 13` mod 17; `6+10+12+4 = 32` | as stated | none |
| §4.3 commutator | `u, l` | `ulu⁻¹l⁻¹ = (1+p+p², −p; p², 1−p)`, off-diagonal value `3/2` | value 1 | none |
| §4.6 dimensions | `f` | `1 + 2f + (f(2f+1) + f)` | `1 + 4f + 2f²`; 7 at `f = 1` | none |
| §5.1 multiplicity | `p = 5`, `f = 1`; `p = 5`, `f = 2`; `p = 7`, `f = 1` | exponents of `α₀` mod 4: `2 = −2`; mod 24: 12 distinct; mod 6: 4 distinct | collision only at `q = 5` | none |
| §8.3 `ψ_λ` | `e⊗v`, `u = 2e⊗fv + rh⊗v` | `ψ(e⊗v) = −2r e⊗v`; `ψ(u) = 8e⊗fv + 4rh⊗v = 4u`; `e·u = 0` | eigenvalues `−2r`, `4` | none |
| §9.1 | `f = 1` | `[R/pR:σ] = 2 + (2+0+0)` | `4 = 2^f(f+1)` | none |
| §9.1, §9.2 bounds | `r = 3`; `r = 6` | `3 < p−4`; `6 < p−7` | `p ≥ 11`; `p ≥ 17` | none |

Sources: the statements of Layers 0–2 agree with CDN23 lines 402–474, 500–527, 692–920 and 1148,
SHOTTON20 lines 112–119, 198–200, 467–515, HU12 lines 138–143, 1167, 1734–1760, 1825–1828,
1893–1927, HAUSEUX lines 1342–1352, EMERTON1 (3.1.3, 3.1.7, 3.1.9, 4.1.5, 4.1.7, 4.3.4, 4.4.6),
EMERTON2 (3.3.1, 3.7.3, 4.2.12), DEG line 2193, KOHLHAASE17 line 660. Those of Layers 3–9 agree
with BHHMS23 lines 702–708 (equation (14)), 2792–2799, 2817–2820, 2900–2913, 3037–3045,
3110–3118, 3434–3446, 3505–3518, 3668–3676, 3818–3823, 4197–4198, 4232–4233, 4259, 4273–4278,
with HW22 lines 558–561 and BP12 lines 1468–1477. The `p > 5` restriction of §5.1, the reading of
LMS22 Proposition 3.3(2) through LMS22-CORR, the three subscripts in the proof of BHHMS23
Corollary 7.3.4, the replacement of the citation behind CDN23 Proposition 1.30(b), and the
restriction of Vignéras's Propositions 9–10 to admissible quotients were each checked against the
texts and are right.

Suppliers: every cited section and target exists with the cited content, except as R01–R04 and R08
say (SchemeAndStackFoundations §0.17 has the regular-sequence criterion as the pinned
`isCohenMacaulay_quotient_ofList_smul_iff`, which it records).
The four gaps are in `design/plan.json` under the same slugs and suppliers as in the README, each
with one precise sentence; none asks for what its supplier's section already states. The 34
former identifiers (MP numbering) that HilbertModularVarietiesAndShimuraCurvesPartII and
ScholzeFunctorAndModpCohomologyOfTheLubinTateTower cite are all rows of the mapping table.

Ownership: the two closest open roadmaps (the same two) are later in the merge order and consume
this roadmap's weight coordinates, dimension, boxes, lattice and finiteness calculus by citation;
neither restates them (the one shared comparison is R09). No roadmap on main states torsion admissibility, the augmented Iwasawa
algebra, finite presentation in the smooth category, the Gelfand–Kirillov dimension of an
admissible representation or the tame weight set.

Source independence: 16 passages compared with 7 sources (CDN23, BHHMS23, SHOTTON20, HU12,
VIGNERAS11, HAUSEUX, DEG), none shared beyond formulas and standard names; largest share BHHMS23,
43 of 151 locators; contents compared with BHHMS23: not one to one (Layer 4 takes its §5.1, §5.3
and one display of §6.1; Layer 5 takes §6.1, one lemma of §6.2, one paragraph of §4.1 and results
of LMS22 and HW22; Layer 6 takes the rest of §6.2 and §6.3; Layer 8 takes §§7.1–7.3), with two
coincidences of scope, `Layer 7 ↔ §6.4` and `Layer 9 ↔ §7.4`, in an order that the *Needs:* lines
of §§7.6, 8.6 and 9.1 force; BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified) could not be
read.

## Not verifiable

- BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified): Proposition 18, Theorem 30, Theorems
  33–34, Corollary 36 and Part III, Chapters 14–15 are cited by locator only.
- The published numbering of VIGNERAS11 (Propositions 5.5–5.8), which CDN23 line 826–829 uses: only
  the preprint was read.
- `isFiniteLength_iff_finite_smoothDualSpan` for `p = 2, 3`: the converse direction rests on
  `gap:ext1-finite-length-into-compact-induction`; DEG line 2193 covers `p ≥ 5` only.
- `exists_coind_approximation_of_lattice`: CDN23 lines 917–920 give the statement and a two-line
  proof; the passage of the counits to the limit with bounded error was not recomputed.
- The elaboration itself: no Lean was run in this pass; the supplied elaborated signatures were
  used.
- The eigenvalue `2(r+2)` of §8.3 on the minus summand (the other two were computed).

## Source issues

- **Error** in BHHMS23 at Lemma 6.1.1(i), p. 56: the source says that for `p > 3` every character other than `χ` occurs at most once in `W_{χ,3}`; it should be excluded for `q = 5`, where `α² = α^{−2}` occurs twice; affects nothing.
- **Misprint** in BHHMS23 at the proof of Corollary 7.3.4, p. 84: the source says three times that the projective envelope is taken over `K₁/Z₁`; it should be over `K/Z₁`, as in the statement; affects nothing.
- **Gap** in CDN23 at Proposition 1.30(b), p. 21: the source says the Steinberg clause follows from a theorem of Emerton stated for `GL₂(ℚ_p)`; it should be proved for `F ≠ ℚ_p`, for instance from the vanishing of the `N₀`-cohomology of the Steinberg representation; affects the proof.
- **Gap** in CDN23 at Proposition 1.19 and the remark after its proof, p. 17: the source says the graded pieces are quotients of compact inductions of Serre weights; it should be of irreducible `k_L[K]`-modules, not absolutely irreducible in general when `F ≠ ℚ_p`; affects a stated result.
- **Error** in LMS22 at Proposition 3.3(2), pp. 7–8: the source says every translated summand is a projective envelope; it should be the translated module `R_{λ+ν}`, an envelope when the weight is not a character; affects a stated result; corrected in print at LMS22-CORR, item (2).
- **Error** in VIGNERAS11 at Propositions 9 and 10, p. 22 (arXiv v1): the source says the intersection of the two cell images contains the `I₁`-invariants and is nonzero for every generating submodule; it should assume the quotient admissible, the compact induction itself having zero intersection; affects a stated result.

## For the human reviewers

- **Scope.** README line 28 describes Layer 1 as the criteria of CDN23 §1.4, and its six sections follow that section's results in order; Layers 7 and 9 have the scope of BHHMS23 §6.4 and §7.4. Whether this arrangement is acceptable is yours.
- **Not tested.** BARTHEL-LIVNE94 (waived) and SERRE-LRFG (uncertified) were not read; wording and locators against them were not compared.
- **Licence.** BP12, EMERTON1, EMERTON2, DEG, LMS22 and LMS22-CORR are recorded as author-page copies in `sources.toml` (lines 34, 51, 67, 84, 171, 204); the hosts were not re-examined in this pass.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d6f2f83165fc1d74cf86be6fd4b4b69efea073c8", "job": "RT-ModpRepresentationsOfGL2OverLocalFields~1b", "model": "fable", "worker": "chris-x31"} -->
