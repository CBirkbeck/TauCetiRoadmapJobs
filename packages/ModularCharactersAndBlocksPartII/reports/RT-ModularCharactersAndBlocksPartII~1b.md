<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6899724613 -->
Red team round 1 pass b (claude) of 07ba40c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Three proof routes name the source's lemmas, or say "as in the source", instead of this roadmap's targets

   **Location.**
   - `packages/ModularCharactersAndBlocksPartII/README.md:813`: "and Lemma 2 turns the norm identity into `Σ_λ c(λ)² = 1`"
   - `README.md:851`: "Route: as in the source, from Lemma 2 and the orthogonality relations for `A × C`, with Lemma 3 (c) for the kernel statement."
   - `README.md:929`: "Route: as in the source, by induction on `|S|`, with §4.2 for prime-power order"

   **Claim.** The inputs of the routes of §3.2, §3.4 and §4.3 are named.

   **Witness.** "Lemma 2" and "Lemma 3 (c)" are Glauberman's numbers (glauberman line 266, line 287). No target of this README has those names; the roadmap's own statements are §3.1 and §1.2, which the three `*Needs:*` lines already list. "As in the source" states that the plan follows a source.

   **Repair.** Wording only; no statement, `*Needs:*` line or locator changes.
   - §3.2 (`README.md:813`): replace "and Lemma 2 turns the norm identity into" by "and §3.1 (every element of the coset `a Γ` is conjugate to some `a t` with `t ∈ C`, with centraliser `A · C_C(t)`) turns the norm identity into".
   - §3.4 (`README.md:851`): replace the sentence by "Route: for a faithful linear character `θ` of `A/B`, the class function `χ̂ − χ̂ θ` vanishes on `Γ ⋊ B` and has norm `2`; §3.1 identifies this norm with that of its restriction to `A × C`, so the restriction is a difference of two irreducible characters of `A × C` (CharacterTheory §3.6), which gives (a) and the integrality in (b); the kernel statement in (b) uses the coset statement of §1.2."
   - §4.3 (`README.md:929`): replace "Route: as in the source, by induction on `|S|`, with" by "Route: by induction on `|S|`, with".

   Tested on the refuting instance: after the edit, every input named in the three routes is a section of this README (§§1.2, 3.1, 3.2, 3.4, 4.1, 4.2, 2.2) or CharacterTheory §3.6, and each is in the `*Needs:*` line of its section. The §3.4 replacement was checked against glauberman lines 391–400 (the difference `η − ηθ`, zero on `GB`, of norm `2`, restricted to `AT` by Lemma 2).

2. **F02** (P3) The route of §2.1 tracks the proof of Glauberman's Theorem 1 symbol by symbol

   **Location.** `README.md:660–665`: "choose `S(a)` implementing the twist, so that `S(a) S(b) = c(a, b) S(a b)` … `d(a) = det S(a)`, `e(b) = Π_a c(a, b)` … `f(a) = d(a)^j e(a)^i` … scalars `h(a)`"

   **Claim.** The proof plan is in the roadmap's own words.

   **Witness.** glauberman lines 107–149: the same ten symbols (`S`, `c`, `d`, `e`, `r`, `n`, `i`, `j`, `f`, `h`) with the same meanings, in the same order of steps. No run of consecutive words is shared beyond the formulas. The formulas are forced; the lettering and the clause order are not.

   **Repair.** Replace the route (from "Route: choose `S(a)`" to "`h(a)^r = h(a)^n = 1`.") by:

   "Route: the operators implementing the twists form a projective representation of `A` on `V` whose factor set takes scalar values, by the scalar hypothesis. Taking determinants shows that the `dim V`-th power of the factor set is a coboundary; multiplying the cocycle identity over one argument shows the same for its `|A|`-th power. The two exponents are coprime, so the factor set is a coboundary and the operators rescale to a representation of `A`. Its determinant is a linear character of `A`, of order dividing `|A|`; rescaling by a suitable power of it, which exists by the same coprimality, makes every determinant `1`. Two normalised extensions differ by a homomorphism `A → Fˣ` whose values are both `dim V`-th and `|A|`-th roots of unity, hence trivial."

   Tested: with `r = dim V`, `n = |A|`, `i n + j r = 1`, the second rescaling is by `d'(a)^{−j}`, giving determinant `d'(a)^{1 − j r} = d'(a)^{i n} = 1`; for `Γ = 1`, `V = ℚ`, `A = C₂` (the first Check of §2.1) the factor set is trivial and the result is the trivial extension.

