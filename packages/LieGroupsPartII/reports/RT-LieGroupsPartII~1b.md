<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17225#issuecomment-6903411609 -->
Red team round 1 pass b (claude) of 87b4701

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) §2.3 takes the chamber coverage from a supplier statement whose hypotheses are read two ways

   **Location.** `packages/LieGroupsPartII/README.md:109`: "These statements, and `Ad(K)𝔞 = 𝔭`, concern
   a maximal abelian `𝔞 ⊆ 𝔭` of a `CartanInvolution` […]; no `IwasawaData` is presupposed, so §2.3 uses
   the coverage to prove the field `chamber_normalizer_cover`." Used at `README.md:273` and `:275`.

   **Claim.** LieGroups Layer 9 proves, for a bare `CartanInvolution` with `(𝔞, Σ⁺)`, that every
   `Ad(N_K(𝔞))`-orbit in `𝔞` meets the closed positive chamber, and §2.3 may use it to construct an
   `IwasawaData`.

   **Witness.** In `TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean` the coverage exists
   only as the structure field `IwasawaData.chamber_normalizer_cover` (an input), with no theorem for a
   `CartanInvolution`. RealSemisimpleLieGroups (open head), Scope, reads the same Layer 9 text as "the
   restricted root system of a group carrying LieGroups Layer 9's `IwasawaData` […] the carrying of `𝔞`
   into the closed chamber". Under that reading §2.3 proves the field from a statement that assumes
   the field.

   **Repair.** Make the field independent of how Layer 9 is read; every input is already a target here.

   1. In §2.3, replace the last bullet of "Prove every field" by:
      "every `H ∈ 𝔞` has an `N_{K⁰}(𝔞)`-translate in the chamber: `H` lies in the closed chamber of some
      positive system `Σ'⁺` (take `H' ∈ 𝔞` regular and close to `H`, and `Σ'⁺ = {β : β(H') > 0}`);
      `W(Σ)` carries `Σ'⁺` to `Σ⁺` (RealSemisimpleLieGroups §1.2), and each reflection `s_β` is `Ad(k)|_𝔞`
      for some `k = lieExp(c(X + dθX)) ∈ N_{K⁰}(𝔞)` (§2.4, first statement, whose proof uses §1.1 and
      LieGroups Layers 1 and 4 only, not this section); adding any `Z ∈ 𝔷 ∩ 𝔞` preserves the chamber,
      since every root vanishes on `Z`."
   2. In the §2.3 *Needs:* line, replace "and the chamber coverage by `N_K(𝔞)`" by "; §2.4 (first
      statement: the reflection representatives in `K⁰`, which does not use §2.3)".
   3. In §2.4, add after the first statement: "This statement does not use §2.3; the rest of the
      section does." Its *Needs:* keeps "2.3 (for `G⁰`)" for the other statements.
   4. At `README.md:109`, replace "no `IwasawaData` is presupposed, so §2.3 uses the coverage to prove
      the field `chamber_normalizer_cover`" by "§2.3 does not consume the coverage: it proves the field
      `chamber_normalizer_cover` from §2.4's representatives in `K⁰`".

   Tested on the instance: `GL_2(ℝ)`, `H = diag(0, 1)`: `Σ'⁺ = {e₂ − e₁}`, `s_{e₁−e₂}` is realized by
   the rotation through `π/2` in `SO(2) = K⁰`, which carries `H` to `diag(1, 0)` in the chamber
   `h₁ ≥ h₂`. `O(1,1)`: `Σ = ∅`, the chamber is all of `𝔞`, `k = 1` serves, and `K⁰ = 1` suffices.

