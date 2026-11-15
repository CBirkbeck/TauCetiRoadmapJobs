<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6898067037 -->
Review (claude) of de9b4d7

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) CharacterTheory §4.5 and two Mathlib declarations are consumed but missing from the supplier lists

   **Location.** `packages/ModularCharactersAndBlocksPartII/README.md` lines 133–136 (Scope, "Planned
   by other roadmaps"): "RepresentationTheory/CharacterTheory §2.1 …, §3.5 …, §3.6 …, §4.3 …, §4.4
   (the Galois action and the field of values)"; lines 441–446 (`### From
   TauCetiRoadmap.RepresentationTheory.CharacterTheory`), the same five sections; lines 281–314
   (`### From Mathlib`).

   **Claim.** The Scope section and the supplier contracts list what is consumed, by name and
   section.

   **Witness.** README line 226 ("CharacterTheory §4.5"), line 1076, the `*Needs:*` of §6.1 at lines
   1108–1110 ("CharacterTheory §4.5 and Mathlib's … `IsDedekindDomain.HeightOneSpectrum.adicCompletion`,
   … `UniformSpace.Completion.extension`") and line 1290 consume §4.5 and two Mathlib declarations
   that neither list names. All three exist where cited (CharacterTheory README on main, heading
   `### 4.5 Brauer's splitting field, and the universe adapter`; Mathlib
   `RingTheory/DedekindDomain/AdicValuation/Completion.lean` namespace line 37 and
   `Topology/UniformSpace/Completion.lean` line 429), so only the lists are incomplete.

   **Repair.**
   1. Line 136: after "§4.4 (the Galois action and the field of values)" add ", §4.5 (Brauer's
      splitting field: a field of characteristic zero containing a primitive `exp(G)`-th root of
      unity realises every irreducible representation)".
   2. Lines 443–446: add "§4.5 (every irreducible representation of `G` is realised over a field of
      characteristic zero containing a primitive `exp(G)`-th root of unity; used in Conventions and
      in the change of system of §6.1)".
   3. `### From Mathlib`: add "`IsDedekindDomain.HeightOneSpectrum.adicCompletion` (the completion
      of a number field at a finite place) and `UniformSpace.Completion.extension` (the extension of
      a uniformly continuous map to the completion), used in the change of system of §6.1".

   Tested on the instance that refuted the original: after the edit every supplier item of the
   `*Needs:*` line at 1107–1113 and of the Layer 6 `### Dependencies` at 1289–1292 appears in the
   Scope list and in a supplier subsection.

One finding, non-blocking (P3). The mathematics, the locators, the Lean file and the supplier
citations were checked and are sound; the single repair is a two-line completion of the supplier
lists. No previous review of the package exists, and no maintainer notes were left.

## Verified sound

### 1. Principles

- General library: Layers 1–5 make no restriction beyond the coprimality and solvability the
  theorems need; Layers 6–9 are stated for every splitting `p`-modular system, with the non-place
  system `k' = 𝔽₄(T)` treated (README lines 220–224, 1130–1134). No route-specific shortcut.
- Part II of an existing plan: the base ModularCharactersAndBlocks (open pull request adding a
  new folder) is cited by section, never re-planned; I compared the base's headings (Layers 0–8)
  with this text: heights, Fong–Reynolds, domination for arbitrary `N`, Reynolds, the Glauberman
  correspondence occur nowhere in the base (search for `height`, `Fong`, `Reynolds`, `domina`,
  `Glauberman` in its README: only GlaubermanZStar mentions and the `p`-subgroup domination of
  its §8.1, which this text cites).
- No copied passages (section 8 below), no algorithm, no sorry'd data, no `set_option`
  (`grep` of `Suggested.lean`: none).

### 2. Sources: the seeded sample (15 targets) and the remaining locators

Every `<source> line N` locator of the 15 sampled targets was opened at that line; all support
the statement as written.

