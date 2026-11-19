# Review of ModularCharactersAndBlocksPartII (pull request #2411 at f198e03)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is about ownership, not about a statement: the ordinary characters of a block, the defect of a block and the Brauer correspondent are owned here and also by the open revision of the base roadmap (pull request #2534), with the same definition of `blockCharacters` in both Lean files. The mathematics of the new §2.5 (the three degree divisibilities) and of every sampled target and headline was recomputed and holds. There are two small corrections, both to the pull request's description, and one format note. Three points are left for the human reviewers.

## Previous findings

- The previous review, at `0c072e1`, raised no finding, so there is nothing to account for finding by finding. Its one deferred finding is below.

## R01 (P2) — The ordinary characters of a block, the defect of a block and the Brauer correspondent have two owners: this roadmap and the open revision of ModularCharactersAndBlocks.

An implementer who formalises `blockCharacters` cannot tell which roadmap's target it is, and when both pull requests merge the library plan has the same three notions planned twice, under two namespaces.

The scope section here (README lines 1593–1595) lists as owned "the ordinary characters of a block at any `p`-modular system (`blockCharacters`), the defect of a block and the Brauer correspondent `B ↦ b'` as a map", and §6.1 (line 860), §6.3 (line 1015) and §6.4 (line 1105) each say "define". Pull request #2534, which revises the base on main, says in `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md`, lines 1385–1390, that the base owns "the ordinary characters of a block at any `p`-modular system (`blockCharacters`, §4.2)", "the defect of a block (`blockDefect`, §6.2)" and "the Brauer correspondent (`brauerCorrespondent`, §6.2)". Its `Suggested.lean` declares `blockCharacters` at line 266 with a body that is word for word the body at line 240 here, and `blockDefect` and `brauerCorrespondent` at lines 325 and 338. The base on main has none of the three, so the collision is with the revision only.

The base is earlier in the merge order, so it is the owner. The smallest change follows what this README already does for `IsDefectGroup`: in the scope section say that `blockCharacters`, the defect and the Brauer correspondent are the base's (its §4.2 and §6.2 as revised), restated in `Suggested.lean` because that file imports only the libraries, and not second notions; in §§6.1, 6.3 and 6.4 replace "define" by the citation; and name the base's revision in the description as a pull request that merges first. The statements about these objects that the base's revision does not make (independence of the choice of defect group for heights, the conjugate correspondent, the instances of §6.4) stay here as they are.

## Deferred findings

- D01 — resolved: the gap's `detail` in the board's plan now reads that the index of a central subgroup is divisible by the degree; the README no longer uses the gap.

## C01 — The description still declares a supplier gap that the head no longer has.

The description says "One supplier gap is declared, `gap:clifford-multiplicity-dvd-index`: InductionRestriction Layer 7 is to prove that … the quotient `χ(1)/θ(1)` is a natural number dividing `|G : N|`". At this head the README declares no gap: §2.5 (c) (lines 426–455) plans that divisibility itself, with the divisibility `χ(1) ∣ |H : Z|` for a central subgroup and Schur's divisibility for projective representations as (a) and (b), and the InductionRestriction contract (lines 1915–1919) says that roadmap "states no degree divisibility" and that §2.5 derives it. A reader of the description would wait for InductionRestriction to supply something this roadmap now owns.

The text that would be right: "No supplier gap is declared. §2.5 proves, from InductionRestriction Layers 5 and 7 and the pinned Tau Ceti, that `χ(1)/θ(1)` divides `|G : N|` (Isaacs, Corollary 11.29), together with `χ(1) ∣ |H : Z|` for a central subgroup `Z` (Isaacs, Theorem 3.12) and Schur's divisibility for irreducible projective representations; §8.3 uses it." The first paragraph's list of what the coprime strand builds would also name these three.

## C02 — The description calls two suppliers "still open" that are on main.

The description says "Still open, and in the merge order below: ModularCharactersAndBlocks (…) and InverseGaloisAndArithmeticFundamentalGroups (IG.3.4 …)". Both folders are on main (`TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks` and `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups`), and every section the README cites from them resolves there. The sentence would read "On main: ModularCharactersAndBlocks (…), InverseGaloisAndArithmeticFundamentalGroups (IG.3.4 …), RepresentationTheory/CharacterTheory … and RepresentationTheory/InductionRestriction …"; after R01 the only open pull request it depends on is the base's revision.

## N01 — The page of Glauberman's Lemma 3.

§1.2 (line 234) and the reference list give "Lemma 3 (a)–(c), p. 1471"; the lemma opens at the foot of p. 1471 and its parts (a)–(c) are printed on p. 1472 (glauberman lines 287–296). "pp. 1471–1472" would be exact.

