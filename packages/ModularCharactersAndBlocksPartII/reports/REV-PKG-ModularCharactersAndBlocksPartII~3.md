<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6899361827 -->
Review (claude) of 07ba40c

Verdict: accepted
Conditional on the announced gaps: `clifford-multiplicity-dvd-index`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The three round-2 findings are repaired, the repaired passages pass the adversarial
pass, the 15 sampled targets agree with their sources, `Suggested.lean` elaborates with `sorry` as
its only warning, and no theorem in it is padding. The acceptance is conditional on the declared
supplier gap `gap:clifford-multiplicity-dvd-index` (InductionRestriction Layer 7). No maintainer
notes were left for this roadmap.

## Previous findings, checked

- **F01 (P3), §8.3 locator — repaired.** `packages/ModularCharactersAndBlocksPartII/README.md`
  lines 1616–1619: "martinez line 2131, Corollary 8.12, for the block `b` of `N = D C_N(D)`, the
  situation of martinez line 2018, Theorem 8.11, and martinez lines 2331–2347, in the proof of
  Theorem 9.8, for the passage from `b` to `B`". `Suggested.lean` lines 316–317 say the same. I
  read martinez lines 2018–2019 (the hypothesis `G = C_G(P) P`), 2131 and 2331–2347: the split is
  right. `N = D C_G(D)` has `C_N(D) = C_G(D)`, so `N = D C_N(D)` holds.
- **F02 (P3), §7.2 restated supplier identity — repaired.** README lines 1367–1369: "in `Z(O[G])`
  the central lifts satisfy `Σ_{B covers b} e_B = Σ_{b'} e_{b'}` … the lift to `O` of the identity
  over `k` by which base §8.2 defines covering"; the route (lines 1379–1382) and the `*Needs:*`
  line (1398) now cite base §1.3, and the contract (lines 408–409) names the uniqueness of central
  lifts. The base at its open head says "a central idempotent has a unique central lift" in its
  §1.3 and defines covering by the orbit sum in its §8.2.
- **F03 (P3), witnesses for the two block definitions — repaired.** README lines 261–286 give three
  witnesses for `IsBlockDefectGroup` and four for `blockCharacters`; I recomputed each (table
  below).

The same three patterns elsewhere: every other locator of the sample states the hypotheses its
target uses; no other target restates a definition of the base (§7.3 differs from base §8.1 by
allowing any normal subgroup, and says so); every definition has at least three Checks.

## Verified sound

### 1. Principles

No route-specific shortcut: Layers 1–5 assume only coprimality and the solvability the theorems
need, Layers 6–9 hold for every splitting `p`-modular system. The roadmap is a Part II: the base
at its open head (Layers 0–8) has no heights, Osima, Min–Max, Fong–Reynolds, regular blocks or
extended first main theorem (searched), and disowns "conjectures about blocks". No algorithm, no
sorry'd data, no `set_option`, no `variable` block.

### 2. Sources: the seeded sample (15 targets, no locator flagged unverified by the author)

| Target | Lines read | Result |
|---|---|---|
| 1.1 | glauberman 94; hartley-turull 302–304 | `η^a(g) = η(g^{a⁻¹})`, the README's `χ(s⁻¹ • g)`; match |
| 1.2 | glauberman 287–296 | Lemma 3 (a)–(c), for every coprime operator group; the README adds the solvability under which IG.3.4 applies and says so |
| 1.3 | glauberman 355–358 | Brauer's theorem, used for cyclic `A` and a nonsingular table; match |
| 2.1 | glauberman 100–104 | Theorem 1; match |
| 2.3 | glauberman 173–177, 238–239 | Lemma 1 (a), (b); Theorem 2 (b); match |
| 3.3 | glauberman 364–374 | Corollary 4 and its two-step proof; match |
| 3.4 | glauberman 375–387, 454–466 | Corollary 5 (a), (b) with `B ≠ A`, `θ₀(a)² = 1`; Corollary 6 (c); match |
| 4.4 | glauberman 601–602, 607–609, 623–628 | Corollaries 7, 8, 9; match |
| 4.6 | glauberman 636–644 | Theorem 5 (a)–(e); match |
| 6.1 | martinez 351–354, 373, 414, 512–515, 566, 696–699, 758–761 | `ω_χ`, `λ_B`, Propositions 2.3, 2.5, Corollary 2.7, defect classes and their `p`-regularity; match |
| 7.2 | martinez 1642, 1652, 1760, 1763, 1790, 1976–1980 | Problem 7.4, Propositions 7.6, 7.9, 7.11, Corollary 7.8, Lemma 8.6; match |
| 7.4 | martinez 1823–1834; reynolds 133–151; sambale 509–512 | Theorem 7.12 (i)–(iv); Theorems 1, 2; Theorem 1.19; match |
| 7.6 | martinez 1985–1988, 2295–2296; sambale 499–502 | Theorems 8.8, 9.6; Theorem 1.18; match |
| 8.2 | martinez 2018–2030, 2131; reynolds 509–513, 201–203 | Theorem 8.11 (i)–(iii), Corollary 8.12; Theorem 7; match |
| 9.1 | martinez 2321; mnst 48–52, 70–73; kessar-malle 25; ruhstorfer 33–34 | the conjecture, Theorem A (odd `p`), the Corollary, Theorem 1.1, Corollary B; match |

