# Review of ModularCharactersAndBlocksPartII (pull request #2411 at 0c072e1)

**Verdict:** accepted

Accepted conditional on the declared gap `gap:clifford-multiplicity-dvd-index` (InductionRestriction Layer 7), which §8.3 consumes.

## Previous findings

- The previous review, at this same head, raised no finding. Its account of the first review's two findings still holds:
- R01 — repaired: README:517–519 reads "the divisibility of the index of a central subgroup by the degree of an irreducible character, `χ(1) ∣ |H : Z|`". The `plan.json` part is D01.
- R02 — repaired: the description lists the base's Conventions and §§0.2–8.2, IG.3.4, CharacterTheory, InductionRestriction Layers 1, 2, 5, 7, and the gap.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 fixed classes | `Q₈`/`C₃`; `C₂` on `S₃` by a transposition; `A₅` on `𝔽₇⁵`; `A₅` on `𝔽₅⁵` | invariant classes `2` = classes of `C` `2`; `3 ≠ 2` (not coprime); `7 = 7`, coset `Σv = c` holds constant `3c`; `5c = 0 ≠ 1` | holds; controls fail as stated | none |
| §2.2, `existsUnique_canonicalExtension` | `SL(2,3)`; `Γ = 1`; `S = 1`; `S₃ = C₃ ⋊ C₂` | `det(χ̂λ)` on `S` is `λ² ≠ 1` for `λ ≠ 1`; `ψ` linear, `ψ` on `S` equals `det`, so `ψ = 1`; `ψ = χ`; `1`, not `sgn` (`det = −1`) | unique in each | none |
| §2.3, `canonicalExtension_values` | `SL(2,3)`; trivial `C₂` on `C₃` | values `2, −2, 0, −1, 1` all in `ℤ`; `χ̂ω` gives `−ω ∉ ℤ`; `χ̂(s) = 1`, `ℚ(ζ₃) = ℚ(ζ₃)` | holds | none |
| §2.4, `gallagher_bijOn` | `N = 1`, `G = C₂`, `η = sgn`; `N = G`; `Q₈`, `N = Z`, `θ` faithful | swaps `1, sgn`, a bijection of `Irr(G)`; `{θ}` from one `β`; no extension, `1` character over `θ` against `4` | holds; hypothesis needed | none |
| §1.3 permutation lemma | `C₂ × C₂` on `𝔽₂³` via `1 + E₁₂`, `1 + E₁₃` | group fixes `2` vectors, `4` characters; each element `4, 4`; orbits `(8+4+4+4)/4 = 5` both | per-element form holds | none |
| §3.4 restriction formulas | `C₄` on `3^{1+2}_+`, `a(x,y,z) = (−y, x, z − xy)` | automorphism: both sides `z + z' − xy − x'y − x'y'`; `a² = (−x, −y, z)`; eigenvalues `i, −i, 1`; `ε' = −1`, `θ₀(a) = −1`; `(3ω + ω)/4 = ω` | holds | none |
| §4.2 the `p`-group case | `SL(2,3)`; `3^{1+2}_+` with `C₂`; `S = 1`; monomial `D₈` on `𝔽₃²` | `(2 sgn + sgn)/3 = sgn`; `(3ω − ω)/2 = ω`; quotient `0`; swap sends `𝔽₃ × 0` to `0 × 𝔽₃` | holds | none |
| §4.3 independence of the series | `C₁₅` on `Q₈ × C₁₁` (`gcd(15, 88) = 1`); `C₉` on `C₁₉` | `sgn ↦ sgn × 1 ↦ χ₂ × 1` and `sgn ↦ χ₂ ↦ χ₂ × 1`; `C = 1`, `Irr_S = {1}` | agree | none |
| §4.4, `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `C₇ ⋊ C₃` with inversion of `C₇`; `C₂` on `S₃` | `2 = 2 = 2`; three linear fixed, degree-3 pair swapped, classes `1, s, s²` fixed: `3 = 3 = 3`; `3 ≠ 2` | holds; coprimality needed | none |
| §4.5, `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; `S = 1`; swap on `C₂ × C₂` | `[χ₂|_C, sgn] = 2 ≡ −1`, `[χ₂|_C, 1] = 0`; `m = 1`; two invariant characters both restrict to `1` | holds; fails without coprimality | none |
| `IsGlaubermanFamily`, `exists_isGlaubermanFamily`, `apply_eq` | `T = 1`; `T = S`; `S = 1`; `C₆` via `C₃` | `π(Γ,1)χ = χ`; `π(C,1) = id`; multiplicity `1` forces `χ`; `π(C_Γ(C₃), C₂) ∘ π(Γ, C₃)`, each factor fixed at `p = 2, 3` | laws determine the family | none |
| §4.5, `exists_sign_of_isCyclic` | `SL(2,3)`, generators `a`, `a²`; `S = 1` | `χ̂(a) = −1`, `χ̂(−a) = 1`, so `ε = −1`, `χ* = sgn`; same at `a²`; `ε = 1` | holds | none |
| §4.6, `restrict_pairing_ne_zero`, `adjoin_range_eq` | `SL(2,3)`; swap on `C₃ × C₃` | `Σ = 2·2 ≠ 0`, `ℚ = ℚ`; `ψ_a × ψ_a ↦ ψ_{2a}`, both fields `ℚ(ζ₃)` | holds | none |
| §5.1, `index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+`; `θ = 1`, `C ≠ Γ` | `4·1 = 2·2`; `9·1 = 3·3`; reverse `|Γ : C| ∤ 1` | holds | none |
| §5.2 degree-divisibility | `SL(2,3)`; abelian `Γ` | `1 ∣ 2`, variant `2 ∤ 1`; `1 ∣ 1` | predicate as cited | none |
| `IsBlockDefectGroup` | `S₃`, `p = 2`, `1 + r + r²` and `r + r²`; `S₄`, `p = 3`, `χ₃` | `⟨t⟩` passes, `1` fails maximality; coefficients at `1, t` are `0`; coefficients `0, 2, 1, 0, 1`, `λ = 4 − 1 − 2 = 1`, defect group `1` | matches base §6.2 `IsDefectGroup` | none |
| `blockCharacters` | `(1 + r + r²)/3`, `(2 − r − r²)/3`; `b = 0`; `ℤ₂[C₃]` | `{1, sgn}`, `{std}` (acts as `3/3`); empty, `IsIrreducible` is `IsSimpleOrder` at the pin; one character `2, −1, −1` | holds | none |
| §6.1 central characters, Osima | `S₃`, `p = 2` | coefficients `1/3, 1/3, 0`; `λ` at 3-cycles `2 ≡ 0`; Osima `2/6 · 1 = 1/3`; `f_{{1}}` has `1/6 ∉ ℤ₂` | holds | none |
| §6.2, `brauer_height` | `S₃`, `p = 2`; `A₅`, `p = 2`; `C₃` over `ℤ₂` | degrees `1, 1` with `a − d = 0`, `2 ∣ 2`; `1, 3, 3, 5` and `4 ∣ 4`; degree `2`, valuation `1 ≠ 0` | holds; splitting needed | none |
| §6.3 heights | `SL(2,3)`, `p = 2`; `std` of `S₃` | heights `0, 0, 0, 1, 1, 1, 0`; `ν = 1 = a`, `h = 1 − (1 − 0) = 0` | no truncation | none |
| §7.1 Min–Max | `S₃`, `p = 2` and `p = 3` | `λ(t) = 3 ≡ 1`, `a(r) = 1`; `λ(t) = 3 ≡ 0`, `λ(r) = 2` | holds | none |
| §7.3 domination | `S₃ → C₂`, `p = 2, 3`; `S₃ × C₂` | `π = 3 = 1` and `2 = 0`; `1 = e₊ + e₋`; trace factor `|N : N ∩ D|`; images `1`, `0` | holds | none |
| §7.4, `fongReynolds`, `existsUnique_fongReynolds` | `S₃`, `N = C₃`, `p = 2`; `p = 3`; `S₄`, `V₄`, `p = 3`; `T = G` | `T = C₃`, `λ^G = std`, heights `0 = 0`; `T = S₃`, inertia model gives `1 + sgn`; `T = D₈`, induced degree `3·1 = 3`, defect zero; identity | holds | none |
| §7.5 regular blocks, Fong | `S₄`, `V₄`, `p = 2`; `N = 1`; `C₂` | class sizes `6, 8, 6 ≡ 0`; size `3 ≡ 1`; `λ(t) = 1`, `t·t ↦ 1 ≠ 0·0` | holds | none |
| §8.3, `reynolds_heights`, with the gap | `SL(2,3)`, `p = 2`; `A₄`; `D = 1` | `{0, 1} = {ν(1), ν(2)}`, `ψ(1)/θ(1) = 3 ∣ 3`; `{0} = {0}`; `{0} = {ν(1)}` | holds | none |
| §8.4, `reynolds` | `D₈`; `A₄`, `p = 2`; defect zero | height `1`, nonabelian; all `0`, `V₄` abelian; `{χ}`, `D = 1` abelian | holds both ways | none |
| §9.2 Alperin–McKay predicate | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `2 = 2`; `4 = 4`; `3 = 3` twice in `C₆` | instances hold | none |
| Gap `needs` | `SL(2,3)`, `N = Q₈`; `Q₈`, `N = Z`; `N = G` | `3/1 ∣ 3`, `2/2 ∣ 3`; `2/1 ∣ 4`; `1 ∣ 1` | precise, minimal | none |