2. **F02** (P3) the merge order places this roadmap above a roadmap its supplier needs and to which it defers ownership

   **Location.** `merge-order/ORDER.txt:62–63` (LieGroupsPartII, then AutomorphicFormsOnReductiveGroups);
   `packages/LieGroupsPartII/README.md:43`: "On the two classes above its statements are theirs";
   `README.md:793`: "For `G = 𝐇(ℝ)` the condition is RealSemisimpleLieGroups §2.3".

   **Claim.** The dependency check reports `0 problem(s)` (output below), so the order is sound.

   **Witness.** RealSemisimpleLieGroups is not in `ORDER.txt`, so the check sees no edge through it. Its
   §2.3 and §3.1 end "*Needs:* … AutomorphicFormsOnReductiveGroups §2.3a" (for `𝐒` and for `P = MAN`
   on `𝐆_ad(ℝ)`). So LieGroupsPartII → RealSemisimpleLieGroups → AutomorphicFormsOnReductiveGroups, which
   is one line below it.

   **Repair.** No change to the README statements. The worker moves LieGroupsPartII to just after
   AutomorphicFormsOnReductiveGroups in the merge order when it submits, and names
   RealSemisimpleLieGroups (an open new-folder pull request of another author) in the merge-order
   paragraph of the pull request. Optionally shorten the chain for §8.1: its *Needs:* may cite this
   roadmap's §2.5 (axiom (v)) instead of RealSemisimpleLieGroups §2.3, since `Ad(𝐇(ℝ)) ⊆ Ad(𝐇(ℂ))`
   and `Ad(𝐇(ℂ))` is connected with Lie algebra `ad(𝔤_ℂ)`. Tested on `SO(1,1)`: `𝐇(ℂ) ≅ ℂ^×` is
   connected, `Ad` is trivial, (v) holds and `M = {±1}` meets both components; on `O(1,1)`:
   `𝐇(ℂ) = O(2, ℂ)` is disconnected and the argument correctly does not apply.

3. **F03** (P3) §2.5 uses `Int(·)` and its adjoint datum without naming their owner

   **Location.** `README.md:320`: "integrates it on the connected semisimple centre-free group
   `Int(𝔰_ℂ)`, the identity component of `Aut(𝔰_ℂ)`. The polar decomposition of LieGroups Layer 9 for
   this group gives `Int(𝔰_ℂ) = K_τ·exp(ad i𝔲)`"; *Needs:* at `README.md:325`.

   **Claim.** The *Needs:* line of §2.5 lists every input (RealSemisimpleLieGroups §§1.2, 2.3).

   **Witness.** `Int(𝔤₀)`, its equality with the identity component of `Aut(𝔤₀)` and its adjoint
   `CartanInvolution` datum are RealSemisimpleLieGroups §0.2 (its second paragraph); §6.3 of this README
   cites §0.2 for exactly this, §2.5 does not.

   **Repair.** In the §2.5 *Needs:* line write "RealSemisimpleLieGroups §§0.2 (`Int(𝔰_ℂ)` for the real
   Lie algebra underlying `𝔰_ℂ`, the identity component of its automorphism group, with its adjoint
   datum for the Cartan involution `τ`), 1.2, 2.3". In the supplier contract (`README.md:117`) change
   "Consumed in §§1.2 and 6.3" to "Consumed in §§1.2, 2.5 and 6.3". In the Layer 2 Dependencies line
   (`README.md:352`) change "§§1.2, 2.3" to "§§0.2, 1.2, 2.3". Tested on the §2.5 Check for `GL_2(ℝ)`:
   `𝔰_ℂ = 𝔰𝔩_2(ℂ)`, `Int(𝔰_ℂ) = PSL_2(ℂ)`, `K_τ = PSU(2) = Int(𝔰𝔲(2))`, as step 1 states.

