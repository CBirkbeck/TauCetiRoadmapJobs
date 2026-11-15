# PORT-ModularCharactersAndBlocksPartII

- Branch: `roadmap/modular-characters-and-blocks-part-ii`, from main at `d1f3b7d`.
- Head commit: `c2e9927b3f03dc1c195dd2e17cf18b60e99a1cf6`, message
  `ModularCharactersAndBlocksPartII: roadmap (README, Suggested.lean, metadata)`.
- Folder: `TauCetiRoadmap/ModularCharactersAndBlocksPartII/{README.md,Suggested.lean,metadata.toml}`;
  nothing outside it changed.

## Build

`lake build TauCetiRoadmap.ModularCharactersAndBlocksPartII.Suggested`:

    Build completed successfully (18334 jobs).

16 warnings, all `declaration uses 'sorry'` (one per theorem); no other warning, no error.

## Gate

    gate ModularCharactersAndBlocksPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 241 roadmaps, 2247 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

This roadmap continues ModularCharactersAndBlocks into the two parts of the character theory of
finite groups that its base stops short of. The first is coprime action: for finite groups `S`
and `Γ` of coprime orders with `S` acting on `Γ`, it builds the action of `S` on `Irr(Γ)`,
Brauer's permutation lemma for an automorphism, the determinant-normalised canonical extension of
an invariant character to `Γ ⋊ S` with its rational values on `S`, Gallagher's correspondence, the
cyclic, `p`-group and solvable cases of Glauberman's construction, and the **Glauberman
correspondence** `Irr_S(Γ) → Irr(C_Γ(S))`, characterised as the unique family of bijections that
picks the constituent of multiplicity prime to `p` for `p`-groups and is compatible with normal
subgroups of `S`, together with its sign formula in the cyclic case and its constituent,
field-of-values and degree laws. The second is the arithmetic of degrees inside a block: central
characters of blocks and Osima's formula, **Brauer's theorem on heights**, heights and height zero
characters and their invariance under a change of place, of cyclotomic level and of splitting
`p`-modular system, the Min–Max theorem, covering and domination for an arbitrary normal subgroup,
the **Fong–Reynolds correspondence**, Fong's theorem, the extended first main theorem, the blocks of
`P C_G(P)` with defect group `P`, and **Reynolds' theorem**: a block with a normal defect group has
all its characters of height zero exactly when that group is abelian. Brauer's height zero
conjecture, the Alperin–McKay conjecture and Glauberman degree-divisibility are stated as
predicates with their proved instances, their general validity cited. These are the tools in
which the local–global conjectures for blocks, character-theoretic local analysis and a later part
on the Isaacs correspondence are written. `Suggested.lean` states the sixteen end theorems against
the pinned Mathlib and Tau Ceti with four small definitions; the block statements hold for an
arbitrary splitting `p`-modular system.

## Roadmaps this one depends on that are still pull requests

- ModularCharactersAndBlocks (another author's pull request adding a new folder,
  `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks`): Conventions and §§0.2,
  1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2. Every cited section exists at
  its head under that number; I re-read Conventions, §§1.1–1.3, 2.3, 2.4, 6.2, 6.3, 7.1, 7.2, 8.1,
  8.2 at the head (whose latest commits repair §§6.2, 7.1, 7.2) against the contract in
  "Exact supplier contracts": faithful, including §7.2 passing the second main theorem to the
  system of §1.1 and §6.2's first main theorem in Brauer-projection form over a splitting residue
  field. The names `IsDefectGroup`, `isDefectGroup_conj`,
  `isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `existsUnique_blockIdempotent_map_residue`,
  `exists_blockIdempotent_iff_centralCharacter_congr`, `brauer_first_main` and `SameBlock` are
  declared in its `Suggested.lean`.
- InverseGaloisAndArithmeticFundamentalGroups (merge order line 55, right before this roadmap):
  IG.3.4, target *Conjugacy of coprime complements* ("`N` or `G/N` solvable", conjugate by an
  element of `N`), read at its head.

Main roadmaps cited: CharacterTheory §§2.1, 3.5, 3.6, 4.1, 4.3, 4.4, 4.5 and InductionRestriction
Layers 1, 2, 5, 7 (all present under those numbers on main; `fieldOfValues_eq_map_fixedField_stabilizer`,
`conjRep` and `cliffordObstruction` are declared in their `Suggested.lean`).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one module docstring
saying the README is the roadmap and naming the three cited predicates that are not stated,
`import Mathlib` plus three `TauCeti.*` modules each used
(`CharacterTable.Table`, `Induction.ClassFunction`, `RingTheory.Idempotents.Primitive.Basic`, all
present at the pin), no `variable` block, no `set_option`, no sorry'd data, 16 theorems and four
definitions with real bodies (`invariantIrreducibleCharacters`, `IsGlaubermanFamily`,
`IsBlockDefectGroup`, `blockCharacters`), each needed by a headline. It is ported byte for byte.

Headline selection: Brauer's permutation lemma for an automorphism (§1.3), Fong's theorem (§7.5),
the extended first main theorem (§7.6) and vanishing off defect groups (§8.1) are statable with the
file's definitions, but they are intermediate results feeding the end theorems, and the accepted
design names the sixteen end theorems of the README's second paragraph as the headlines; they stay
README targets. No statable end theorem is missing.

## `#check` pass