## Questions for the author

- The base's revision (pull request #2534, its §4.2) states the block partition, `e_B = Σ e_χ` and a linkage criterion "for every splitting system, with no place chosen". Does that make part of the change of system of §6.1 here (the bullet at lines 881–903, for `Irr(1 ⊗ B) = Irr(B)`) a consequence of the base once the revision merges? I could not settle it: the revision is not on main and its text may still change.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.3 permutation lemma | `C₂ × C₂` on `𝔽₂³`, `a = 1 + E₁₂`, `b = 1 + E₁₃` | group fixes `2` vectors, `4` characters; `a`, `b`, `ab` each `4` and `4`; orbits `(8+4+4+4)/4 = 5` both | per-element form holds; whole-group count differs as stated | none |
| §2.2, `existsUnique_canonicalExtension` | `SL(2,3)`; `S₃ = C₃ ⋊ C₂`; `S = 1` | `det(χ̂λ) = λ² ≠ 1` on `S`; `1` has det `1`, `sgn` has `−1`; `ψ = χ` | unique | none |
| §2.3, `canonicalExtension_values` | `SL(2,3)`; trivial `C₂` on `C₃` | values `2, −2, 0, −1, 1 ∈ ℤ`; `χ̂ω` gives `−ω ∉ ℤ`; `ℚ(ζ₃) = ℚ(ζ₃)` | holds | none |
| §2.4, `gallagher_bijOn` | `Q₈`, `N = Z`, `θ` faithful; `C₂`, `N = 1`, `η = sgn` | no extension: `1` character over `θ` against `4`; map swaps `1, sgn` | holds; hypothesis needed | none |
| §2.5 (a) `χ(1) ∣ |H : Z|` | route with `Z_m`; `SL(2,3)`, `Z = {±1}`; `S₃`, `⟨t⟩` | `|H^m/Z_m| = |H : Z|^m |Z|`, so `m·v(χ(1)) ≤ m·v(|H:Z|) + v(|Z|)`; `1,2,3 ∣ 12`, `9 ∤ 12`; `2 ∤ 3` | holds; centrality needed | none |
| §2.5 (b) Schur | `C₂ × C₂`, `diag(1,−1)` and swap; `3 ·` trivial of `C₂` | `swap · diag(1,−1) · swap = −diag(1,−1)`, irreducible, `2 ∣ 4`; `3 ∤ 2` | holds; irreducibility needed | none |
| §2.5 (c) `χ(1)/θ(1) ∣ |G : N|` | `SL(2,3)`, `Q₈`; `Q₈`, `Z`; `N = G`; `N = 1` | `|G:T|·dim M`: `3 ∣ 3`, `1 ∣ 3`; `2 ∣ 4` with `T = Q₈`; `1 ∣ 1`; `χ(1) ∣ |G|` | holds | none |
| §3.2 cyclic correspondence | `SL(2,3)`, generators `a`, `a²`; `A = 1` | eigenvalues `ω, ω²`: `χ̂(a) = −1`; `−ω, −ω²`: `χ̂(−a) = 1`; `ε = −1`, `sgn`; `ε = 1` | holds | none |
| §3.4 restriction formulas | `C₄` on `3^{1+2}_+`, `a(x,y,z) = (−y, x, z − xy)`; `C₂`, `B = 1` | both sides `z + z' − xy − x'y − x'y'`; `a² = (−x,−y,z)`; eigenvalues `i, −i, 1`; `ε' = −1`, `θ₀(a) = −1`; `(3ω+ω)/4 = ω` | holds | none |
| §4.3 independence of the series | `C₁₅` on `Q₈ × C₁₁` | `3` has order `5` mod `11`; `sgn ↦ sgn × 1 ↦ χ₂ × 1` and `sgn ↦ χ₂ ↦ χ₂ × 1` | agree | none |
| §4.4, `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `C₂` on `C₇ ⋊ C₃` | `2 = 2 = 2`; three linear fixed, degree-3 pair swapped, classes `1, s, s²` fixed: `3 = 3 = 3` | holds | none |
| §4.5, `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; swap on `C₃ × C₃`; `S = 1` | `[χ₂|_C, sgn] = 2 ≡ −1`, `[χ₂|_C, 1] = 0`; multiplicity `1` at `ψ_{2a}`; `m = 1` | holds | none |
| `IsGlaubermanFamily`, `exists_isGlaubermanFamily`, `apply_eq` | `S = 1`; `T = S`; `C₆` through `C₃` | multiplicity law forces `π(Γ,1)χ = χ`; `π(C,1) = id`; factors fixed at `p = 3` and `p = 2` | laws determine the family | none |
| `exists_sign_of_isCyclic` | `SL(2,3)`; `S = 1`, `a = 1` | `ψ(a) = −1 = −sgn(1)`, `ψ(−a) = 1 = −sgn(−1)`; `ψ(t) = χ(t)`, `ε = 1` | holds | none |
| §4.6, `restrict_pairing_ne_zero`, `adjoin_range_eq` | `SL(2,3)`; swap on `C₃ × C₃` | `2·1 + (−2)(−1) = 4 ≠ 0`, `ℚ = ℚ`; both fields `ℚ(ζ₃)` | holds | none |
| §5.1, `index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+`; `θ = 1`, `C ≠ Γ` | `4·1 = 2·2`; `9·1 = 3·3`; reverse `|Γ:C| ∤ 1` | holds | none |
| §5.2 degree-divisibility | `SL(2,3)`; abelian `Γ` | `1 ∣ 2`, variant `2 ∤ 1`; `1 ∣ 1` | predicate as cited (geck line 30) | none |
| §6.1 `IsDefectGroup` | `S₃`, `p = 2`; `S₄`, `p = 3`, `χ₃` | `⟨t⟩` passes, `1` fails maximality; coefficients `0, 2, 1, 0, 1`, `λ = 4 − 1 − 2 = 1`, zero on `⟨(123)⟩`: defect group `1` | equals the base's `Br_P(e) ≠ 0` form | none |
| §6.1 `blockCharacters` | `(1+r+r²)/3`, `(2−r−r²)/3`, `0` over `ℤ₂[ζ₃]` | `{1, sgn}` (`1+ζ₃+ζ₃² = 0` on `std`); `{std}` (`3/3`); empty | holds; same body as in #2534 | R01 |
| §6.2, `brauer_height` | `S₃`, `p = 2`; `A₅`, `p = 2`; `C₃` over `ℤ₂` | `a−d = 0`, degrees `1,1`; `a−d = 1`, `2 ∣ 2`; degrees `1,3,3,5`, `4 ∣ 4`; non-split degree `2`, `ν = 1 ≠ 0` | holds; splitting needed | none |
| §§6.3, 6.4 defect, Brauer correspondent | `S₃`, `p = 2`; `SL(2,3)`, `p = 2` | `Br_{⟨t⟩}(1+r+r²) = 1`, `Br_{⟨t⟩}(r+r²) = 0`; heights `0,0,0,1,1,1,0` | holds | R01 |
| §7.2 covering | `S₃`, `N = C₃`, `p = 2` | `ω_std = 2·(−1)/2 = −1 = ζ₃ + ζ₃² = ω_λ` on `{r, r²}` | holds | none |
| §7.3 domination | `S₃ → C₂`, `p = 2, 3`; `S₃ × C₂` | `π = 3 = 1` and `2 = 0`; `1 = e₊ + e₋`; images `1`, `0`, defect group `C₂ = DN/N` | holds | none |
| §7.4, `fongReynolds`, `existsUnique_fongReynolds` | `S₃`, `C₃`, `p = 2`; `p = 3`; `S₄`, `V₄`, `p = 3` | `T = C₃`, `h = 0 = 1 − (1 − 0)`; `T = S₃`, inertia model gives `1 + sgn`; `T = D₈`, degree `3·1`, `ν₃ = 1 = a − d` | holds | none |
| §8.3, `reynolds_heights` | `SL(2,3)`, `p = 2`; `A₄`; `D = 1` | `{0,1} = {ν(1), ν(2)}`, `ψ(1)/θ(1) = 3` prime to `2`; `{0} = {0}`; `{0} = {ν(1)}` | holds | none |
| §8.4, `reynolds` | `D₈`; `A₄`, `p = 2`; defect zero | height `1`, nonabelian; degrees `1,1,1,3` all height `0`, `V₄` abelian; `D = 1` | holds both ways | none |
| Conventions, the system not at a place | localisation of `ℤ₂[ζ₃][T]` at `(2)`, completed | uniformiser `2`, residue field `𝔽₄(T)`, `−ζ₃²` of order `6 = exp(S₃)` | a splitting system | none |