Also read: glauberman 299–305 (Theorem 3: one sign for every generator), 537–543; spath-vallejo
118–130; martinez 1895–1897, 1928–1932, 2222–2224, 2264–2268; reynolds 60, 531–543; sambale 312,
341–351, 483. Martínez's Theorem 8.5 (i) quantifies the defect groups in the other order from
§7.3; the two forms are equivalent because the defect groups of each block are conjugate.

### 3. Adversarial pass (values computed this round)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `IsBlockDefectGroup` witnesses (round-3 text) | `S₄`, `p = 3`, `χ = 3, 1, −1, 0, −1` | `e_χ = (3/24) Σ χ(g) g`: `3/8, 1/8, −1/8, 0, −1/8`; `8 ≡ 2`, `2⁻¹ ≡ 2`: `0, 2, 1, 0, 1`; `ω_χ = 6·1/3, 3·(−1)/3, 6·(−1)/3 = 2, −1, −2`; `2·2 − 1 − 2 = 1`; `C_G(⟨(123)⟩)` has order `24/8 = 3` | defect group `1`; normaliser model wrongly accepts | none |
| same | `S₃`, `p = 2`, `e = 1 + r + r²`, `e = r + r²` | `C_G(⟨t⟩) = {1, t}`: coefficients `1, 0` and `0, 0`; `−1/3 ≡ 1`, `2/3 ≡ 0 (mod 2)` | `⟨t⟩` and `1`; `P = 1` excluded by maximality alone | none |
| `blockCharacters` witnesses | `S₃` over `ℤ₂[ζ₃]`; `C₃` over `ℤ₂`; `b = 0` | on `std`: `(1 + ζ₃ + ζ₃²)/3 = 0`, `(2 − ζ₃ − ζ₃²)/3 = 1`; over `ℚ₂` one character `2, −1, −1`; `n = 0` is not irreducible | `{1, sgn}`, `{std}`, one character, `∅` | none |
| §7.2 third statement over `O` | `S₃`, `N = C₃`, `p = 2` | `e_λ + e_λ̄ = (2 + (ζ₃ + ζ₃²)(r + r²))/3 = (2 − r − r²)/3 = e_std`; `e_{1_N} = (1 + r + r²)/3 = e_1 + e_sgn` | true | none |
| §7.2 first statement | `S₃`, class `{r, r²}` | `ω_std = 2·(−1)/2 = −1 = λ(r) + λ(r²)` | true | none |
| §8.3 formula, `reynolds_heights` | `SL(2,3)`, `p = 2`; `p ∤ |G|` | degrees `1,1,1,2,2,2,3`, `a − d = 0`: heights `{0, 1} = {ν(1), ν(2)}`; `D = 1`: `{0} = {0}` | true, both inclusions | none |
| `reynolds` | `D₈`; `A₄`; `D = 1` | `0,0,0,0,1`, nonabelian; `0,0,0,0`, abelian; one character | true, both directions | none |
| `brauer_height` | `A₅`, `S₃` at `p = 2`; `SL(2,3)`, `p = 3` | `1,3,3,5` with `a = d = 2`; `2 ∣ 2` with `d = 0`; `ν₃(2) = 0 = 1 − 1` | true | none |
| `fongReynolds`, `existsUnique_fongReynolds` | `N = G`; `N = 1`; `S₄`, `N = V₄`, `p = 3` | `T = G`, `B' = B`; `b = 1`, `T = G`; `T = D₈`, two extensions of `λ` induce to the two characters of degree `3 = 24/8`, defect zero both sides | true | none |
| §7.3 defect groups | `S₃`, `N = C₃`, `p = 2, 3`; `S₃ × C₂`, `N = S₃`, `p = 2` | `π(Tr_D^G a) = |N : N ∩ D| Tr(ā)`: factors `3`, `1`, `3`; `π(1 + r + r²) = 3 = 1`, `π(r + r²) = 2 = 0` | sound | none |
| §7.5 regular blocks, Fong | `S₃`, `N = C₃`, `p = 2, 3` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1`, not regular, and no block has `λ = (1, 0, 0)`, so `{1_N}^G` is undefined; `{λ}^G`: `−1 = ω_std`; `|G : P N| = 1`, `P ∩ N = 1` | consistent with Proposition 9.3 and Theorem 9.2 | none |
| §7.6 | `S₄`, `p = 2`, `P = V₄`; `S₃`, `p = 3` | index `24/4 = 6`, even, defect group `D₈ ≠ V₄`; index `2` | sound | none |
| §8.2 | `G = P C_G(P)` | `G/C_G(P) ≅ P/Z(P)` is a `p`-group, so `p`-regular elements centralise `P`; `ν(θ(1) ξ(1)) − ν(|G : P|) = ν(ξ(1))` | sound | none |
| 1.1 convention | `C₇`, `r ↦ r²` | `2·4 ≡ 1 (mod 7)`: `(s·χ)(r) = ζ₇⁴`, not `ζ₇²` | as stated | none |
| 1.2 | `A₅` on `𝔽₇⁵`; `𝔽₅⁵` | `5⁻¹ ≡ 3 (mod 7)`, constant vector `3c`; `5c = 0 ≠ 1` | sound; coprimality needed | none |
| 2.1 | `Q₈`, `A = C₂` by `i` | `(cρ(i))² = −c² = 1`, `det = c² = −1` | coprimality with the degree needed | none |
| `existsUnique_canonicalExtension` | general; `S₃` | `det(χ̂β)|_S = β^{χ(1)}`, trivial iff `β = 1` as `gcd(χ(1), |S|) = 1`; `sgn` has `−1` | unique | none |
| `canonicalExtension_values` | `SL(2,3)` | `2, −2, 0, −1, −1, 1, 1` | true | none |
| `gallagher_bijOn` | `Z(Q₈) ≤ Q₈`; `N = 1`, `G = C₂` | `1` against `4` without an extension; `sgn` swaps `1, sgn` | true | none |
| 3.3 | `C₃ × C₃` on `Q₈` | kernel element: `η(t) = χ₂(t)`, `ε = 1`; other: `η(x) = −1`, `η(−x) = 1`, `ε = −1`, `λ = sgn` | true | none |
| 3.4 | `SL(2,3)`; `3^{1+2}_+` with `C₂` | `(2 sgn + sgn)/3 = sgn`; trace of the involution `1 − 1 − 1 = −1`, `(3ω − ω)/2 = ω` | sound | none |
| `ncard_invariantIrreducibleCharacters` | `C₇ ⋊ C₃` with inversion of `C₇`; `3^{1+2}_+` | `r^{−i} b^j = r^i b^j` iff `i = 0`: `C = C₃`; invariant characters `3`, classes `3` of `5`; `1 + 2 = 3 = |Z|` | true | none |
| `IsGlaubermanFamily.apply_eq` | `S = 1`; `T` of prime index | law 2 at `S = 1` for every `p` forces `π(Γ,1)χ = χ`; then `π(Γ,S) = π(C_Γ(T), S/T) ∘ π(Γ,T)`, both fixed; `C_Γ(T)` stays in universe `u`, `S/T` in `v` | unique | none |
| `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`; `S = 1`; swap on `C₂ × C₂` | `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`; `m ∈ {0, 1}`; non-coprime: two characters with `m = 1` | true; coprimality needed | none |
| `IsGlaubermanFamily.exists_sign_of_isCyclic` | `SL(2,3)`; `S = 1` | `χ̂(a) = −1`, `χ̂(−a) = 1`: `ε = −1`; `ε = 1` | true | none |
| `IsGlaubermanFamily.index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+`; `θ = 1` | `4·1 = 2·2`; `9·1 = 3·3`; reverse fails | true | none |
| `restrict_pairing_ne_zero`, `adjoin_range_eq` | swap on `C₃ × C₃`; `SL(2,3)` | `(ψ_a × ψ_a)|_C = ψ_{2a}`; `ℚ = ℚ`, `2 ≠ 0` | true | none |
| 6.1 Checks | `S₃`, `p = 2` | `(1 + 1)/6 = 1/3`, `(1 − 1)/6 = 0`, `2·2/6 ≡ 0`, `2·(−1)/6 ≡ 1`; Osima `1·(1 + 1)/6 = 1/3` | consistent | none |
| 6.3 Checks | `C₇ × C₂`; `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅` | `2` has order `3` mod `7`: `6/3 = 2` places; order `2` mod `3`, `4` mod `15`: `𝔽₄ ⊆ 𝔽₁₆` | sound | none |
| 9.1, 9.2 Checks | `S₄`, `p = 2`; `SL(2,3)`, `p = 3` | `ν(2) − (3 − 3) = 1`, `D₈` nonabelian; `3 = 3` twice in `C₆` | consistent | none |

Context: the file has no `variable` block, so no declaration can lose a binder; the 20 types of
`scratch/signatures.md` equal the README statements in generality.

### 4. Duplication and ownership

- Pinned Tau Ceti, opened: `CharacterTable/Table.lean` 114, 123, 181, 585;
  `Induction/ClassFunction.lean` (`Subgroup.indClassFun`, `[S.FiniteIndex]`, a coset sum);
  `RingTheory/Idempotents/Primitive/Basic.lean` 89; `CharacterTable/Determined.lean` 49;
  `CharacterTable/Degree.lean` 117; `CharacterTable/CentralCharacter.lean` 89, 162, 180;
  `Induction/Conjugate.lean` 485, 683; `Induction/Inertia.lean` 100, 111; `Clifford/Basic.lean`
  327; `Clifford/Classes.lean` 125; `Clifford/Decomposition.lean` 305; `Clifford/Dimension.lean`
  113; `Clifford/Obstruction.lean` 162; `Clifford/TensorFactorization.lean` 329;
  `Clifford/ProjectiveCorrespondence.lean` 149, 223; `GroupTheory/SemidirectProduct.lean` 33.
- Pinned Mathlib, opened: `Algebra/Group/Action/Basic.lean` 103; `GroupTheory/SemidirectProduct.lean`
  138; `GroupTheory/SchurZassenhaus.lean` (existence only); `GroupTheory/Subgroup/Centralizer.lean`
  177, 186; `GroupTheory/GroupAction/OfQuotient.lean` 62; `RepresentationTheory/Induced.lean` 155;
  `RepresentationTheory/Character.lean` 102; `NumberTheory/RamificationInertia/Galois.lean` 127;
  `Topology/UniformSpace/Completion.lean` 437, 446.
- No declaration of the Glauberman correspondence, canonical extension, Gallagher's correspondence,
  defect groups or heights at the pins (searched by object). `roadmaps grep` for the Glauberman
  correspondence, Fong–Reynolds, Alperin–McKay, Osima and the 8 own Lean names: no match on main
  or in any open pull request.
- `scratch/overlaps.md`: no dropped id, no open revision, no second copy, no conflicting head.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem,
LocalFiniteGroupTheory, FiniteGroupInvariants (open) and CharacterTheory, InductionRestriction,
FiniteGroupExtensionSplitting (main); blocks, defect groups, defect classes, covering, domination
by normal `p`-subgroups: owner ModularCharactersAndBlocks (cited); Galois-form permutation lemma:
owner FiniteGroupInvariants §6.2 (named as not owned); projective tensor factorisation: owner
InductionRestriction Layer 7 (cited); conjugacy of coprime complements: owner
InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (cited); nothing else shared.

### 5. Supplier order

Dependency check output: `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD, CYCLE or
`moved:` line. Resolved now: the base's §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3,
7.1–7.2, 8.1–8.2 exist at its open head, and I read its §§1.3, 6.2, 7.1, 7.2, 8.1, 8.2 against
the contract: faithful. IG.3.4 holds *Conjugacy of coprime complements* with "`N` or `G/N`
solvable". CharacterTheory §§2.1, 3.5, 3.6, 4.3, 4.4, 4.5 and InductionRestriction Layers 1, 2, 5,
7 exist on main under those numbers.