I appended `#check @name` for all 20 declarations of the file and for 76 library declarations the
README names (with the Tau Ceti modules they need) to the module, built it once, and restored the
file. All 96 elaborated; every elaborated type of the 20 declarations equals its README statement
(no section variables exist, so no binder can be lost). Change: none to the Lean.

## Supplier replacements and duplication removals

None needed.

- Supplier names: every Mathlib and Tau Ceti declaration the README names exists at the pin
  (`#check` above), with the hypotheses the README attributes to it (for example
  `TauCeti.card_irreducibleCharacters` over an algebraically closed field with `|G|` invertible,
  `TauCeti.clifford_restrict_character` with `IsUnit (Nat.card G)`,
  `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` over any field,
  `Rep.indResAdjunction` over any commutative ring, `MonoidAlgebra.coeff` the structure field of
  `Mathlib/Algebra/MonoidAlgebra/Defs.lean`, the quotient instance at
  `Mathlib/GroupTheory/GroupAction/OfQuotient.lean` line 62, the normaliser action at
  `Mathlib/GroupTheory/Subgroup/Centralizer.lean` line 177).
- Library near-matches (`scratch/library-matches.md`): none of the 20 statements, or of the
  README targets, is proved at the pin; the coprime-intersection lemma of §2.3 is not in Mathlib
  (it has `IsCyclotomicExtension.lcm_sup`, the compositum, only).
- Restatements of suppliers: `IsBlockDefectGroup` is the base's §6.2 `IsDefectGroup` (truncation
  `brauerProjection` nonzero ⟺ a nonzero coefficient on `C_G(P)`), written with coefficients and
  for any element of `k[G]`; it is kept because a roadmap module cannot be imported, its name is
  not the base's fully qualified name, and the README says it is the base's definition.
- Duplication sweep by object (on main and at every open head, `roadmaps grep`): Glauberman
  correspondence, canonical extension, Gallagher, permutation lemma, heights / height zero,
  Brauer's height theorem, Fong–Reynolds, Reynolds, Alperin–McKay, Osima, Min–Max, extended first
  main theorem, regular blocks, domination, Fong's theorem, defect classes, coprime action,
  Glauberman's lemma, Isaacs correspondence, Hartley–Turull, degree-divisibility, Clifford. No
  match on main; at the open heads only the following, each read:
  - FiniteGroupInvariants §6.2: Brauer's permutation lemma for the Galois action only; the README
    already names it as not owned, §1.3 here being the automorphism form.
  - OddOrderTheorem §1.3: coprime-action commutator and centraliser statements (Bender–Glauberman
    §1); none of them is a statement of this roadmap.
  - GlaubermanZStar: consumes the base only (its suppliers section and every *Needs:* line), as
    the README's "Downstream consumers" says.
  - InductionRestrictionPartII: reduced multipliers and fixed fibres of central extensions; it does
    not own the Clifford divisibility of the declared gap.
  - LocalFiniteGroupTheory L3 (on the list of roadmaps never cited as suppliers, and not in the
    merge order): Glauberman's lemma on compatible actions and invariant cosets of an invariant
    normal subgroup. README §1.2 proves the class and coset forms (the coset form for any
    invariant subgroup, normal or not) from IG.3.4, with Glauberman's lemma as its route. This
    roadmap is in the merge order and the other is not, so the ordering rule makes it the owner
    here; that roadmap is not mentioned in the README. A maintainer may want the two reconciled.

## README fixes made in the upstream read