- Source locators checked against the cached texts: 69 (glauberman 18, martinez 33, reynolds 6, sambale 6, hartley-turull 3, späth-vallejo 1, geck 1, mnst 1), covering the 15 sampled targets; all at the stated page except the one of N01.
- Library declarations opened at the pins: 34, among them `TauCeti.IsProjectiveRep.exists_commonExtension_linearization` (`ProjectiveRepresentation/CommonExtension.lean:92`), `TauCeti.projectiveLiftingFactorSet_ker_le_center` (`:75`), `isProjectiveRep_homAction` (`Induction/Clifford/TensorFactorization.lean:248`), `FDRep.clifford_restrict_dvd_finrank` (`Induction/Clifford/Dimension.lean:113`), `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean:155`). The pinned Tau Ceti has no divisibility of a degree by the index of a central subgroup or by `|G : N|`.
- Cross-roadmap citations resolved on main: the base's Conventions, its cited sections and its six named declarations; IG.3.4 *Conjugacy of coprime complements*; CharacterTheory §§2.1, 3.5, 3.6, 4.1, 4.3–4.5; InductionRestriction Layers 1, 2, 5, 7; FiniteGroupInvariants §6.2. No cited id is dropped by an open pull request.
- Declared gap `clifford-multiplicity-dvd-index`: not used by this head (§2.5 (c) plans the statement), so nothing here is conditional on it.
- Automatic checks at this head: all passed. Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. No file changed outside the folder.
- `lake env lean` on `Suggested.lean`: 16 `sorry` warnings and nothing else. `#check @name` printed all 20 types; the file has no `variable` line, so each declaration carries its own binders, and each type agrees with its README statement.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a scratch copy: 0 of 16 theorems close. All 16 README headlines are stated; the three predicates left out are named in the module docstring.