Declared gap `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and in the
InductionRestriction subsection; one statement with its hypotheses; minimal
(`FDRep.clifford_restrict_dvd_finrank` gives only `dim V ∣ dim W` and
`[G : inertia V] ∣ dim W`, and InductionRestriction on main states no such divisibility).

### 6. Shape and the Lean form

Nine layers, each ending in Examples and Dependencies; Scope, Conventions, contracts, build
paragraph, consumers and references present. The layer order is forced (§3.2 needs §§2.2–2.4;
§4.1 needs §3.2; Layer 7 needs §§6.1–6.3; §8.2 needs §7.3; §8.3 needs §§7.2, 7.6). No LaTeX
delimiters, process words, pull-request numbers, dates, anchors or machine paths (searched).

Elaboration: `lake env lean` on `packages/ModularCharactersAndBlocksPartII/Suggested.lean` from
the content checkout: 16 warnings, all `declaration uses sorry`, no error. Header `import Mathlib`
and three `TauCeti.*` modules, each used. One module docstring, one namespace, layer comments in
README order, a docstring on each of the 20 declarations, `theorem` only, four definitions with
real bodies. Every own backticked name of the README is declared, and conversely.

### 7. Headlines and padding

The 16 end theorems of README lines 24–34 are each stated; the docstring names the three cited
propositions as not stated, with the reason. One-tactic probe on a scratch copy, every `sorry`
replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide | (intros; simp_all`
with the four definitions`; done) | (intros; exact ⟨_, rfl⟩)`: errors at all 16 theorems, none
closes. None restates a definition, mirrors a Check or treats a boundary case.