| Target | Locator read | Result |
|---|---|---|
| 1.3 | glauberman line 355 (Brauer's theorem used for a cyclic group and a nonsingular table) | supports the single-automorphism form; isaacs 6.32 not readable |
| 2.2 | glauberman line 234 (Thm 2 (a)), line 263 (the name); hartley-turull line 304 (Def. 3.1) | match; the two normalisations (det trivial on `S` / determinantal order prime to `|S|`) are the two sources' |
| 2.4 | glauberman line 240 (Thm 2 (c)) | match (source: `A` coprime; README general `N ⊴ G`, which is Gallagher's theorem, isaacs 6.17 not readable) |
| 3.2 | glauberman line 299 (Thm 3 (a), (b)); hartley-turull line 306 (Prop. 3.2) | match, incl. "every generator" |
| 3.3 | glauberman line 364 (Cor. 4) | match |
| 3.4 | glauberman line 375 (Cor. 5 (a), (b)), line 454 (Cor. 6) | match; source hypothesis `B ≠ A` kept as `B < A`; the added `ε' = 1` follows from positivity of degrees |
| 4.1 | glauberman line 481 (Lemma 4), 503 (Definition), 524 (Lemma 5) | match; Lemma 4 asks no coprimality of `B`, as the README says |
| 4.2 | glauberman line 540 (Thm 4 (a)); proof uses Cor. 6 (c) at line 548 | match |
| 4.6 | glauberman line 636 (Thm 5 (a)–(d) at 639–643) | match; (b) restated with `j` prime to `|Γ|`, equivalent |
| 6.4 | martinez line 718 (§3.2), line 583 (Thm 2.8 (iii)–(iv)) | match |
| 7.3 | martinez lines 1895, 1897, 1907, 1909, 1924, 1928–1931 | match; Thm 8.5 is stated for any `N ⊲ G` |
| 7.4 | martinez line 1823 (Thm 7.12 (i)–(iv), 1827–1834); reynolds line 133, 149; sambale line 509 | match |
| 7.6 | martinez line 1985 (Thm 8.8), 2295 (Thm 9.6); sambale line 499 | match |
| 8.1 | martinez line 2011 (Thm 8.10, itself citing Navarro 5.9) | match |
| 8.2 | martinez line 2018 (Thm 8.11 (i)–(iii)), 2131 (Cor. 8.12); reynolds line 509, 201 | match |

Also opened, outside the sample: glauberman lines 94, 100, 173, 266, 287, 543, 562, 601, 607, 623,
644; hartley-turull 84, 91; geck 29–36; spath-vallejo 118–130; reynolds 60, 531, 538, 542;
martinez 351, 373, 414, 512, 566, 696–699, 710, 725, 728, 760, 984, 1642, 1652, 1760, 1763, 1790,
1976, 2161, 2222, 2265–2288, 2321, 2328, 2360; mnst 48, 51, 70, 73; kessar-malle 25; ruhstorfer 16,
20, 33; sambale 312, 341–351, 483. All 60 agree with the README. (In §4.5 "glauberman line 543,
Theorem 4" points at part (c) of the theorem, whose heading is line 537 as the References say; the
line is inside the statement, so no change is asked.) Every cited work has a manifest entry (15
entries, 10 certified, 5 uncertified); no local path in `sources.toml`.

### 3. Adversarial pass (values computed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conjugation convention `(s·χ)(g) = χ(s⁻¹•g)` | `C₇ ⋊ C₃`, `r ↦ r²` | `s⁻¹•r = r⁴` (2·4 ≡ 1 mod 7); `inr s⁻¹·inl g·inr s = inl(s⁻¹•g)` from `inl_aut` | agrees with `char_conjFDRep` |
| 1.2 fixed classes | `Q₈ ⋊ C₃`; `C₂` on `S₃`; `C₂` swap on `C₂²`; `A₅` on `𝔽₇⁵`; route with `x y` | 2 = 2; 3 ≠ 2; coset `{(1,0),(0,1)}` no fixed point; constant vector `3c` since 5·3 ≡ 1 (7); `(xy)S(xy)⁻¹ = S`, `[xy,s] ∈ inl(X) ∩ inr(S) = 1` | sound; hypotheses needed |
| 1.3 permutation lemma | `C₂²` on `𝔽₂³` by `1+E₁₂`, `1+E₁₃` | fixed vectors per element 8,4,4,4; fixed characters 8,4,4,4; common 2 vs 4; orbits (8+4+4+4)/4 = 5 both | sound; cyclic hypothesis needed for the fixed-point form |
| 2.1 normalised extension | any field; `Q₈`, `A = C₂` by `i`; `r = 0` | `c` trivialised from `in + jr = 1`; final rescaling by `d^{-r'}`, `r r' ≡ 1 (n)`, no roots needed; `(cρ(i))² = 1 ⇒ c² = −1`, det `= −1`; `V = 0` gives `gcd(n,0) = n` | sound over every field; `V ≠ 0` and coprimality needed |
| 2.2 `existsUnique_canonicalExtension` | `SL(2,3)`; `S = 1`; `Γ = 1`; `S₃` | extensions `χ̂λ` have `det = λ^{χ(1)}` on `S`, trivial iff `λ = 1` as `gcd(χ(1),|S|) = 1`; `S = 1`: `ψ = χ`; `Γ = 1`: `ψ = 1_S`; `sgn` has det −1 | true, unique |
| 2.3 `canonicalExtension_values` | `SL(2,3)` | values 2, −2, 0, −1, −1, 1, 1; `ℚ(ζ₈) ∩ ℚ(ζ₃) = ℚ` | true |
| 2.4 `gallagher_bijOn` | `SL(2,3)` over `χ₂`; `N = G`; `N = 1`, `η = sgn`; `Z(Q₈)` | 3 ↔ 3; `{θ}`; permutation `1 ↔ sgn`; 1 vs 4 without an extension | true; both directions of `BijOn` |
| 3.2 sign | `SL(2,3)`; `C₂` on `C₅`; `A = 1` | `χ̂(a) = −1`, `χ̂(−a) = 1` ⇒ `ε = −1`, `λ = sgn`; `ε = 1`; `ε = 1` | sound |
| 3.3 | `C₃ × C₃` on `Q₈` | kernel element: `C_a = Q₈`, `ε = 1`; other: `η(a₁t)·1 = −sgn(t)` | sound |
| 3.4 | `SL(2,3)`; `3^{1+2}_+` with involution; `C₃ × C₅` | `(2sgn + sgn)/3 = sgn`; involution of det 1 on dim 3 has trace −1 so `ε = −1`, while `(3ω − ω)/2 = ω` forces `ε' = 1`, `θ₀(a) = −1`; `Γ = C₃·C₅` | sound; `ε'` vs `ε` distinction is needed at `|A| = 2` and stated |
| 4.1 | `C₁₅` on `Q₈ × C₁₁` | powers of 3 mod 11: 3, 9, 5, 4, 1; `gcd(15, 88) = 1`; both series give `χ₂ × 1` | sound |
| 4.2 / `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; `3^{1+2}`, `p = 2`; `S = 1` | multiplicity 2 ≡ −1 (3); 3 ≡ 1 (2); `C = Γ`, multiplicity 1 | true |
| 4.4 `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `3^{1+2}`; `C₇ ⋊ C₃` with `r ↦ r⁻¹`; `C₇` | 2=2=2; 3=3=3; `α(srs⁻¹) = r⁻² = α(r²)`, `C = C₃`, classes 5 with 2 swapped: 3=3=3; 1=1=1 | true |
| 4.5 `IsGlaubermanFamily`, `exists_…`, `apply_eq` | `T = ⊥`, `T = S`, `S = C₆`; swap on `C₃²`; swap on `C₂²`; wrong models | `π(Γ,1) = id` forced by law 2 (pairing ≠ 0 between irreducibles); uniqueness by induction through `T` of prime index: `π(C_Γ(T), S/T)` fixed by law 2 and the `p`-group theorem; `(ψ_a×ψ_a)* = ψ_{2a}`; non-coprime: two characters restrict to `1` | satisfiable, and laws exclude restriction, the zero map and any other bijection |
| 4.6 `restrict_pairing_ne_zero`, `adjoin_range_eq` | swap on `C₃²` with inversion and `j = 2`; `SL(2,3)` | `ψ_{−2a} = ψ_{2a}∘α⁻¹`; `ψ_{4a} = ψ_a`; `[χ₂|_C, sgn] = 2` | true; not one step from the definition for non-`p`-groups |
| `exists_sign_of_isCyclic` | `SL(2,3)`; `S = 1` | `ψ(inr a·inl t) = −sgn(t)`; `a = 1`, `ε = 1` | true |
| 5.1 `index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}`; `θ = 1` | 4·1 = 2·2; 9·1 = 3·3; reverse fails | true |
| 6.2 `brauer_height` | `S₃` p=2; `A₅` p=2; `SL(2,3)` p=3; `C₃` over `ℤ₂`; `G = 1`; `p ∤ |G|` | `a−d` = 0, 1; 0 and 2; 0 and 1; non-splitting: degree 2 with `a − d = 0` (hypothesis `hζ` excludes it); `p⁰ ∣ 1`; `a = d = 0` | true; subtraction never truncates (`D ≤ G`) |
| `IsBlockDefectGroup`, `blockCharacters` | `S₃`, `p = 2`, `e = r + r²` and `1 + r + r²` | `P = 1`: coefficient at `r` ≠ 0, and on `C(⟨t⟩) = {1,t}` coefficients 0,0 ⇒ defect group 1; `1 + r + r²`: coefficient 1 at `1 ∈ C(⟨t⟩)` ⇒ `⟨t⟩` | agrees with base `IsDefectGroup` (Brauer projection ≠ 0 iff a coefficient on `C_G(P)` ≠ 0) |
| 6.4 | `A₅`, `SL(2,3)` p=3, `S₃` | 4 and 4; 3; 2 = 2 | sound |
| 7.3 domination | `S₃/C₃` p=2, p=3; `S₃ × C₂` | `π(1+r+r²) = 3 = 1`, `π(r+r²) = 2 = 0`; `1 = e₊ + e₋`; `π(Tr_D^G a) = |N : N∩D|·Tr(ā)` since `|DN : D| = |N : N∩D|` | sound |
| 7.4 `fongReynolds`, `existsUnique_fongReynolds` | `S₃`, `N = C₃`, p=2 and p=3; `S₄`, `V₄`, p=3 | `h(λ) = 0 = 1 − (1 − 0)`; `T = S₃` (stabiliser of the idempotent, not of `λ`); `|T| = 24/3 = 8`, two extensions, induced degree 3 | true; uniqueness because blocks partition `Irr(G)` and `Irr(B) ≠ ∅` |
| 7.6 | `S₄`, `V₄`, p=2 | index 24/4 = 6, even; defect group `D₈` | sound |
| 8.1 | `SL(2,3)` p=3, `χ₃` | values 3, 3, −1, 0, 0, 0, 0 | sound |
| 8.2 | `D₈`; `C₂ × C₃` | heights {0,1}; three blocks, heights 0 | sound |
| 8.3 `reynolds_heights` | `SL(2,3)` p=2; `A₄`; `D × H` | degrees 1,1,1,2,2,2,3 with `a = d = 3`: heights {0,1} = {ν(1), ν(2)}; {0}; `ν(ξ(1))`. Every `ξ ∈ Irr(D)` occurs: `Irr(b) = {θ_ξ}` and `B` covers `b` | true as an equality of sets, both inclusions |
| 8.4 `reynolds` | `D = 1`; `D₈`; `A₄`; `SL(2,3)` | iff holds in each: abelian ⇔ all `ξ` linear ⇔ all heights 0 | true, both directions |
| Conventions: valuations | `p = 2` | `ν_p(0) = 0` but `0 ∈ m`; `ν_p(3/2) = −1`; `ν_p(2/3) = 1` | junk value flagged in the text |
| Conventions: places | `C₇ × C₂`; `S₃`; `ζ₆` | 2 has order 3 mod 7 ⇒ 6/3 = 2 places, `𝔽₈`; one place, `𝔽₄`; `−ζ₃² = e^{iπ/3}` | sound |
| 6.3 changes of level | `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅` | `ℚ₂(i)` residue `𝔽₂`, `ℚ₂(ζ₁₂)` residue `𝔽₄`; orders of 2 mod 3 and 15: 2 and 4 | sound |

Context and binders: the file has no `variable` block; every hypothesis is in each signature. I
compared the 20 elaborated types of `scratch/signatures.md` with the README statements: all
agree, nothing lost. README generality equals the Lean's in each of the 16 theorems.

### 4. Duplication and ownership

- Pinned Tau Ceti searched for `Glauberman`, `Gallagher`, `permutation lemma`, `canonical
  extension`, `defect group`, `Fong`, `height zero`: no declaration of these objects. The 20
  entries of `scratch/library-matches.md` read: no library statement proves a target.
- Library names opened at the pins (all exist as cited): Tau Ceti
  `RepresentationTheory/CharacterTable/Table.lean` 114, 123, 181, 337, 585; `Pairing.lean` 48 (the
  pairing is `|G|⁻¹ Σ f₁(g) f₂(g⁻¹)`, as the README says); `Induction/ClassFunction.lean` 194
  (`Subgroup.indClassFun`, `[S.FiniteIndex]`, coset sum, no division);
  `RingTheory/Idempotents/Primitive/Basic.lean` 89; `Induction/Inertia.lean` 94–111;
  `Clifford/Dimension.lean` 113, 142; `Clifford/Decomposition.lean` 305; `Clifford/Basic.lean`
  327; `Clifford/Obstruction.lean` 87, 162, 304; `TensorFactorization.lean` 108, 329;
  `ProjectiveCorrespondence.lean` 149, 223; `CentralCharacter.lean` 89, 162, 180; `Degree.lean`
  117; the remaining 15 names of the Scope list likewise. Mathlib
  `GroupTheory/SchurZassenhaus.lean` 277 (existence only; the file has no conjugacy statement),
  `Algebra/Group/Action/Basic.lean` 103 (`arrowAction`, a `def`),
  `GroupTheory/SemidirectProduct.lean` 138, 175, `GroupTheory/GroupAction/OfQuotient.lean` 62,
  `GroupTheory/Subgroup/Centralizer.lean` 177, 186,
  `NumberTheory/RamificationInertia/Galois.lean` 127, `FieldTheory/Galois/IsGaloisGroup.lean` 58,
  `RepresentationTheory/Induced.lean` 155, `RepresentationTheory/Character.lean` 102,
  `GroupTheory/Solvable.lean` 145–150 (`IsSolvable` is an alias of `Group.IsSolvable`),
  `Data/ZMod/Basic.lean` 889, `RingTheory/RootsOfUnity/PrimitiveRoots.lean` 791.
- Roadmaps: `roadmaps grep` for `Fong.Reynolds` and `Alperin.McKay`: no roadmap on main or open;
  `Gallagher`: only analytic number theory; `Brauer's permutation lemma`: FiniteGroupInvariants
  §6.2, the Galois form, which the Scope names as not owned (§1.3 is the automorphism form).
- `scratch/overlaps.md`: no dropped id, no open revision, no second copy, no conflicting head.
- Coprime action: LocalFiniteGroupTheory L3 (open) states Glauberman's lemma and the fixed coset
  modulo a normal subgroup. It is excluded as a supplier, so §1.2 proves its three class and
  coset statements from IG.3.4, the earliest citable owner of the conjugacy of complements; see
  the note for the human reviewers.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem,
LocalFiniteGroupTheory, FiniteGroupInvariants (open) and CharacterTheory, InductionRestriction,
FiniteGroupExtensionSplitting (main); defect groups, blocks, covering, `p`-subgroup domination:
owner ModularCharactersAndBlocks (cited); Galois-form permutation lemma: owner
FiniteGroupInvariants §6.2 (named as not owned); projective tensor factorisation: owner
InductionRestriction Layer 7 (cited); conjugacy of coprime complements: owner
InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (cited); fixed points of coprime actions:
also in LocalFiniteGroupTheory L3, not citable; nothing else shared.

### 5. Supplier order

Dependency check output: `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD or CYCLE
line. Citations resolved now: base Conventions and §§0.2–8.2 at its open head, including
`existsUnique_blockIdempotent_map_residue`, `IsDefectGroup`, `isDefectGroup_conj`,
`isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `brauer_first_main`, `SameBlock`,
`exists_blockIdempotent_iff_centralCharacter_congr` (each declared in its `Suggested.lean`); I read
base §6.2 (the scalar extension, defect classes, the Brauer-projection form), §6.3, §7.1, §7.2
(the Brauer-pair form is stated there) and §8.1 against what this README says of them: faithful.
CharacterTheory §§2.1, 3.5, 3.6, 4.3, 4.4, 4.5 and InductionRestriction Layers 1, 2, 5, 7 exist on
main under those numbers; IG.3.4 holds the target *Conjugacy of coprime complements* with the
hypothesis "`N` or `G/N` solvable" and conjugacy by an element of `N`, as used.

Declared gap `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and in the
README under the InductionRestriction subsection; the `needs` sentence is one statement with its
hypotheses; minimal (InductionRestriction Layer 7 has no divisibility statement, and
`FDRep.clifford_restrict_dvd_finrank` gives `[G : inertia V] ∣ dim W / (e dim V)`, not
`e ∣ |G : N|`). Not a finding.

### 6. Shape, and the Lean form

README shape as required (Summary, Scope, Conventions, contracts, build, nine layers each ending
in Examples and Dependencies, consumers, references). Every definition has at least three
Checks (1.1: 3, 2.2: 3, 4.1: 3, 4.5: 4, 5.2: 3, 6.3: 7, 7.3: 4, 7.5: 3, 9.1: 4, 9.2: 3). No LaTeX
delimiters, no process words, pull-request numbers, dates, anchors or machine paths (searched).
Layer order: 3 needs 2 (§3.2 needs §§2.2–2.4), 4 needs 3 (§4.1 needs §3.2), 7 needs 6, 8 needs 7;
the order is forced.

Elaboration: `lake env lean` on `packages/ModularCharactersAndBlocksPartII/Suggested.lean` from
the content checkout: exit 0, 16 warnings, all `declaration uses sorry`, nothing else. Header:
`module`, `import Mathlib`, three `TauCeti.*` modules, each used (`irreducibleCharacters`,
`Subgroup.indClassFun`, `IsPrimitiveIdempotent`). One module docstring, one namespace, layer
comments in README order, a docstring on each of the 20 declarations, `theorem` only, four
definitions with real bodies. All 20 own names backticked in the README are declared; all 20
declared names appear in the README.

### 7. Headlines and padding

Headlines of the Summary's end-theorem paragraph (16), each stated: canonical extension, its
values, Gallagher, the `p`-group characterisation, the count, existence, uniqueness, the cyclic
sign, constituent, field of values, degree bound, Brauer's theorem on heights, Fong–Reynolds
(two statements), Reynolds' height formula, Reynolds' theorem. The docstring names the three
cited propositions (degree-divisibility, height zero, Alperin–McKay) as definitions not stated.
One-tactic probe on a scratch copy, every `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | trivial | simp with the four definitions unfolded | aesop`:
16 errors, one per theorem; none closes. No declaration restates a definition, mirrors a Check or
treats a boundary case.

### 8. Copyright and arrangement

Wording compared at every sampled locator and at ten further passages (§2.1 route against
glauberman 107–130; §3.1 route against 273–286; §3.4 against 375–387; §6.3 definition against
martinez 718–726; §7.3 definition and route against 1897–1927; §7.2 against 1652–1653; §8.3 route
against reynolds 534–540; Conventions' covering against sambale 483; §5.2 against geck 29–30; the
`IsBlockDefectGroup` docstring against sambale 350–351). No sentence is reproduced; the longest
shared run is a formula or a standard name. The proof sketches keep the mathematics and some
letters of formulas (`S(a)`, `c(a,b)`), not the prose. No table, figure or exercise list is taken
over. No public formalisation of these statements is known to me.

Arrangement against martinez (table of contents at martinez lines 24–64): Layer 6 draws on
Lectures 2.1, 2.2, 3.2; Layer 7 on 3.1, 4.2, 7.1, 8.1, 7.2, 9.2, 9.1, 8.2 in that order; Layer 8
on 8.2, 9.3 and on Reynolds; Layer 9 on 9.3. No one-to-one run. Against glauberman: Layers 2, 3, 4
meet its §§2, 3, 4 in the same order, which the `*Needs:*` lines of §3.2 and §4.1 force; the
scopes differ (Lemma 3 and Brauer's lemma moved to Layer 1, Theorem 5 (e) to Layer 5, the general
Gallagher correspondence and the uniqueness of the family added).

Source independence: 25 passages compared with 9 sources, none shared; largest share martinez,
46 of 98 line locators; contents compared with martinez: independent.

## Not verifiable

- isaacs (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), navarro-1998 (Chapter 3,
  Theorem 5.9), navarro-2018 (Chapter 2), feit (Chapter IV), isaacs-1973: recorded as
  uncertified and settled; the texts were not read. Each is a second citation beside a locator
  that was read, except the uniqueness formulation of §4.5 (navarro-2018), whose proof route I
  checked directly (induction through a normal subgroup of prime index, table row 4.5).
- The truth of the cited classification-dependent theorems (kessar-malle, mnst, ruhstorfer,
  geck) beyond their statements at the cited lines.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (martinez line 725): the source says a
  character has height zero when the numerical defect equals the `p`-part of its degree; it should
  be when `p^{a − d(B)}` equals the `p`-part of its degree; affects nothing.

## For the human reviewers

- **Licence.** martinez (46 of 98 line locators) is unpublished course notes read from the
  author's university page; sambale is read from the author's page, the published book being
  Springer LNM 2127. Neither copy states a licence (`sources.toml`, `licence_class = "author-page"`).
- **Scope.** LocalFiniteGroupTheory L3 (open) states Glauberman's lemma and fixed cosets modulo a
  normal subgroup; README §1.2 (lines 528–555) proves the class and coset forms itself, since that
  roadmap is excluded as a supplier. Whether to cite it later is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "de9b4d74ca780950f73c11aed122a75957b3da2a", "job": "REV-PKG-ModularCharactersAndBlocksPartII", "model": "fable", "worker": "chris-x83"} -->