Overlap check: read ModularCharactersAndBlocks (main and its open revision #2534), GlaubermanZStar, LocalFiniteGroupTheory, OddOrderTheorem, CharacterTheory, InductionRestriction, FiniteGroupInvariants. `blockCharacters`, the defect of a block and the Brauer correspondent are shared with the base's revision, owner the base (R01). Blocks, defect groups, covering and domination by normal `p`-subgroups: the base (cited). The Galois permutation lemma: FiniteGroupInvariants §6.2 (cited; §1.3 is the automorphism form). The tensor factorisation: InductionRestriction Layer 7 (cited). OddOrderTheorem §1.1 states the image of `C_G(A)` in `G/N` for solvable `G` and normal `N`; §1.2 here is the coset form for any invariant subgroup, with `S` or `Γ` solvable, a different statement. Glauberman's lemma is shared with LocalFiniteGroupTheory, which may not be cited: see the human reviewers' section.

Source independence: 24 passages compared with 3 sources (glauberman, martinez, reynolds), none shared; largest share martinez, 41 of 103 locators; contents compared with martinez: independent (Layer 6 draws on its Lectures 2 and 3, Layer 7 on Lectures 3, 4, 7, 8, 9, Layer 8 on Lectures 8 and 9, not in one run). Layers 2–4 share the order of glauberman §§2–4, forced by the *Needs* lines of §3.2 (§§2.2–2.4) and §4.1 (§§2.2, 3.2); Layer 2 also holds §2.5, which is not in that source.

Research link: Layer 9 states the height zero and Alperin–McKay conjectures, proved by Kessar–Malle 2013, Malle–Navarro–Schaeffer Fry–Tiep 2024 and Ruhstorfer 2025, as predicates with their normal-defect instances; §5.2 states the degree-divisibility of Hartley–Turull 1994 and Geck 2020. Rests on README §§5.2, 9.1–9.2, mnst line 55 and geck line 30.

## Not verifiable

- isaacs (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapters 11 and 13): uncertified, cited by locator only; the route of §2.5 was checked by computation instead.
- navarro-1998 (Chapter 3, Theorem 5.9), navarro-2018 (Chapter 2), feit (Chapter IV): uncertified, cited by locator only; each target they support also has a verified locator in a cached text.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (line 725): the source says height zero characters are those whose degree's `p`-part equals the numerical defect `d(B)`; it should be those whose degree's `p`-part equals `p^{a−d(B)}`; affects nothing.

## For the human reviewers

- Scope and licence: the largest share of locators (41 of 103) goes to martinez, unpublished course notes (Firenze 2024) read from the author's university page; the main results are also cited to reynolds, sambale and navarro-1998.
- The board's plan still lists `gap:clifford-multiplicity-dvd-index` against InductionRestriction Layer 7, while README §2.5 (c) now plans that statement. If the gap stays announced, InductionRestriction may plan a second copy.
- LocalFiniteGroupTheory (open, on the list of roadmaps never cited as suppliers) plans Glauberman's lemma (its README lines 18 and 192); §1.2 here states and proves the same lemma.
