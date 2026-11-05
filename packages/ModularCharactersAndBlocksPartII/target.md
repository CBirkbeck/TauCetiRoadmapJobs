Verdict: part-ii
Name: ModularCharactersAndBlocksPartII
Base: ModularCharactersAndBlocks
Owner: none

# ModularCharactersAndBlocks, Part II: the Glauberman correspondence and heights of characters

## Scope

The base roadmap `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks` (open pull
request #1775, merge order position after GL2AutomorphicRepresentationsAndTransfer) builds
`p`-modular systems, Brauer characters, blocks of `O[G]`, `k[G]` and `K[G]`, the partition
`Irr(G) = ⨆_b Irr(G,b)`, defect groups through the Brauer projection, blocks of defect zero,
Brauer's three main theorems and the behaviour of blocks under normal `p`- and `p'`-subgroups
(its Layers 0–8). It stops before the arithmetic of character degrees inside a block and before
any character correspondence attached to a group action. Part II starts there and owns:

1. **Coprime actions on characters and the Glauberman correspondence.** For finite groups `S`
   and `Γ` with `Nat.Coprime |S| |Γ|` and `S` acting on `Γ` by automorphisms
   (Mathlib's `MulDistribMulAction S Γ`, with the internal case `S ≤ N(Γ)` derived as in
   LocalFiniteGroupTheory's conventions): the action of `S` on `Irr(Γ)` by conjugate characters,
   the fixed set `Irr_S(Γ)`, Brauer's permutation lemma `|Irr_S(Γ)| = ` number of `S`-fixed
   conjugacy classes, the canonical extension `χ̂` of an `S`-invariant character to the
   semidirect product `Γ ⋊ S` with Gallagher's description of the characters over `χ`, the
   cyclic case, the `p`-group case, the solvable case with its chain-independence,
   compatibility and equivariance laws, the uniqueness of the family of bijections, the
   **Glauberman correspondence** `θ ↦ θ*`, the elementary degree relations, and the
   **Glauberman degree-divisibility** statement `θ*(1) ∣ θ(1)` as a named statement, proved
   for abelian `Γ` and cited (Geck) in general.
2. **Heights.** For a block `b` of `G` with defect group `D`, `|G|_p = p^a`, `|D| = p^d`:
   **Brauer's theorem on heights**, the height `h(χ)` and the defect `d(χ)` of
   `χ ∈ Irr(G,b)`, the height zero characters `Irr_0(G,b)`, their independence of `D`,
   nonemptiness, the equivalent descriptions (by `d(χ)`, in the principal block, in blocks of
   defect zero, in the Brauer correspondent block of `N_G(D)`), the preservation of heights by
   the Fong–Reynolds correspondence, and the heights of a block with normal defect group.
3. **Brauer's height zero conjecture and the Alperin–McKay conjecture as predicates on blocks**,
   with the Kessar–Malle direction, the Malle–Navarro–Schaeffer Fry–Tiep direction and
   Ruhstorfer's prime-`2` theorems recorded as cited theorems, and **Reynolds' theorem**
   (the conjecture for blocks with normal defect group) proved, which contains the filed cases
   of `p`-groups and abelian groups; blocks of defect zero are a separate proved case.

It does not own: the Isaacs correspondence for `Γ` of odd order and arbitrary `S`
(Isaacs 1973) and Wolf's theorem that it agrees with Glauberman's; Turull's theory above the
correspondence; the inductive Alperin–McKay or McKay conditions and any reduction theorem; the
proofs of the cited theorems, which rest on the classification of finite simple groups and on
Lusztig's theory; blocks with cyclic defect groups and Brauer trees; Dade's conjectures.

**Generality.** The correspondence is stated for `S` solvable, which is the generality of
Glauberman's paper and the one every cited application uses; the `p`-group and cyclic cases are
layers of the same construction, not separate theories. The canonical extension and Gallagher's
theorem need only coprimality, not solvability, and are stated so. Heights are stated for an
arbitrary block of an arbitrary finite group at an arbitrary prime, over the splitting
`p`-modular system of the base (its Layer 1) and, where the base states a result over any
algebraically closed field of characteristic `p`, over such a field. The filed special cases
of the height zero conjecture (`p`-groups, abelian groups) are Checks of Reynolds' theorem for
normal defect groups, which the open sources prove in full (martinez Theorem 9.8, reynolds
Theorem 9).

Suggested homes: `TauCeti/RepresentationTheory/CharacterTable/Glauberman/` and
`TauCeti/RepresentationTheory/Block/Height.lean`.

## Final targets

Throughout, `Γ` and `S` are finite groups, `S` acts on `Γ` by automorphisms with
`Nat.Coprime |S| |Γ|`, `C = C_Γ(S)` is the fixed-point subgroup, `Γ ⋊ S` the semidirect
product, and characters are complex (the native `TauCeti.irreducibleCharacters ℂ G`).

**T1 (canonical extension and Gallagher).** For `χ ∈ Irr_S(Γ)` there is a unique
`χ̂ ∈ Irr(Γ ⋊ S)` with `χ̂|_Γ = χ` whose determinantal character is trivial on `S`
(equivalently, has order prime to `|S|`); `χ̂` has the same field of values as `χ` and takes
rational integer values on `S`; and `β ↦ χ̂ · β` is a bijection from `Irr(S)` (inflated to
`Γ ⋊ S`) onto the irreducible characters of `Γ ⋊ S` lying over `χ`. No solvability of `S` is
assumed. (glauberman line 234, Theorem 2; hartley-turull line 304, Definition 3.1; isaacs,
Chapters 6 and 8, uncertified.)

**T2 (cyclic case).** If `S = ⟨a⟩` is cyclic, there are a unique sign `ε = ±1` and a unique
`χ* ∈ Irr(C)` with `χ̂(a t) = ε χ*(t)` for all `t ∈ C`, the same `ε` and `χ*` for every
generator `a`; and `χ ↦ χ*` is a bijection `Irr_S(Γ) → Irr(C)`. (glauberman line 299,
Theorem 3; hartley-turull line 306, Proposition 3.2, for the sign as a function of cyclic
subgroups.)

**T3 (`p`-group case).** If `S` is a `p`-group and `χ ∈ Irr_S(Γ)`, there is a unique
`χ* ∈ Irr(C)` with `p ∤ [χ|_C, χ*]`; moreover `[χ|_C, χ*] ≡ ±1 (mod p)`, and `χ ↦ χ*` is a
bijection `Irr_S(Γ) → Irr(C)` extending T2. (glauberman line 537, Theorem 4(a), with line 607,
Corollary 8; isaacs, Chapter 13, uncertified.)

**T4 (solvable case, uniqueness and compatibility).** For `S` solvable there is a unique family
of bijections `π(Γ,S) : Irr_S(Γ) → Irr(C_Γ(S))`, one for every such pair, that agrees with T3
whenever `S` is a `p`-group and satisfies `π(Γ,S)(χ) = π(C_Γ(T), S/T)(π(Γ,T)(χ))` for every
`T ⊴ S` (the action of `S/T` on `C_Γ(T)` being the induced one). Each `π(Γ,S)` is computed by
any chain `1 = S_0 ⊴ S_1 ⊴ … ⊴ S_m = S` with `S_{i+1}/S_i` a `p_i`-group, is equivariant for
automorphisms of `Γ ⋊ S` stabilising `Γ` and `S`, commutes with the Galois action on values,
preserves fields of values, and `π(Γ,S)(χ)` is a constituent of `χ|_C`. Brauer's permutation
lemma: `|Irr_S(Γ)|` equals the number of `S`-fixed conjugacy classes of `Γ`. (glauberman
line 537, Theorem 4(b),(c), line 601, Corollaries 7–9, line 636, Theorem 5(a)–(d);
spath-vallejo line 118, the compatibility law at line 129; navarro-2018, Chapter 2,
uncertified, for the uniqueness-of-family formulation.) **Definition.** The Glauberman
correspondence is `θ ↦ θ* := π(Γ,S)(θ)`.

**T5 (degree relations).** For `S` solvable and `θ ∈ Irr_S(Γ)`: `θ(1) ∣ |Γ : C| · θ*(1)`
(glauberman line 644, Theorem 5(e)). **Glauberman degree-divisibility**, the named statement
`θ*(1) ∣ θ(1)`, is proved for abelian `Γ` (where `θ* = θ|_C`) and recorded as a cited theorem
in general (geck line 29; hartley-turull line 84, Theorem A, the conditional form).

**T6 (Brauer's theorem on heights).** Let `b` be a block of `G` with defect group `D`,
`|G|_p = p^a`, `|D| = p^d`. Then `p^{a−d} ∣ χ(1)` for every `χ ∈ Irr(G,b)`, and some
`χ ∈ Irr(G,b)` has `χ(1)_p = p^{a−d}`. (martinez line 728, Theorem 3.4, proof at lines 783–831
through defect classes and central characters, which the base's §6.2 identifies with its Brauer
projection definition; navarro-1998, Chapter 3, uncertified; feit, Chapter IV, uncertified.)

**T7 (heights and height zero characters).** Define `h(χ) := ν_p(χ(1)) − (a − d) ≥ 0`, the
defect `d(χ) := a − ν_p(χ(1))`, and `Irr_0(G,b) := {χ ∈ Irr(G,b) : h(χ) = 0}`
(martinez line 718, Section 3.2; reynolds line 60). Prove: `h` and `Irr_0` do not depend on
the choice of `D`; `Irr_0(G,b) ≠ ∅`; `h(χ) = 0 ↔ d(χ) = d ↔ ν_p(χ(1)) = a − d`;
`Irr_0(G, B_0(G))` is the set of characters of the principal block of `p'`-degree (its defect
groups are the Sylow `p`-subgroups, base §6.2); a block of defect zero has `Irr(G,b) = {χ} =
Irr_0(G,b)` with `χ(1)_p = |G|_p`, and a block containing such a character has defect zero
(base §6.2); for the Brauer correspondent `b' ∈ Bl(N_G(D))` of `b` (base §7.1), `D` is a defect
group of `b'` and `Irr_0(N_G(D), b') = {ψ ∈ Irr(N_G(D), b') : ψ(1)_p = |N_G(D) : D|_p}`;
heights are preserved by the Fong–Reynolds correspondence (martinez line 1864); for a block
with normal defect group `D`, the set of heights of `b` is `{ν_p(ξ(1)) : ξ ∈ Irr(D)}`
(martinez line 2131, Corollary 8.12; reynolds line 531, Theorem 8). **Definition.** The
Alperin–McKay predicate `|Irr_0(G,b)| = |Irr_0(N_G(D), b')|` (ruhstorfer line 16).