1. "Exact supplier contracts", From Tau Ceti: `FDRep.cliffordCorrespondence` is declared at the
   pin with `{k G : Type u}`, the field and the group in one universe, so over `ℂ` it applies to
   `G : Type` only, while the roadmap's statements are universe-polymorphic; the contract now says
   so and that a group in another universe is first replaced by its `ULift`, which has the same
   characters.

No other statement needed a change; the adversarial pass below recomputes every Check it touches.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convention `s · χ` (`arrowAction`) | `C₇`, `S = C₃` by `r ↦ r²` | `s⁻¹ • r = r⁴` (`2·4 ≡ 1 mod 7`); `(s·χ)(r) = ζ₇⁴`, against `χ(s • r) = ζ₇²`; `inr s⁻¹ · inl r · inr s = inl(s⁻¹ • r)` by `inl_aut` | agrees with `TauCeti.char_conjFDRep` (`χ(x⁻¹ y x)`) | none |
| Convention `det η` | `S₃`, `std` at a transposition | eigenvalues `1, −1`, `det = −1 = sgn(t)` | holds | none |
| Convention sign `ε` | `SL(2,3)`, `χ₂` | `a`: eigenvalues `ω, ω²`, trace `−1`; `−a`: `−ω, −ω²`, trace `1`; `χ*(1) = 1`, `χ*(−1) = −1`, `ε = −1` | holds | none |
| Convention places | `S₃` (`e = 6`), `C₇ × C₂` (`e = 14`), `p = 2` | `ord₃(2) = 2`: one place, `𝔽₄`; `ord₇(2) = 3`: `6/3 = 2` places, `𝔽₈` | holds | none |
| Convention valuations | `p = 2`: `0`, `3/2`, `2/3` | `0 ∈ m` with `ν = 0`; `ν(3/2) = −1`, not in `O`; `ν(2/3) = 1`, in `m` | holds | none |
| `IsBlockDefectGroup` | `k[S₃]`, `p = 2`, `e = 1 + r + r²`, `e = r + r²`; `k[S₄]`, `p = 3` | `1/3 ≡ 1`, `2/3 ≡ 0`, `−1/3 ≡ 1 (mod 2)`: `⟨t⟩` has coefficient `1` at `1 ∈ C_G(⟨t⟩)`; `r + r²` vanishes at `1, t`, defect group `1`. `S₄`: `e_χ` coefficients `3/8, 1/8, −1/8, 0, −1/8` reduce to `0, 2, 1, 0, 1`; `λ(e) = 2·2 − 1 − 2 = 1`; `C_G(⟨(123)⟩)` of order `3`, coefficients `0` | `⟨t⟩`, `1`, `1`; the variant without maximality accepts `1` for `B₀`, the normaliser variant accepts `⟨(123)⟩` | none |
| `blockCharacters` | `S₃` over `ℤ₂[ζ₃]`; `C₃` over `ℤ₂`; `b = 0` | on `std`: `(1 + ζ₃ + ζ₃²)/3 = 0`, `(2 − ζ₃ − ζ₃²)/3 = 1`; over `ℚ₂` one character `2, −1, −1`; `b = 0`: empty, `IsIrreducible` being `IsSimpleOrder` (nontrivial) | `{1, sgn}`, `{std}`, one character, `∅` | none |
| `invariantIrreducibleCharacters` | `Q₈` with `C₃`; trivial action; `C₇` with `C₃` | `{1, χ₂}`; `Irr(Γ)`; `{1}` (orbits `{ψ, ψ², ψ⁴}`, `{ψ³, ψ⁶, ψ⁵}`) | holds | none |
| `existsUnique_canonicalExtension` | `S₃ = C₃ ⋊ C₂`, `χ = 1`; `SL(2,3)`, `χ₂`; `Γ = 1` | `sgn` has `det = −1` on `C₂`; `det(χ̂β)` on `S` is `β^{χ(1)} = β² ≠ 1` for `β ≠ 1` of order `3`; `Γ = 1`: a linear `ψ` with `ψ(s) = det = 1`, so `ψ = 1` | unique in each | none |
| `canonicalExtension_values` | `SL(2,3)` | values `2, −2, 0, −1, 1, −1, 1`, all in `ℤ`; `ℚ(χ̂) = ℚ = ℚ(χ₂)`; control `χ̂ω(a) = −ω ∉ ℤ` | holds | none |
| `gallagher_bijOn` | `N = Z(Q₈)`, `θ` faithful (no extension); `N = 1`, `G = C₂`, `η = sgn`; `N = G` | `|Irr(Q₈ | θ)| = 1` against `|Irr(Q₈/N)| = 4`; `1 ↔ sgn`; `{1} → {θ}` | holds; the extension hypothesis is needed | none |
| `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `3^{1+2}` with `(x, y, z) ↦ (−x, −y, z)`; `C₇ ⋊ C₃` with `r ↦ r⁻¹`, `b ↦ b`; `C₃` on `C₇` | `2 = 2 = 2`; `1 + 2 = 3`, `|Z| = 3`, `3` central classes and no other invariant class; `C = ⟨b⟩`, `3 = 3 = 3`; `1 = 1 = 1` | holds | none |
| `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; `S = 1`; swap on `C₂ × C₂` | `[χ₂|_C, sgn] = 2 ≡ −1`, `[χ₂|_C, 1] = 0`; `S = 1`: `m = 1` at `χ`, `0` elsewhere; non-coprime: `(1,1)`, `(−1,−1)` both restrict to `1` with `m = 1` | holds; coprimality needed | none |
| `IsGlaubermanFamily`, `exists_isGlaubermanFamily` | the law at `T = 1` and `T = S`; `S = 1` | `T = 1`: `π(Γ,1)χ = χ` on `⊤`, `S`-invariant; `T = S`: law 2 at the trivial group gives `π(C, S/S) = id` (`m = 1`) | consistent and satisfiable | none |
| `IsGlaubermanFamily.apply_eq` | induction through `T ⊴ S` of prime index | `π(C_Γ(T), S/T)` fixed on `Irr_{S/T}` by law 2 and the uniqueness of the previous row; `π(Γ, T)` by induction on `|T| < |S|`; `C_Γ(T) : Type u`, `S ⧸ T : Type v` | unique | none |
| `IsGlaubermanFamily.exists_sign_of_isCyclic` | `SL(2,3)`, generators `a`, `a²`; `S = 1` | `χ̂(a) = χ̂(a²) = −1`, `χ̂(−a) = χ̂(−a²) = 1`, `ε = −1`; `S = 1`: `ε = 1`; `inr a` and `inl t` commute for `t ∈ C` (`inl_aut`) | holds | none |
| `IsGlaubermanFamily.restrict_pairing_ne_zero` | swap on `C₃ × C₃`; `SL(2,3)` | `(ψ_a × ψ_a)|_Δ = ψ_{2a}`, sum `3 ≠ 0`; `[χ₂|_C, sgn] = 2` | holds | none |
| `IsGlaubermanFamily.adjoin_range_eq` | `SL(2,3)`; swap on `C₃ × C₃`, `a ≠ 0` | `ℚ = ℚ`; `ℚ(ζ₃) = ℚ(ζ₃)` | holds | none |
| `IsGlaubermanFamily.index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}` with `C₂`; `θ = 1` | `4·1 = 2·2`; `9·1 = 3·3`; `θ = 1`: `q = |Γ : C|`; reverse `|Γ : C| ∣ 1` fails | holds | none |
| `brauer_height` | `S₃`, `p = 2`; `SL(2,3)`, `p = 3`; `A₅`, `p = 2`; `C₃` over `ℤ₂` | `B₀`: `a = d = 1`, degrees `1, 1`; defect zero: `2 ∣ 2`; `ν₃(2) = 0 = 1 − 1`; `A₅`: degrees `1, 3, 3, 5`, `a − d = 0`, the model `4 ∣ χ(1)` fails; `C₃`/`ℤ₂`: `a − d = 0`, only degree `2`, `ν = 1`, so the second clause fails without `hζ` | holds with `hζ`; `hζ` needed | none |
| `fongReynolds` | `S₃`, `N = C₃`, `p = 2`, `b = {λ}`; `S₄`, `N = V₄`, `p = 3`; `N = G` | `T = C₃`, `λ^G = std`, heights `0 = 0`; `T = D₈`, two extensions of `λ` induce to the two degree-`3` characters (`24/8 = 3`), defect zero on both sides; `T = G`, identity | holds | none |
| `existsUnique_fongReynolds` | `S₃`, `N = C₃`, `p = 3` | `k[C₃]` has the one block `1`, so `T = S₃` and `B = B'`; an inertia-group model `T = C₃` would induce `1` to `1 + sgn`, reducible | holds; the stabiliser of the idempotent is needed | none |
| `reynolds_heights` | `SL(2,3)`, `p = 2`; `D = 1`; `A₄`, `p = 2` | degrees `1,1,1,2,2,2,3`, `a − d = 0`: `{0, 1} = {ν(1), ν(2)}`; `{0} = {0}`; `{0} = {0}` | holds, both inclusions | none |
| `reynolds` | `D₈`; `A₄`; `D = 1`; `SL(2,3)`, `p = 2` | heights `0,0,0,0,1`, nonabelian; `0,0,0,0`, abelian; one character, `⊥` abelian; height `1` occurs, `Q₈` nonabelian | holds, both directions | none |
| §1.2 fixed classes and cosets | `Q₈`/`C₃`; `S₃` with inner `t`; `C₂` on `C₂²`; `A₅` on `𝔽₇⁵`, `𝔽₅⁵` | `2 = 2`; `3 ≠ 2`; coset `{(1,0),(0,1)}` without fixed point; `5⁻¹ ≡ 3 (mod 7)`, constant vector `3c`; `5c = 0 ≠ 1` | holds; coprimality needed | none |
| §1.3 permutation lemma | `C₃` with inversion; `𝔽₂³` with `⟨1 + E₁₂, 1 + E₁₃⟩` | `1 = 1`; per element fixed vectors and characters `8/8, 4/4, 4/4, 4/4` (computed), whole group `2` against `4`; orbits `(8 + 4 + 4 + 4)/4 = 5` both | holds; the group-level count differs | none |
| §2.1 normalised extension | `Q₈` with `C₂` by `i`; `Γ = 1`, `A = C₂` | `(cρ(i))² = −c² = 1`, `c = ±i`, `det = c² = −1`; trivial against sign, `det 1` against `−1` | holds; coprimality with the degree needed | none |
| §2.3 cyclotomic intersection | `(4, 3)`; `(4, 8)` | `ℚ(i) ∩ ℚ(ζ₃) = ℚ`; `ℚ(i) ∩ ℚ(ζ₈) = ℚ(i)` | holds | none |
| §3.1 cosets | `SL(2,3)`; `D₈` | `|C(a)| = 6`, two classes of size `24/6 = 4`; `(a·(−1))⁴ = a`, `(a·(−1))³ = −1`; class of `ax` is `{ax, ax³}` | holds; coprimality needed | none |
| §3.2 norm identity | `SL(2,3)` | `χ̂` on `aQ₈`: four values `−1`, four `1`, `Σ|χ̂|² = 8 = |Q₈|`; `|Γ : C| Σ_C = 4·(1 + 1) = 8` | holds | none |
| §3.4 restriction formulas | `3^{1+2}` with `C₂` and with `C₄`, `a(x, y, z) = (−y, x, z − xy)` | automorphism, `a² = (−x, −y, z)`, `a⁴ = 1`, fixed points of `a, a², a³` equal `Z` (computed); `C₂`: `(3ω − ω)/2 = ω`, `(3ω + ω)/2 = 2ω`; `C₄`: eigenvalues `i, −i, 1`, `χ̂(a) = 1`, `ε = 1`, `ε' = −1`, `θ₀(a) = −1`, `(3ω + ω)/4 = ω`, `ε' = 1` would give `ω/2` | holds; `ε' ≠ ε(χ)` occurs | none |
| §§4.1, 4.3 independence of the series | `C₁₅` on `Q₈ × C₁₁` | `ord₁₁(3) = 5`, `gcd(15, 88) = 1`; both series give `χ₂ × 1` | holds | none |
| §4.2 `p`-group step | `D₈ ≤ GL₂(3)`, series through `⟨diag(1, −1)⟩` | the swap carries `𝔽₃ × 0` to `0 × 𝔽₃` | the route uses only `S₁ ⊴ S` | none |
| §4.5 Checks | swap on `C₃ × C₃` | `ψ_a(t)² = ψ_{2a}(t)`, multiplicity `1` | `(ψ_a × ψ_a)* = ψ_{2a}` | none |
| §§5.1, 5.2 | `SL(2,3)`; `3^{1+2}` | `2 ∣ 4`, `1 ∣ 2`; `3 ∣ 9`, `1 ∣ 3`; `2 ≡ −1 (mod 3)` | holds | none |
| §6.1 central characters, Osima | `S₃`, `p = 2`; `C₃` over `ℚ₂(ζ₃)` | coefficients `1/3, 1/3, 0` (`B₀`) and `2/3, −1/3, 0` (`std`), computed; Osima `1·2/6 = 1/3`; `f_{{1}}` has `1/6 ∉ ℤ₂`; `ω_χ({r}⁺) = ζ₃`, `ζ₃ · ζ₃² = 1` | holds | none |
| §6.3 heights, change of place and level | `SL(2,3)`, `p = 2`; `C₇ × C₂`; `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅` | heights `0,0,0,1,1,1,0`; `ζ₇ ↦ ζ₇³`, `3 ∉ {1, 2, 4}`, exchanges the places; `ℚ₂(i)` residue `𝔽₂`, `ℚ₂(ζ₁₂)` residue `𝔽₄`; `ord₁₅(2) = 4`, `𝔽₄ ⊆ 𝔽₁₆` | holds | none |
| §6.4 special blocks | `A₅`, `A₄`, `p = 2`; `SL(2,3)`, `C₆`, `p = 3` | four odd degrees in `B₀(A₅)`, four height-zero characters of `A₄`; three in a block of `C₆` | holds | none |
| §7.1 Min–Max | `S₃`, `p = 2, 3` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1`; `p = 3`: `λ(𝒞_t⁺) = 3 ≡ 0`, `λ(𝒞_r⁺) = 2` | holds | none |
| §7.2 covering | `S₃`, `N = C₃`, `p = 2`; `S₄`, `N = A₄`, `p = 2` | `ω_std = 2·(−1)/2 = −1 = ζ₃ + ζ₃²`; `Ind λ` of dimension `2 = dim W`, Brauer character `2, −1` | holds with `|N|` not invertible | none |
| §7.3 domination | `S₃`, `N = C₃`, `p = 2, 3`; `S₃ × C₂`, `N = S₃` | `π(1 + r + r²) = 3 = 1`, `π(r + r²) = 2 = 0`; `p = 3`: `1 = e₊ + e₋`; factors `|N : N ∩ D| = 3, 1` | holds | none |
| §7.5 regular blocks | `S₄`, `p = 2`, `N = V₄` and `N = 1`; `C₂`, `N = 1` | class sizes outside `V₄`: `6, 8, 6`, regular; double transpositions `3`, `λ = 1`, not regular for `N = 1` | holds | none |
| §7.6 extended first main theorem | `S₄`, `p = 2`, `P = V₄` | index `24/4 = 6`, even; defect group `D₈ ≠ V₄` | holds | none |
| §§8.1–8.2 | `SL(2,3)`, `p = 3`, `χ₃`; `C₂ × C₃`, `p = 2` | `χ₃ = 0` at orders `3, 6`; three blocks `{ξ × ψ}` | holds | none |
| §§9.1–9.2 | `S₄`, `p = 2`; `SL(2,3)`, `p = 3`; `A₅`, `p = 2` | `ν(2) − (3 − 3) = 1`, `D₈` nonabelian; `3 = 3` twice; `4 = 4` | consistent with the cited theorems | none |
| Contract `FDRep.cliffordCorrespondence` | `#check` at the pin | `{k G : Type u_1}` | the one-universe restriction was unstated | contract clause added |