### 8. Copyright and arrangement

Wording compared at every sampled locator and at six further passages: the §8.4 route against
martinez 2330–2349 (a different argument, no induction on `|G|`); the §8.3 route against reynolds
534–540; the §3.3 route against glauberman 373–374; the docstrings of `reynolds_heights` and
`fongReynolds` against reynolds 531–533 and martinez 1823–1834; the Conventions sentence on defect
groups against sambale 350–351. No sentence is reproduced; the longest shared run is five words
inside a theorem statement. No table, figure or exercise list is taken over.

Arrangement against martinez (contents at martinez lines 24–64): Layer 6 ↔ 2.1, 3.1, 3.2;
Layer 7 ↔ 3.1, 7.1, 8.1, 7.2, 9.2 with 9.1, 8.2 with 9.2; Layer 8 ↔ 8.2, 9.3; Layer 9 ↔ 9.3. No
one-to-one run in the same order.

Source independence: 21 passages compared with 7 sources, none shared; largest share martinez, 38
of 85 `<source> line N` locators; contents compared with martinez: independent.

## Not verifiable

- isaacs, isaacs-1973, navarro-1998, navarro-2018, feit: uncertified and settled; not read. Each
  stands beside a locator that was read, except the uniqueness formulation of §4.5, whose
  induction I checked directly (table row `apply_eq`).
- The truth of the cited classification-dependent theorems (kessar-malle, mnst, ruhstorfer, geck)
  beyond their statements.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (martinez line 725): the source says a character has height zero when the numerical defect equals the `p`-part of its degree; it should be when `p^{a − d(B)}` equals the `p`-part of its degree; affects nothing.
- **Misprint** in martinez at the proof of Theorem 9.8, printed page 61 (martinez line 2337): the source says the heights of `B` coincide with the set of characters of `b`; it should be with the set of heights of the characters of `b`; affects nothing.

## For the human reviewers

- **Licence.** martinez (38 of 85 line locators) is unpublished course notes read from the
  author's university page; sambale is read from the author's page (published as Springer LNM
  2127). Neither copy states a licence (`sources.toml`, `licence_class = "author-page"`).
- **Scope.** LocalFiniteGroupTheory L3 (open) states Glauberman's lemma; README §1.2 proves the
  class and coset forms itself from IG.3.4, that roadmap being excluded as a supplier.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "07ba40c1fc7bd6b5adf18fddce1342eaf2019a1b", "job": "REV-PKG-ModularCharactersAndBlocksPartII~3", "model": "fable", "worker": "chris-x52"} -->