Two findings, both P3. Both files were read in full (`packages/ModularCharactersAndBlocksPartII/README.md`, 1780 lines; `packages/ModularCharactersAndBlocksPartII/Suggested.lean`, 344 lines). No Lean was run: the brief gives no elaboration command for this pass, so the signature check below is by reading the source and the worker's elaborated signatures.

## Verified sound

**Counts.** 20 declarations read (4 `def`, 16 `theorem`); 35 README targets read (§§1.1–9.2); 106 line locators in the README, every distinct one opened in the cached texts; 35 Check blocks, their numerical values recomputed (the main ones are in the table below); 4 supplier roadmaps resolved; 51 library declarations grepped at the pins and 8 more read in their files.

**Policy and form.**
- The pull request changes only `packages/ModularCharactersAndBlocksPartII/` (7 files in `git diff --stat origin/main...HEAD`).
- No `set_option`, no `lemma` declaration, no `#eval`/`#print`, no sorry'd data, no pull-request numbers or process words in the README or docstrings.
- Imports are `import Mathlib` and three `TauCeti.*` modules, all present at the pin and all used.
- Every target has a locator.

**Signatures.** `Suggested.lean` has no `variable` or `include` line, so every binder is in its own signature and none can be dropped. I compared all 20 with the worker's elaborated signatures (`signatures.md`, 0 dropped) and with their README statements; nothing changed.

**Headlines and padding.** The 16 end theorems listed at `README.md:24–34` are exactly the 16 theorems of `Suggested.lean`. The module docstring names the three propositions that are not stated (degree-divisibility, the height zero property, the Alperin–McKay property) and why. One-tactic probe: no declaration restates a definition, follows from one library lemma, mirrors a Check or treats a boundary case. The nearest is the first conjunct of `ncard_invariantIrreducibleCharacters`, which follows from `exists_isGlaubermanFamily` in a few steps; the second conjunct is independent content, so I do not call the declaration padding.

**Dependency check.** Output of the brief's `gate --depcheck` command: `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Suppliers, resolved at their current versions.**
- ModularCharactersAndBlocks (open head, `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`): all cited sections exist (Conventions, §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2). All seven cited names exist in its README and `Suggested.lean`: `existsUnique_blockIdempotent_map_residue`, `IsDefectGroup`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `brauer_first_main`, `exists_blockIdempotent_iff_centralCharacter_congr`, `SameBlock`.
- Statements attributed to the base that I read there and found as described: the splitting system (Conventions); the system at a place (§1.1); the radical base change (§2.3); integral surjectivity of the decomposition map and its compatibility with a change of splitting system (§2.4); `|G|_p ∣ Φ_φ(1)` (§3.1); defect classes, the scalar extension `k ⊆ k'`, and the Brauer-projection first main theorem over a splitting field (§6.2); block induction through central characters and `Br_P(e_B) = Σ e_b` (§7.1); the second main theorem at the system of §1.1 (§7.2); normal `p`-subgroups (§8.1); covering by orbit sums with Martínez Definition 7.3 and Theorem 7.7 (§8.2).
- CharacterTheory on main: §§2.1, 3.5, 3.6, 4.3, 4.4, 4.5 exist with the cited content; `fieldOfValues_eq_map_fixedField_stabilizer` and the `ULift`/`Shrink` adapter are in §§4.4–4.5.
- InductionRestriction on main: Layers 1, 2, 5, 7 exist with the cited titles; `IsUnit (Nat.card G : k)` is its stated hypothesis for reciprocity.
- InverseGaloisAndArithmeticFundamentalGroups (open head, earlier in the merge order): the target *Conjugacy of coprime complements* is in IG.3.4 with the hypotheses the README quotes (`N` or `G/N` solvable, conjugacy by an element of `N`).
- FiniteGroupInvariants §6.2 (named only as "not owned") exists and states the Galois-orbit form of Brauer's permutation lemma.