Context: no statement depends on a `variable` or `include` block (there is none); every standing
hypothesis is a binder of the declaration itself, as the `#check` output shows. Small arithmetic
(the `C₄` action on `3^{1+2}`, the `𝔽₂³` example, the `S₄` idempotent, the multiplicative orders)
was computed with a short script in the scratch directory.

## Unresolved

- The accepted design's conditional supplier gap `gap:clifford-multiplicity-dvd-index`
  (InductionRestriction Layer 7: `χ(1)/θ(1) ∣ |G : N|`), used by §8.3 for Reynolds' height
  formula. InductionRestriction on main states no such divisibility, and the open
  InductionRestrictionPartII does not own it either.
- Ownership against LocalFiniteGroupTheory L3 (Glauberman's lemma), above: this roadmap owns its
  §1.2 statements by the merge order; the open roadmap cannot be cited.
- Licence, from the accepted review: martinez, sambale and spath-vallejo are read from author
  pages that state no licence.
- The citation resolver reports main at `985be45` (index of 2026-11-15T20:52:29Z), newer than the
  branch point `d1f3b7d`; the gate ran against the local `origin/main` at `d1f3b7d`. The
  duplication and citation checks above were run against the newer index and found nothing new;
  the branch needs a rebase before merge.
- Ownership against open pull requests was checked for every roadmap whose files the brief gives
  (including the five closest by vocabulary).
- No suspicious instruction was found in any fetched or read text.


Pull request: #2411 (roadmap/modular-characters-and-blocks-part-ii at c2e9927)