4. **F04** (P3) the subspace clause of §2.1 is not what the cited declaration proves

   **Location.** `README.md:215`: "The stabilizer in `W(Σ)` of a point of the closed positive chamber,
   or of a subspace of `𝔞` pointwise, is generated by the reflections it contains, by
   `TauCeti.stabilizer_eq_closure_wallReflections` applied to `Σ_ind` in its span."

   **Claim.** The pinned theorem gives both the point and the subspace statements.

   **Witness.** `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:201` has the hypothesis
   `hx : x ∈ dominantChamber P b` and concludes for the stabilizer of that one point. A subspace need
   not meet the chamber outside `0` (in `A₁`, `𝔰 = 𝔞`: the stabilizer of `0` is `W`, the pointwise
   stabilizer of `𝔰` is `1`). §3.1 step 2 uses the subspace clause.

   **Repair.** Replace the bullet's justification by: "For a point `x` of the closed chamber this is
   `TauCeti.stabilizer_eq_closure_wallReflections` applied to `Σ_ind` in its span. For a subspace
   `𝔰 ⊆ 𝔞`, choose `x ∈ 𝔰` outside the kernels of the roots that do not vanish on `𝔰` (finitely many
   proper subspaces of `𝔰`); the roots vanishing at `x` are those vanishing on `𝔰`. Some `w ∈ W(Σ)`
   carries `x` into the closed chamber, so the stabilizer of `x` is the `w`-conjugate of that of `wx`
   and is generated by the reflections `s_β` with `β(x) = 0`; these fix `𝔰` pointwise, and the pointwise
   stabilizer of `𝔰` lies in the stabilizer of `x`, so the two groups are equal." Extend the locator to
   "(Bourbaki, Ch. V §3 no. 3 for the stabilizers; Ch. VI §1)" and add `Ch. V §3 no. 3` to the
   `bourbaki-lie4-6` entry of `sources.toml` (uncertified, cited by its locator). Tested on `A₁`,
   `𝔰 = 𝔞`: `x ≠ 0`, no root vanishes at `x`, both groups are `1`; on `A₂`, `𝔰 = ker α₁`: `x` generic in
   `ker α₁`, the group is `{1, s_{α₁}}`, as the README's Check says.

One P2 finding (R01) and three P3 findings (R02–R04). No statement of `Suggested.lean` was found
false, truncated or padded. No finding of an earlier repair report was marked
`not actionable in this package`, so nothing is re-raised.

## Dependency check

    depcheck: 237 roadmaps, 2244 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The check has no edge through RealSemisimpleLieGroups, which is
not in the merge order (R02).

## Adversarial pass