**Declared gap.** `gap:clifford-multiplicity-dvd-index` has the same slug in `design/plan.json` and at `README.md:149, 501, 1620, 1627, 1670`. Its `needs` sentence is precise. It is not already provided: InductionRestriction Layer 7 has no degree divisibility, and Tau Ceti's `FDRep.clifford_restrict_dvd_finrank` gives only `dim V ∣ dim W` and `[G : inertia V] ∣ dim W`.

**Ownership.** `roadmaps grep` over main and all open heads finds no other owner of the Glauberman correspondence, the canonical extension, Gallagher's correspondence in character form, the Fong–Reynolds correspondence, heights of characters or Reynolds' theorem. OddOrderTheorem §1.3 (later in the merge order) plans commutator and generation statements for coprime actions and none of §1.2 here. The pinned Tau Ceti and Mathlib have none of these objects. `IsBlockDefectGroup` is the base's `IsDefectGroup` rewritten with coefficients, which `README.md:256–259` says; a local definition is needed because the base is not importable.

**Library claims checked at the pin.**
- `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` is an instance in `Mathlib/GroupTheory/GroupAction/OfQuotient.lean`; the third law of `IsGlaubermanFamily` relies on it.
- `Representation.IsIrreducible` excludes the zero representation, so `blockCharacters 0 = ∅` as the README says.
- `TauCeti.irreducibleCharacters` is a `Set (G → k)` of characters on `Fin n → k`.
- `Subgroup.indClassFun` needs `[S.FiniteIndex]` and no division.
- `TauCeti.IsPrimitiveIdempotent` has the three fields the README lists.
- `arrowAction` is a `def` with `(g • F) a = F (g⁻¹ • a)`.
- `Rep.indResAdjunction`, `Ideal.exists_smul_eq_of_isGaloisGroup`, the instance `IsGaloisGroup G ℤ (𝓞 L)`, `Subgroup.exists_right_complement'_of_coprime`, `Subgroup.normalizerMonoidHom` and `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` exist in the files named.