- Source locators checked against the cached texts: 100 (glauberman 26, martinez 44, reynolds 8, sambale 6, hartley-turull 5, mnst 3, ruhstorfer 3, geck 2, spath-vallejo 2, kessar-malle 1), covering all 15 sampled targets. Each is at its stated line with the stated hypotheses.
- Library declarations opened at the pins: 40. Among them `TauCeti.irreducibleCharacters` (`CharacterTable/Table.lean:114`), `TauCeti.IsPrimitiveIdempotent` (`Idempotents/Primitive/Basic.lean:89`), `Subgroup.indClassFun` (`Induction/ClassFunction.lean:194`), the quotient action (`Mathlib/GroupTheory/GroupAction/OfQuotient.lean:62`) and `Representation.IsIrreducible` (`Mathlib/RepresentationTheory/Irreducible.lean:29`). Every file the README names for a declaration is the file that defines it.
- Cross-roadmap citations resolved: the 20 cited sections and 7 named declarations of ModularCharactersAndBlocks at its open head; IG.3.4 *Conjugacy of coprime complements*; CharacterTheory §§2.1, 3.5, 3.6, 4.1, 4.3–4.5; InductionRestriction Layers 1, 2, 5, 7; FiniteGroupInvariants §6.2.
- Gap: the slug is the same in `plan.json` and README:507. Neither the pinned Tau Ceti nor InductionRestriction on main states a Clifford degree divisibility.
- Gate at this head: every check `0`, `OK`. Depcheck: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`. No file changed outside the folder.
- `lake env lean` on `Suggested.lean`: 16 `sorry` warnings, nothing else. `#check @name` printed all 20 types; the file has no `variable` line, so every binder is in its own declaration.
- One-tactic probe (`simp`, `rfl`, `infer_instance`) on a scratch copy: 0 of 16 theorems close. All 16 README headlines are stated; the three predicates left out are named in the module docstring.
- Description against the head: 16 theorems and 4 definitions, the supplier list, the gap and the scope remarks all match.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem, LocalFiniteGroupTheory, FiniteGroupInvariants, CharacterTheory, InductionRestriction, FiniteGroupExtensionSplitting. ModularCharactersAndBlocks owns blocks, defect groups and domination by normal `p`-subgroups (cited); FiniteGroupInvariants owns the Galois permutation lemma (cited; §1.3 is the automorphism form); InductionRestriction owns the tensor factorisation (cited). OddOrderTheorem §1.3 shares no statement with §1.2. Glauberman's lemma is shared with LocalFiniteGroupTheory, which may not be cited: see the human reviewers' section.