`K`, `M`, `N`, `P`, `𝔤` are those of the README. "O(1,1)" has `K = {±1, ±d}`, `d = diag(1, −1)`,
`𝔞 = ℝY`, `M = {±1}`, `N = 1`, `P = {±exp tY}`.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `conj_standardParabolic_le_iff` | `S = ∅`; rank one `J = J' = ∅`, `g ∈ BsB`; `J = ∅, J' = S, g = 1`; `GL_3`, `J = {s₁}, J' = {s₂}` | `B = G`: both sides true; `gBg⁻¹ ⊄ B` and `g ∉ B`: both false; both true; `P_J ⊄ gP_{J'}g⁻¹` (plane versus line) and `J ⊄ J'`: both false | holds; proof route of §6.1 rechecked (`BwB·Bw⁻¹B ⊇ BsB·BsB = B ∪ BsB`) |
| `dynamicLevi_decomposition` | `GL_2`, `X = diag(1,0)`; `X = 0`; `n = 0`; discrete `OᵀSL_2(ℤ)O`; skew `X` | upper triangular / unitriangular / diagonal, `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`; `G, 1, G`; trivial; `O g Oᵀ = ((2,3),(1,2)) ∈ SL_2(ℤ)`, `(OlOᵀ)₁₂ = 3/2`, normalization hypothesis fails so clause 6 is vacuous; excluded by `Xᵀ = X` | holds; limit `l` lies in `G` exactly under the normalization hypothesis |
| `minimalParabolic_langlands` | `SL_2`; O(1,1); compact `G` (`𝔞 = 0`, `H₀ = 0`); `n = 0` | `((−2,3),(0,−1/2)) = (−1)·diag(2,1/2)·((1,−3/2),(0,1))`; `G = K·P`, `K ∩ P = {±1} = M`; `N = {g : g → 1} = 1`, `P = M = K = G`; trivial | holds |
| `dynamicUnipotent G H₀ = exp 𝔫` (used by `minimalParabolic`) | closed `G`, regular `H₀` | `G ∩ U` is closed in a unipotent group and contracted into its identity component by `exp(−tH₀)`, so connected | holds |
| `exists_conj_minimalParabolic` | `SL_2`, `±H₀`; O(1,1), `±Y`; `GL_2`, `𝔞` versus `ℝ1 ⊕ ℝS` | `k = ((0,−1),(1,0)) ∈ SO(2)`; same `P`, `k = 1 ∈ K⁰ = 1`; rotation through `π/4` | holds |
| `bruhat_decomposition_linear` | `SL_2`; O(1,1); `Aut(𝔰𝔩_3(ℝ))` | 2 cells; `G = P ⊔ dP`, `P ∩ K = {±1}`; 12 cells, `k = 1` and `σ·Ad(w₀)` give different cosets since `K ∩ P = M` | holds; disjointness reproved through `N_K(𝔞) ∩ N̄MAN = M` |
| `doubleCoset_cell_coordinates` | `SL_2`, `k = ((0,−1),(1,0))`, `g = ((a,b),(c,d))`; `k = 1`; O(1,1) | `u = ((1,a/c),(0,1))`, `p = ((c,d),(0,1/c))`, `u k p = ((a,(ad−1)/c),(c,d)) = g`; `u = 1`; `u = 1`, `p = k⁻¹g` | holds |
| `dynamicParabolic_eq_iUnion_doubleCoset` | O(1,1), `H₀ = Y`; `Aut(𝔰𝔩_3)`, `H₀ = diag(1,0,−1)`, `diag(3,1,−4)` | `exp(−tY) d exp(tY) = exp(−2tY) d` unbounded, union over `{±1}` is `P`; `σ·Ad(w₀)H₀ = H₀`, two cosets; `diag(4,−1,−3) ≠ X₁`, one coset | holds |
| `exists_eq_nonnegEigenspaces_of_le` | `GL_2`, `Y = 0`, `1`, `diag(1,0)`; `𝔰𝔩_3`, `diag(1,1,−2)` versus `diag(2,2,−4)` and `diag(1,0,−1)` | `𝔤`, `𝔤`, upper triangular; eigenvalues `0,0,3,3,−3,−3`, dimension 6, same centralizer and sum; different | holds |
| `linearComponentCondition_iff` | `GL_n`; O(1,1); `O(p,q)` | holds, stabilizer of `Σ⁺` is `M`; fails, `d` normalizes `N = 1` and `P`, `d ∉ M ∪ P`; block determinants `(Πε·det k', Πε)`: four values iff `p > q` | both equivalences hold in both directions |
| `eq_dynamicParabolic_of_le` | `GL_n`; O(1,1) without the hypothesis | block parabolics; `0` and `Y` have centralizer `𝔤`, parabolics `G ≠ P` | holds; hypothesis needed |
| `exists_titsSystem_linear` | compact `G`; `GL_n(ℝ)`; O(1,1) | `B = N = G`, `S = ∅`; `B` upper triangular, `N` monomial; `P` normal, no Tits system | holds; hypothesis needed |
| `positiveCharacterKernel_mul_exp` | `ℝ^×`; O(1,1); swap group; `ℝ^× × ℝ^×`; `n = 0` | `{±1} × ℝ_{>0}`; `F = 0`, `⁰G = G`; `diag(e³, e) = diag(e, e⁻¹)·exp(2·1)`; `F = V` of dimension 2; trivial | holds; existence reproved by transfer from `G⁰` (`[G : G⁰]` finite, `F` a real vector space) |
| `isSelfAdjointLinearGroup_of_zeroLocus` | `S = ∅`; `SO(1,1)`; `O(1,1)`; `SO(2,1)`; `Gℂ = 1` | `GL_n`, `M ∋ diag(−1,1,…)`; `Gℂ ≅ ℂ^×`, `M = {±1}` meets both components; `Gℂ = O(2,ℂ)` disconnected, excluded; `M = {1, diag(1,−1,−1)}` meets both; trivial | holds |
| §1.2 conjugacy | `ℝ × S¹`, `θ_c`; `ℝ ⋊ C₂`, `θ_a`; `SL_2`, `h = diag(2,1/2)` | `𝔭_c = {(x,cx)}` distinct, no conjugacy; `θ_a` is an automorphism (checked on the four sign cases), `K_a = {(0,0),(a/2,1)}`, conjugate by `a/4`; `c_aθc_a⁻¹ = c_{aaᵀ}θ`, `g = h` | holds |
| §2.2 | `GL_2`, `S = ((0,1),(1,0))` | `Ad(R_φ)S = ((−sin 2φ, cos 2φ),(cos 2φ, sin 2φ))`, `B = −2 sin 2φ`, maximum at `−π/4` | holds |
| §2.4 | `SL_2`, `X = E₁₂` | `X + dθX = E₁₂ − E₂₁`, `c = −π/2` gives `((0,−1),(1,0))` | holds |
| §2.5 | `Aut(𝔰𝔩_3)`; `O(4)` | `σ·Ad(w₀)`: `(e₁−e₂)(H') = h₂ − h₃`, preserves `Σ⁺`, `\|W_G\| = 12`; condition holds, (v) fails | holds |
| §3.1 inheritance | `SL_2`, `𝔰 = 𝔞`; `GL_3`, `diag(1,1,−2)` | `L = MA`, two components, `M = {±1}`; `L = GL_2 × GL_1`, four components | holds |
| §3.3 (e), (f) | `GL_2`; O(1,1) | nilradical of `Lie(P)` is `ℝE₁₂ ⊕ ℝ1`, `B`-orthogonal is `ℝE₁₂`; `N_G(P) = G ≠ P` | holds |
| §4.2 dimensions | `SL_3`; `SU(2,1)` | `5,6,6,7,7,8`; `dim P = 5`, `5 + 3 = 8` | holds |
| §5.1 | `ℝ² ⋊ C₂` | `(3,1) ↦ (2,2)`, residual `(1,−1)` | holds |
| §6.2 conventions | `GL_2`, `X = diag(1,0)` | `((a, e^{−t}b),(e^{t}c, d))`, bounded iff `c = 0`; `λ(e^{−s}) = exp(−sX)` | signs agree with `TauCeti.Cocharacter.parabolic` and RealSemisimpleLieGroups' `dynamicalParabolic` |
| §6.3 | `GL_2`, trace-zero upper triangular; `Aut(𝔰𝔩_3)` | Borel condition holds, `1 ∉ 𝔮`, dimension 2 against 3; `σ𝔮_{α₁} = {X₁₃ = X₂₃ = 0} = Ad(w₀)𝔮_{α₂}` | holds |
| §7.2 transport | `X = ((1,1),(0,0))`, `g = I + X` | `gX = Xg = ((2,2),(0,0))`, `θ(g) = ((1/2,0),(−1/2,1))`, `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))` | holds |