**Narrowing noted, not raised.** §1.2 assumes `S` or `Γ` solvable, where glauberman line 287 states Lemma 3 for every coprime action. The unrestricted form needs the odd order theorem, whose roadmap is later in the merge order. No target here uses it: §§3.1–3.4 have cyclic `A`, Layer 4 has solvable `S`, and Layer 2 does not use §1.2.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `invariantIrreducibleCharacters`, convention `(s·χ)(g) = χ(s⁻¹•g)` | `C₃` on `C₇` by `r ↦ r²`; `C₃` on `Q₈`; `S = 1` | `2⁻¹ = 4 (mod 7)`, `(s·χ)(r) = ζ₇⁴` against `χ(s•r) = ζ₇²`; `Irr_S(Q₈) = {1, χ₂}`; `Irr_1(Γ) = Irr(Γ)` | fixed set is the same for both conventions; witness correct | none |
| `existsUnique_canonicalExtension` | `Γ = 1`; `S = 1`; `SL(2,3)`; `C₂` on `C₃` (`S₃`); non-coprime `Q₈`, `A = C₂` | `Γ = 1`: `ψ` linear with `ψ = det = 1` on `S`, unique. `S = 1`: `ψ = χ`. `SL(2,3)`: extensions `χ̂λ` have `det = λ²` on `C₃`, only `λ = 1`. `S₃`: `1`, not `sgn` (`det = −1`). `Q₈`: implementers `±√−1·ρ(i)`, `det = −1` | true; "trivial on `S`" ⇔ "order prime to `|S|`" checked (kernel contains the normal closure of `S`, quotient of order dividing `|Γ|`) | none |
| `canonicalExtension_values` | `SL(2,3)`; trivial action of `C₂` on `C₃` | values `2, −2, 0, −1, 1 ∈ ℤ`; `χ̂ω` takes `−ω`; `ℚ(χ̂) = ℚ(ζ₃) = ℚ(χ)`, `χ̂(s) = 1` | true | none |
| `gallagher_bijOn` | `N = G`; `N = 1`, `G = C₂`, `η = sgn`; `Z(Q₈) ≤ Q₈` (hypothesis fails) | `{θ} ↔ {1}`; `1 ↔ sgn` swapped; `1` member against `4` | true; extension hypothesis needed | none |
| §1.2 fixed classes | `Q₈ ⋊ C₃`; `C₂` on `S₃` (not coprime); `C₂` swap on `C₂²`; `A₅` on `𝔽₇⁵` and on `𝔽₅⁵` | `2 = 2`; `3 ≠ 2`; coset `{(1,0),(0,1)}` has no fixed point; `5⁻¹ = 3 (mod 7)` gives constant vector `3c`; over `𝔽₅`, `5c = 0 ≠ 1` | true with coprimality and solvability of one side | none |
| §1.3 permutation lemma | `C₂²` on `𝔽₂³` by `1+E₁₂`, `1+E₁₃` | fixed vectors `2`, fixed characters `4`; per element `4 = 4`; orbits `(8+4+4+4)/4 = 5` on both sides | true for one automorphism, false for the group count, as stated | none |
| `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `3^{1+2}_+ ⋊ C₂`; `(C₇ ⋊ C₃) ⋊ C₂`; `C₃` on `C₇` | `2=2=2`; `3=3=3` (9 linear characters, 1 fixed, plus 2 faithful; 3 central classes fixed, 8 others moved); `3=3=3`; `1=1=1` | true | none |
| §3.2 sign, `exists_sign_of_isCyclic` | `SL(2,3)`; `S = 1`; `Γ = 1`; `3^{1+2}_+`, `C₂` | `χ̂(a) = −1`, `χ̂(−a) = 1`: `ε = −1`, `χ* = sgn`. `S = 1`: `ε = 1`. `Γ = 1`: `ε = 1`. Involution of determinant `1` in dimension `3` with trace `±1`: trace `−1`, `ε = −1` | true; `inr a * inl t = inl t * inr a` for `t ∈ C` | none |
| §3.4 restriction formulas | `SL(2,3)`; `3^{1+2}_+`; `C₂` on `C₃ × C₅` | `(2 sgn + sgn)/3 = sgn`; `(3ω − ω)/2 = ω` (also `(3ω + ω)/2 = 2ω`: the sign is not unique, and none is claimed); `χ|_C = λ`, `Γ = C₃ · C₅` | agrees with glauberman lines 375–387 | none |
| `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; `3^{1+2}_+`, `p = 2`; `S = 1` | `[χ₂|_C, sgn] = 2 ≡ −1`, `[χ₂|_C, 1] = 0`; `3 ≡ 1 (mod 2)`; `m = 1` | true; `m = 0` excluded by `p ∣ 0` | none |
| `IsGlaubermanFamily`: do the laws fix `π`? | `S = 1`; `T = 1`; `T = S`; wrong model `π = ` any other bijection for `C₃` on `Q₈` | `S = 1` is a `p`-group for all `p`: `m ∈ {0,1}`, `p ∤ m` forces `π χ = χ`. `T = S`: `π(C,1) = id`. Swapping `1 ↔ sgn` gives `[χ₂|_C, 1] = 0`, divisible by `3`: excluded by law 2 | laws determine `π` on `Irr_S(Γ)`; induction stays in universes `u`, `v` (`↥T`, `S ⧸ T : Type v`, `C_Γ(T) : Type u`) | none |
| `restrict_pairing_ne_zero`, `adjoin_range_eq`, `index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+`; swap on `C₃²`; `θ = 1`, `C ≠ Γ` | `[χ₂|_C, sgn] = 2`; `ℚ = ℚ`; `2 ∣ 4·1`; `3 ∣ 9·1`; `(ψ_a × ψ_a)* = ψ_{2a}`; reverse divisibility `|Γ:C| ∤ 1` fails | true; (e) is glauberman line 644 | none |
| `IsBlockDefectGroup` | `S₃`, `p = 2`, `e = 1+r+r²` and `e = r+r²`; `S₄`, `p = 3`, `χ₃` | `⟨t⟩` passes, `1` fails maximality; coefficients at `1, t` are `0, 0`, defect group `1`; `3/8, 1/8, −1/8, 0, −1/8 ↦ 0, 2, 1, 0, 1`, zero on `⟨(123)⟩`, control `2·2 − 1 − 2 = 1` | equals base `IsDefectGroup` on these | none |
| `blockCharacters` | `S₃` over `ℤ₂[ζ₃]`; `b = 1`; `b = 0`; `C₃` over `ℤ₂` | `(1+1+1)/3 = 1` on `1, sgn`, `1 + ζ₃ + ζ₃² = 0` on `std`; all; `∅`; one character `2, −1, −1` | as stated | none |
| `brauer_height` | `S₃`, `p = 2`; `A₅`, `p = 2`; `SL(2,3)`, `p = 3`; `C₃` over `ℤ₂` (no `ζ₃`) | `a − d = 0`, degrees `1, 1`; `a − d = 1`, `2 ∣ 2`; `1, 3, 3, 5` with `a = d = 2`; `ν₃(2) = 0`; without splitting, degree `2`, `ν₂ = 1 ≠ 0` | true; `hζ` is needed and present | none |
| `fongReynolds`, `existsUnique_fongReynolds` | `S₃ ⊵ C₃`, `p = 2`, `b = {λ}`; `T = G`; `S₃ ⊵ C₃`, `p = 3`; `S₄ ⊵ V₄`, `p = 3` | `T = C₃`, `λ^G = std`, heights `0 = 1 − (1 − 0)`; identity; `T = S₃` (stabiliser of the idempotent, not of `λ`); `T = D₈`, two extensions induce to the two degree-`3` characters, defect zero both sides | true; `hT` is the idempotent stabiliser | none |
| `reynolds_heights`, `reynolds` | `SL(2,3)`, `p = 2`; `A₄`, `p = 2`; `D₈`; `D = 1` | heights `{0,1} = {ν(1), ν(2)}`; `{0}`; `{0,1}`, nonabelian; `{0}` | true; truncated subtraction never truncates (`ν(n) ≥ a − d` by `brauer_height`) | none |
| §7.3 domination, transfer of traces | `S₃ → C₂`, `p = 2` and `p = 3`; `S₃ × C₂ → C₂` | `π(1+r+r²) = 1`, `π(r+r²) = 0`; `π(1) = e₊ + e₋`; fibre size `|DN : D| = |N : N ∩ D|` | true | none |
| §8.2 route (the roadmap's own, replacing an omitted proof in the source) | general `G = P C_G(P)` | a `p`-regular class meets `xP` only in `x` (`x` centralises `P`, so `xu` has `p`-part `u`); `[χ,χ] = d² ξ(1)⁻² |P| |G/P| / |G| = d²/ξ(1)²`, so `d = ξ(1)`; `Φ_{θ⁰}(u) = θ(1) Σ ξ_χ(1) ξ_χ(u) = 0` for `u ≠ 1` | each step holds | none |
| §8.3 height formula | general; `SL(2,3)`, `p = 2` | `h(χ) = ν(ψ(1)/θ_ξ(1)) + ν(ξ(1))`, first term `0` by the gap since `p ∤ |T : N|`; `N = Q₈`, `|T : N| = 3` | true given the declared gap | none |
| Valuation convention | `p = 2`: `0`, `3/2`, `2/3` | `0 ∈ m` with `ν_p(0) = 0`; `ν_p(3/2) = −1`; `ν_p(2/3) = 1` | clause "`q = 0` or `ν_p(q) > 0`" is needed and present | none |
| Change of place and level | `C₇ × C₂`; `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅` | `2` has order `3` mod `7`: `2` places, `k = 𝔽₈`, `ζ₇ ↦ ζ₇³` swaps them; `ℚ₂(i)`, `𝔽₂ ⊆ 𝔽₄`; order of `2` mod `3` and mod `15` is `2` and `4`: `𝔽₄ ⊆ 𝔽₁₆` | as stated | none |

## Not verifiable

- The locators into `isaacs` (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2) and `feit` (Chapter IV): the manifest records these texts as uncertified, so they were not read. The statements they are cited for are standard and consistent with what `martinez` and `glauberman` attribute to them.
- Whether the theorem numbers of the arXiv versions of `kessar-malle`, `mnst` and `ruhstorfer` agree with the Annals versions the References name: only the arXiv texts are cached. The manifest's `version_note` records which version was read.
- Elaboration of `Suggested.lean`: not run in this pass. I relied on the worker's elaborated signatures.

## Source issues

- **Misprint** in martinez at §3.2, printed p. 18 (line 725): the source says height zero characters are those whose degree `p`-part equals the numerical defect `d(B)`; it should be those whose degree `p`-part equals `p^{a−d(B)}`; affects nothing.
- **Misprint** in martinez at §3.2, printed p. 18 (line 722): the source says the height is defined for every character in `Irr(G)`; it should be for every character in `Irr(B)`; affects nothing.
- **Misprint** in martinez at Theorem 9.8, proof, printed p. 61 (line 2337): the source says the heights in `B` coincide with "the set of characters in `b`"; it should be the set of heights of characters in `b`; affects nothing.
- **Gap** in martinez at Proposition 8.9, printed p. 54 (line 2003): the source says the proof of this refinement of Theorem 8.5 is omitted; it should be proved or cited, since the proof of Theorem 8.11 uses it at lines 2031 and 2118; affects the proof.

## Copyright, licences and scope

**Wording.** Besides the locators, I set these passages beside their sources: the statements of §2.1 (glauberman lines 100–106), §2.2 (lines 234–243), §3.4 (lines 375–387), §4.1 (lines 503–526), §4.4 (lines 623–628); the statements of §7.1 (martinez lines 710–713), §7.4 (lines 1823–1834), §7.5 (lines 2222–2224), §7.6 (lines 1985–1988, 2295–2296); the statement and route of §8.3 (reynolds lines 531–540; martinez lines 2331–2347); the Conventions on defect groups (sambale lines 341–351); the docstrings of `brauer_height`, `fongReynolds`, `reynolds_heights`. No sentence shares a run of words with its source beyond formulas and standard names; notation is the roadmap's (`Γ`, `S`, `C` for the source's `G`, `A`, `T`). The one place where a proof plan tracks a source's symbols is R02.