**T8 (the height zero conjecture as a predicate; cited theorems).** Define, for a prime `p`,
`BrauerHeightZero p` as: for every finite group `G`, every `p`-block `b` with defect group `D`,
`Irr(G,b) = Irr_0(G,b) ↔ D` is abelian (martinez line 2321, Conjecture 9.7; mnst line 48). Cited
theorems, stated and not proved: abelian `D` implies `Irr(G,b) = Irr_0(G,b)` (kessar-malle
line 25, Theorem 1.1); for odd `p`, `Irr(G,b) = Irr_0(G,b)` implies `D` abelian (mnst line 70,
Theorem A); for `p = 2`, both directions and the Alperin–McKay conjecture (ruhstorfer line 20,
Theorem A, and line 33, Corollary B).

**T9 (Reynolds' theorem).** If `b` is a block of `G` with a normal defect group `D`, then
`Irr(G,b) = Irr_0(G,b)` if and only if `D` is abelian (reynolds line 542, Theorem 9; martinez
line 2328, Theorem 9.8, proved from the Fong–Reynolds correspondence and the structure of
blocks with normal defect group, martinez Theorem 8.11). Checks, each an elementary instance:
blocks of defect zero (`D = 1`); `G` a `p`-group (one block, `D = G`, `Irr(G) = Irr_0` exactly
when all characters are linear); `G` abelian; `G = D × H` with `H` a `p'`-group.

Every target is universe-polymorphic in the groups, carries `Finite` instances rather than
`Fintype` data, and states the external action through `MulDistribMulAction` with the internal
case derived.

## Suppliers

Earlier in the merge order or on main; nothing here is re-planned.

- **ModularCharactersAndBlocks** (#1775, base): Layer 1 (the splitting `p`-modular system),
  Layer 4 (`Irr(G,b)`, the principal block, the central-character criterion for membership),
  Layer 6 (defect groups, the defect-class characterisation of §6.2, blocks of defect zero),
  Layer 7 (block induction, the first main theorem and the Brauer correspondent), Layer 8
  (normal `p'`-subgroups and block covering, §8.2). Part II adds the Fong–Reynolds
  correspondence and the normal-defect-group structure theorem that the base does not plan.
- **LocalFiniteGroupTheory** (#1634): L1 (Hall subgroups, the conjugacy half of
  Schur–Zassenhaus) and L3 (invariant Sylow subgroups, Glauberman's lemma, fixed points modulo
  an invariant normal subgroup, `C_{Γ/N}(S)` as the image of `C_Γ(S)`); its solvability
  hypothesis is met since `S` is solvable in every statement that needs it.
- **RepresentationTheory/InductionRestriction** (main): Layer 1 (conjugate representations, the
  action on `Irr(N)`), Layer 2 (Frobenius reciprocity), Layer 5 (Clifford theory, inertia
  groups), Layer 7 (extension obstructions), consumed with the native
  `TauCeti.inertia`, `FDRep.cliffordCorrespondence`,
  `FDRep.clifford_restrict_inertia_eq_top_of_coprime` and `TauCeti.clifford_restrict_character`.
- **RepresentationTheory/CharacterTheory** (main): §3.5 (orthogonality and primitive central
  idempotents), §4.2 (values are cyclotomic integers), §4.3 (central characters and
  `χ(1) ∣ |G|`, native `TauCeti.Representation.finrank_dvd_card`), §4.4 (the Galois action on
  characters), §4.5 (Brauer's splitting field).
- **Tau Ceti**: `TauCeti.irreducibleCharacters`, `TauCeti.virtualCharacters`,
  `TauCeti.ClassFunction.characterPairing`, `Subgroup.indClassFunction`, the Clifford and
  inertia files under `TauCeti/RepresentationTheory/Induction/`, `TauCeti/GroupTheory/SemidirectProduct.lean`.
- **Mathlib**: `SemidirectProduct`, `MulDistribMulAction`, `FixedPoints.subgroup`,
  `Subgroup.exists_right_complement'_of_coprime`, `Sylow`, `IsPGroup`, `padicValNat`,
  `Nat.factorization`, `MonoidAlgebra`, `IsDiscreteValuationRing`, `IsLocalRing.ResidueField`.

## Consumers

- Every future roadmap on the local–global conjectures for finite groups: the McKay and
  Alperin–McKay conjectures, their inductive conditions, Dade's conjectures, the
  Isaacs–Navarro refinements; they are stated in the vocabulary of T7 and T8 and use T4 as a
  tool.
- A future roadmap on blocks with cyclic defect groups and Brauer trees (heights, Reynolds'
  theorem, the Brauer correspondent).
- The character-theoretic local theory that LocalFiniteGroupTheory names as future work
  (Bender–Suzuki, Gorenstein–Walter), which uses coprime actions on characters.
- A future Part III of the Isaacs odd-order correspondence and Turull's theory above the
  Glauberman correspondence.
- GlaubermanZStar (#1778) consumes the base only; it is not a consumer of Part II.

## Sources

Recorded in `packages/ModularCharactersAndBlocksPartII/sources.toml`; cite as
`<source id> line N`.

| id | work | licence class | locators used |
|---|---|---|---|
| glauberman | Glauberman, Canad. J. Math. 20 (1968), 1465–1488 | publisher-open (Cambridge Core CJM archive) | Theorem 2 (line 234), Theorem 3 (299), Theorem 4 (537), Corollaries 7–9 (601–628), Theorem 5 (636) |
| hartley-turull | Hartley–Turull, J. reine angew. Math. 451 (1994), 175–219 | open-repository (GDZ, OCR text) | Theorem A (line 84), Definition 3.1 (304), Proposition 3.2 (306) |
| geck | Geck, Ann. of Math. 192 (2020), 229–249, arXiv 1904.04586 | open-repository | Section 1, statement at line 29 |
| kessar-malle | Kessar–Malle, Ann. of Math. 178 (2013), 321–384, arXiv 1112.2642 | open-repository | Theorem 1.1 (line 25) |
| mnst | Malle–Navarro–Schaeffer Fry–Tiep, Ann. of Math. 200 (2024), no. 2, arXiv 2209.04736 | open-repository | Theorem A (line 70) |
| ruhstorfer | Ruhstorfer, Ann. of Math. 201 (2025), 379–457, arXiv 2204.06373 | open-repository | Theorem A (line 20), Corollary B (line 33), Alperin–McKay statement (line 16) |
| reynolds | Reynolds, Nagoya Math. J. 22 (1963), 15–32 | publisher-open (Cambridge Core NMJ archive) | height (line 60), Theorem 8 (531), Theorem 9 (542) |
| martinez | Martínez, course notes, Firenze 2024 | author-page | §3.2 (718–726), Theorem 3.4 (728, proof 783–831), Proposition 5.6 (1293), heights under Fong–Reynolds (1864–1870), Corollary 8.12 (2131), Conjecture 9.7 (2321), Theorem 9.8 (2328–2349) |
| sambale | Sambale, LNM 2127 | author-page | Chapter 1 conventions shared with the base |
| spath-vallejo | Späth–Vallejo Rodríguez, J. Algebra 457 (2016) | author-page | the correspondence and its compatibility law (lines 118–130) |
| isaacs | Isaacs, Character Theory of Finite Groups, 1976 | uncertified (paywalled) | Chapters 6, 8, 13 |
| isaacs-1973 | Isaacs, Amer. J. Math. 95 (1973), 594–635 | uncertified (paywalled) | named only, out of scope |
| navarro-1998 | Navarro, Characters and Blocks of Finite Groups, 1998 | uncertified (paywalled) | Chapters 3–4 |
| navarro-2018 | Navarro, Character Theory and the McKay Conjecture, 2018 | uncertified (paywalled) | Chapter 2 |
| feit | Feit, The Representation Theory of Finite Groups, 1982 | uncertified (paywalled) | Chapter IV |

Wolf's agreement theorem (Illinois J. Math. 22 (1978)) is not cited: Project Euclid refused the
fetch and the theorem is outside the scope.

## Risks

- **The base is an open pull request, and one supplier is a draft.** ModularCharactersAndBlocks
  (#1775) is in the merge order; LocalFiniteGroupTheory (#1634) is a draft pull request not yet
  in `merge-order/ORDER.txt`, although the base already consumes its §L1. Part II must sit
  after both; if LocalFiniteGroupTheory stalls, T2–T5 need the coprime-action lemmas
  (invariant Sylow subgroups, fixed points modulo invariant normal subgroups) from somewhere,
  and the design must not re-plan them.
- **Statability of heights at the pins.** The base's `Suggested.lean` records that the ordinary
  block partition `Irr(G,b)` is not statable at the pinned libraries. T6–T9 mention `Irr(G,b)`,
  so Part II's `Suggested.lean` needs a simple definition of membership of an irreducible
  `K`-character in a block of `O[G]` (through the block idempotent of `O[G]` acting on a
  simple `K[G]`-module over the fraction field `K` of a complete discrete valuation ring) with
  no sorry'd data. T1–T5 are statable with the native characters, `SemidirectProduct` and
  `MulDistribMulAction`.
- **Cited theorems.** Kessar–Malle, Malle–Navarro–Schaeffer Fry–Tiep, Ruhstorfer and Geck rest
  on the classification of finite simple groups and on Lusztig's theory; the roadmap cannot
  prove them. The design must state the conjectures as predicates (T7, T8) and prove T9 and
  the elementary cases, and must not place a `sorry` it cannot discharge in `Suggested.lean`;
  the cited results belong in the README as cited theorems, in the manner of CFSGStatement.
- **Reynolds' theorem is a real addition.** It needs the Fong–Reynolds correspondence and the
  structure of blocks with normal defect group (martinez Lectures 7–9), which the base does not
  plan beyond block covering in its §8.2, whose contract is one sentence. The design should
  budget a layer for them and pin the exact covering statements it consumes.
- **The uniqueness-of-family formulation** (T4) is only in a paywalled text (navarro-2018); the
  open route is Glauberman's Theorem 4(c) with Corollaries 7–8 and an induction on `|S|` through
  a normal subgroup of prime index, which the design must write out.
- **Hartley–Turull is an OCR text** of a scan; only the three cited items were checked against
  the OCR. Any further locator into it must be verified by reading the recognised page.
- **Solvability of `S`.** Dropping it (Isaacs' odd-order correspondence, Feit–Thompson) is out
  of scope; a Part III would be needed, and Wolf's agreement theorem could not be fetched.