## Verified sound

- **Declarations read:** 26 of 26 in `Suggested.lean` (13 definitions, 13 theorems), each against
  its README statement and against the elaborated types in the worker's `signatures.md` (0 dropped
  binders; the only section variable is `{n : ℕ}`). I ran no Lean.
- **Form of `Suggested.lean`:** one `import Mathlib` plus one existing Tau Ceti module; no
  `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd data; every definition has a real
  body; no declaration is padding by the one-tactic probe (`conj_standardParabolic_le_iff` is not in
  `TauCeti/GroupTheory/TitsSystem/`: `Parabolic/Normalizer.lean` proves only self-normalization).
- **Headline theorems:** the statable ones (§§6.1, 7.2–7.4, 8.1) are stated; the module docstring
  names §§1.2, 2.4–2.6, 3.3–3.5, 4.2, 5.1, 6.2 and 6.3 as not statable with the missing carrier. Its
  two library claims hold at the pin: `LieRing.ofAssociativeRing` is a `def` used as a local instance
  (`Mathlib/Algebra/Lie/OfAssociative.lean:47, 63`), and `Mathlib/Algebra/Lie/BaseChange.lean:185`
  base-changes Lie submodules only.
- **Targets read:** all 24 sections of the README (1.1–8.1), Conventions, supplier contracts,
  worked examples.
- **Checks tested:** about 70 recomputed, none false or vacuous; every definition has at least three.
- **Pinned declarations:** 40 Tau Ceti names resolved with their files, among them the nine cited
  in the §6.1 proof plan, the hypotheses of `stabilizer_eq_closure_wallReflections`
  (`FundamentalDomain.lean:148`) and `[Field k] [Nontrivial kˣ]` of `glTitsSystem`; the pins in the
  README equal those of `lake-manifest.json`.
- **Sibling citations checked:** RealSemisimpleLieGroups §§0.2, 1.2, 1.3, 2.3, 3.1, 3.2, 3.3, 4.1,
  4.2, 4.3, 4.4, 5.4 at its open head, with `exists_conj_cartanInvolution`, `exists_titsSystem`,
  `dynamicalParabolic`, `nonnegEigenSubmodule`; LieGroups (main) Layers 0–9 with 14 names and the
  fields of `IwasawaData` against the §2.3 list; ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1,
  ALS.0.2; AutomorphicFormsOnReductiveGroups §2.3a; FlagVarieties §§3.1, 3.2, 5.2; ReductiveGroups
  Layers 7, 7C; AdelicAlgebraicGroups §2.1; RootSystems "Exact supplier contracts". No cycle:
  none of these names LieGroupsPartII.
- **Ownership:** `roadmaps grep` finds none of the 26 Lean names and no second owner of the
  self-adjoint matrix model, of `⁰L` for a Lie group, or of §6.1's statement, on main or at the open
  heads.
- **Locators verified:** 5 (below). The pull request changes only `packages/LieGroupsPartII/`.

Source independence: 9 passages compared with 4 sources, none shared; largest share knapp2002, 25 of 45 source mentions; contents compared with knapp2002 by its section numbers only (text not held): independent — Ch. VII §2 feeds Layers 1, 2, 3 and 5, and Ch. VII §7 (Layers 3, 6) is used before Ch. VII §4 (Layer 4), so no run of layers follows its sections.

Passages compared: borel-tits1965 lines 1488–1497 (4.15, printed pp. 90–91) with §6.2; lines
1930–1932 (5.18, printed p. 101) with §6.1 and the docstring of `conj_standardParabolic_le_iff`
(the source's index sets are complementary to `J`, and the README states the Tits-system form);
brown-fisher-hurtado2022 lines 510–521 with Conventions; brown-rodriguezhertz-wang2022 lines 130–143
with Conventions (its simple roots are "not a linear combination", the README's "not sums of two");
bradlow-collier-garciaprada-gothen-oliveira2024 lines 72–74 with Downstream consumers.

## Not verifiable

- knapp2002, warner1972, wallach1988 and bourbaki-lie4-6 are uncertified: their locators (section
  level, with Lemma 7.73 and Proposition 7.76) were not read. Proposition 7.76 agrees with the
  citation of it at brown-fisher-hurtado2022 line 521.
- Which reading of LieGroups Layer 9's chamber coverage its authors intend (R01): the README text
  and the Lean field allow both.
- AutomorphicSpectralTheoryPartII §1.5, KleinianGroups and FuchsianOrbifoldsPartII, named only under
  Downstream consumers, were not opened; the worker's citation list reports them resolved.
- The elaboration of `Suggested.lean` was not rerun in this pass.

## Source issues

- none

## For the human reviewers

- **Not tested.** knapp2002 has the largest share of the locators (25 of 45 mentions) and is
  uncertified in `packages/LieGroupsPartII/sources.toml`: the wording check was not run against it,
  and the arrangement check used its section numbers only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87b47010b16138a26337fd0bb36974e5e2ba4060", "job": "RT-LieGroupsPartII~1b", "model": "fable", "worker": "chris-x89"} -->