**Arrangement.** `martinez` has the largest share. Its contents (Lectures 1–9) against the block layers:
- Layer 6 draws on §§2.1, 2.3, 3.1, 3.2.
- Layer 7 draws on §3.1, Lemma 4.4, §§7.1, 7.2, 8.1, 8.2, 9.1, 9.2, in the roadmap's own order (domination before Fong–Reynolds, Fong's theorem before the extended first main theorem).
- Layer 8 draws on §8.2 and §9.3; Layer 9 on §9.3.

No layer maps onto one lecture and the order differs. For the second source, Layers 2, 3, 4 share their order with glauberman §§2, 3, 4. That order is forced by the `*Needs:*` lines (§3.2 needs §§2.2–2.4; §4.1 needs §3.2), and the scopes differ: Lemma 3 is in Layer 1 with the roadmap's own route, Theorem 5 (e) is in Layer 5, and the uniqueness law of §4.5 comes from `spath-vallejo` and `navarro-2018`.

**Reuse.** No table, figure, exercise list or numerical data is taken from a source. No declaration of `Suggested.lean` matches a public formalisation I know of.

Source independence: 14 passages compared with 4 sources (glauberman, martinez, reynolds, sambale), none shared in wording, one proof route sharing its symbols (R02); largest share martinez, 47 of 106 line locators; contents compared with martinez: independent.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share of locators (47 of 106), is unpublished course notes read from the author's page (`sources.toml`, `licence_class = "author-page"`); I found no licence statement in the text.
- **Scope.** The block strand's refereed sources are `reynolds`, `sambale`, and by locator only `navarro-1998` and `feit`; `martinez` omits several proofs (lines 729, 1835, 2003, 2013), which the README's routes supply or cite elsewhere.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "07ba40c1fc7bd6b5adf18fddce1342eaf2019a1b", "job": "RT-ModularCharactersAndBlocksPartII~1b", "model": "fable", "worker": "chris-x91"} -->