Source independence: 105 passages compared with 10 sources, none shared; largest share martinez, 40 of 100 locator citations (a citation with several lines counted once); contents compared with martinez: independent (Layer 6 draws on its §§2.1, 3.1, 3.2; Layer 7 on §§3.1, 4.2, 7.1, 8.1, 7.2, 9.2, 9.1, 8.2 in that order; Layer 8 on §§8.2, 9.3). Layers 2–4 share the order of glauberman §§2–4, forced by the *Needs* lines of §3.2 (§§2.2–2.4) and §4.1 (§3.2).

## Not verifiable

- isaacs (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13): uncertified, cited by locator only.
- navarro-1998 (Chapter 3, Theorem 5.9), navarro-2018 (Chapter 2), feit (Chapter IV): uncertified, cited by locator only. Each target they support also has a verified locator in a cached source.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (line 725): the source says height zero characters are those whose degree's `p`-part equals the numerical defect `d(B)`; it should be those whose degree's `p`-part equals `p^{a−d(B)}`; affects nothing.

## For the human reviewers

- Scope and licence: the largest share of locators (40 of 100) goes to martinez, unpublished course notes (Firenze 2024) read from the author's university page. The main results are also cited to reynolds, sambale and navarro-1998.
- LocalFiniteGroupTheory (open, on the list of roadmaps never cited as suppliers) plans Glauberman's lemma in its L3 (its README:18, 192). This roadmap's §1.2 states and proves the same lemma.
