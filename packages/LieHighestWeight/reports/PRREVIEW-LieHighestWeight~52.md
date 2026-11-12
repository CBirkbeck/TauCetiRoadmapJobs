# Review of LieHighestWeight (pull request #1220 at 37a5164)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review of the 118 lines changed since `3dff437`. The head repairs all three findings of the previous report. Two P3 findings remain, both in the passages the repair rewrote, and neither blocks:

- R01: the new symmetrization headline's route re-derives degreewise lemmas that Tau Ceti already proves, and the statement has no locator.
- R02: the ScatteringDiagrams contract names only Layer 7 as a consumer.

The gate passes, apart from `outside-folder` for the family index, which this pull request owns.

`README.md` and `Suggested.lean` are the folder's files. `TauCeti/…` and `Mathlib/…` paths are at the manifest pins. Main was read at `38a5fb2`.

## R01 (P3) — The symmetrization headline re-derives native degreewise lemmas and carries no locator

**Location:**

- `README.md:54–56`: “Layer 7 adds its equivariance for the adjoint actions, the equality of the degree and PBW filtrations under it, and the multiplicative assembly of the degreewise center symbols.”
- `README.md:1859–1862`: “Equivariance holds because the derivation replaces one letter of each word by its bracket with x, … the forward filtration inclusion is degree counting, and the converse uses injectivity of the leading symbols”.
- The Tau Ceti contract at `README.md:859–863` lists only `pbwSymmetrization` and `pbwSymmetrization_mem_center_iff` from `PBW/Symmetrization.lean`.
- The family index at `:84–86` says “adds the adjoint equivariance and filtration of PBW symmetrization”.

**Claim:** Adjoint equivariance is new in Layer 7, and its route is a fresh word computation.

**Witness:** `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Symmetrization.lean` has three lemmas, none of which needs freeness:

- `:316` `lie_ι_pbwHomogeneousSymmetrization`: equivariance on each homogeneous component;
- `:116` `pbwSymmetrization_mem_pbwFiltration`: the forward filtration inclusion;
- `:150` `mk_pbwSymmetrization`: the leading symbol.

Its `:85` `pbwSymmetrization_tprod` is the averaging formula of the hypothesis `he`. The textual source is EtingofRepresentationsLieGroups lines 2994–2997, proof of Theorem 13.5, p. 69.

The previous report suggested the wording “Layer 7 adds its equivariance”. It opened `:316` but did not carry that lemma into its repair.

**Repair:** `Suggested.lean` is unchanged. Make these README edits:

- **`:54–56`.** Replace the sentence with: “Layer 7 extends the native degreewise adjoint equivariance and leading-symbol statements to it, proves the equality of the degree and PBW filtrations under it, and adds the multiplicative assembly of the degreewise center symbols.”
- **Tau Ceti contract, end of the bullet at `:859–863`.** Add: “In the same file, `TauCeti.UniversalEnvelopingAlgebra.lie_ι_pbwHomogeneousSymmetrization` (adjoint equivariance on each homogeneous component), `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_pbwFiltration` and `TauCeti.UniversalEnvelopingAlgebra.mk_pbwSymmetrization` (PBW degree and leading symbol) need no freeness. All three take the scalar ring in `Type`.”
- **`:1859–1862`.** Replace “Equivariance holds because … `pbwAssociatedGradedEquiv`.” with:

  > On the degree-n component the formula is that of `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_tprod`, so e agrees there with the native degreewise map. For K in `Type`, equivariance is `TauCeti.UniversalEnvelopingAlgebra.lie_ι_pbwHomogeneousSymmetrization` and the forward inclusion is `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_pbwFiltration`. The converse follows from `TauCeti.UniversalEnvelopingAlgebra.mk_pbwSymmetrization` with `TauCeti.UniversalEnvelopingAlgebra.pbwHomogeneousComponentMap_injective`. For K in a larger universe the same word computation applies. Over ℂ the g-module isomorphism is in Etingof, *Representations of Lie Groups*, proof of Theorem 13.5, p. 69.

- **Family index `:84–86`, and the Layer 7 bullet of the description.** Say “extends the native degreewise equivariance of PBW symmetrization to the global map and adds its filtration statement”.

**Tested instance:** I checked each cited lemma with `#check` at the pin. The first three take `R : Type` and `IsUnit (n! : R)`; `pbwHomogeneousComponentMap_injective` takes `[Module.Free R L]`. The headline's `⁅x, p⁆` equals `TauCeti.SymmetricAlgebra.lieModuleDerivation K L L x p` by `rfl`, which is the action in the hypothesis of `lie_ι_pbwHomogeneousSymmetrization`.

Take K = ℚ, `[x,y]=y` and p = XY:

- the native formula with n = 2 gives (xy+yx)/2, the value that `he` gives;
- the derivation sends XY to XY, so the native lemma says the commutator of ι x with (xy+yx)/2 is (xy+yx)/2 again, which is the clause-1 value; directly, [x,xy] = xy and [x,yx] = yx.

## R02 (P3) — The ScatteringDiagrams contract names only Layer 7 as a consumer

**Location:** `README.md:875–877`: “Layer 7 uses it with `R` a characteristic-zero field and assumes nothing else of it”.

**Claim:** Only Layer 7 consumes ScatteringDiagrams §0.4, and only over a field.

**Witness:** `README.md:1365–1367` (§3.2): “When R is a ℚ-algebra, also take the symmetrized PBW comparison, the permutation-average map of ScatteringDiagrams §0.4, applied in each homogeneous degree”. `:1414–1415` adds §0.4 to the Layer 3 *Needs*. There R is a commutative ℚ-algebra, not a field.

**Repair:** Replace the sentence at `:875–877` with:

> Layer 3 (§3.2, with `R` a commutative ℚ-algebra and `g = Rx ⊕ Ry`, `[x,y] = y`) and Layer 7 (with `R` a characteristic-zero field) use it and assume nothing else of it. In §3.2 the formula alone puts the image of a degree-n product among words of length n, hence in Rees degree n; adjoint equivariance and the two-sided filtration statement are proved in §7.1.

**Tested instance:** In §3.2's algebra, (XY+YX)/2 = YX + ħY/2 in the Rees algebra, with X = j(H) and Y = j(N). This lies in Rees degree 2 from the formula alone, with no filtration input.

## Previous findings

- R01 — repaired: `README.md:51–54` cites “[ScatteringDiagrams §0.4] (`exists_pbwSymmetrizationEquiv`)”. The contract is at `:870`, and the *Needs* lines at `:1415`, `:2166` and `:2177`. The family index is updated, and `Suggested.lean:230` states `pbwSymmetrization_lie_and_mem_pbwFiltration_iff` as proposed. The repair's wording led to R01 above.
- R02 — repaired: the Review considerations no longer contain either stale sentence. The Layer 7 bullet reads “Layer 7 adds the adjoint equivariance of PBW symmetrization and the equality of the degree and PBW filtrations under it”.
- R03 — repaired: `:1734` “`χ_(base,λ) : Z(U(L)) →ₐ[K] K` is read from the Verma top line.”; `:1514` “`formalCharacter_coeff_eq_finrank_weightSpace` identifies each coefficient…”; `:1870` “is ⊥”; `:3314–3315` “the Pieri rules consumed in Layers 6 and 9”.

## Verified sound

### Gate, build, signatures, padding

- **Worker's gate.** Every rule passes, with `build=0 OK`.
- **My rerun.** `outside-folder=1` for `TauCetiRoadmap/RepresentationTheory/README.md`, which is the pull request's own file. Every other rule is 0. The brief's outside-folder diff returns nothing.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2136 edges, 0 problem(s)`. The edge count rose from 2135 at `3dff437`, so the new ScatteringDiagrams edge is read. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 8.7 s with 15 `sorry` warnings and nothing else. The file has 15 theorems and 10 definitions with real bodies, no `set_option`, no sorried data and no admitted example. This matches the description.
- **Signature.** `#check @pbwSymmetrization_lie_and_mem_pbwFiltration_iff` gives K : Type u with `[Field K] [CharZero K]`, an arbitrary L : Type v, and a linear e with `he`. The theorem sits between `end General` and `section Serre`, so no section binder applies. This is the generality of README `:1853–1858`, “every Lie algebra over every characteristic-zero field”. The two binder flags in the worker's signature file are on untouched theorems, and both keep `[IsTriangularizable K H L]` as `inst_7`.
- **One-tactic probe.** On a scratch copy, `first | rfl | (simp; done) | infer_instance | decide | exact?` fails on the new theorem (`exact?` could not close the goal). It is not padding. The other 14 are untouched; the previous report found all of them failing.

### ScatteringDiagrams §0.4 on main

- `Suggested.lean:85–92` states `exists_pbwSymmetrizationEquiv (R g) [CommRing R] [Algebra ℚ R] [LieRing g] [LieAlgebra R g]`, with `algebraMap ℚ R (d! : ℚ)⁻¹ • ∑ σ`. For d = 0 it sends 1 to 1, as the contract at `:870–875` says.
- With R = K a characteristic-zero field, `algebraMap ℚ K (d!)⁻¹ = (d! : K)⁻¹`, so its β satisfies `he`. The headline's hypothesis is therefore satisfiable.
- The link `../../ScatteringDiagrams/README.md` resolves. Its `README.md:41–43` claims ownership of the symmetrization form. Its contract table takes PBW from Tau Ceti (`pbwAssociatedGradedEquiv`, `:92`), so no cycle arises.

### Changed passages and ownership

- **§3.2 (`:1365–1367`).** The sentence still fits the half-bracket checks at `:1392–1398`.
- **§7.1 (`:1849–1870`, `:1890–1898`) and §7.2's *Needs* (`:2166–2168`).** They name only declarations that exist: the new theorem, `exists_pbwSymmetrizationEquiv` on main, and native names at the pin.
- **Layer 9 (`:2831`).** “Layer 7 equivariant PBW symmetrization” stays consistent with the head.
- **Ownership.** I ran `roadmaps grep 'pbwSymmetrization|pbwFiltration|symmetrization.*(equivariant|filtration)'` over main and every open head. It returns this pull request, #1797 (the same folder, ordered first in the description), and #1015 NoncompactQuantumSymmetry as a consumer. There is no second owner of the new headline.

### Adversarial table

Rows marked (r51) are carried from the previous report for statements this diff leaves untouched.

| Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- |
| `pbwSymmetrization_lie_and_mem_pbwFiltration_iff`, both clauses | L = 0 | `he` at [] gives e(1) = (0!)⁻¹·1 = 1; clause 1: x = 0 gives 0 = 0; clause 2: Sym^≤n = K = F_n for every n | holds |
| same | abelian line Kx | e(Xⁿ) = (1/n!)·n!·xⁿ = xⁿ; bracket 0 and ι x central, so 0 = 0; Xᵐ ∈ Sym^≤n ⟺ m ≤ n ⟺ xᵐ ∈ F_n | holds |
| same, clause 1 | `[x,y]=y`, p = XY | ⁅x,XY⁆ = XY, and the commutator of x with (xy+yx)/2 is (xy+yx)/2; ⁅y,XY⁆ = −Y², and the commutator of y with (xy+yx)/2 is (−y²−y²)/2 = −y² | holds |
| same, clause 2 | `[x,y]=y`, p = XY, n = 1, 2 | e(XY) = YX + Y/2 has PBW degree 2: not in F₁, in F₂; XY is not in Sym^≤1 and is in Sym^≤2 | holds in both directions |
| same, clause 1 | sl₂, p = H²+4EF | ⁅x,p⁆ = 0 for x = e, f, h; e(p) = h²+2ef+2fe; the commutator with e is (−2eh−2he)+2eh+2he = 0 | holds; agrees with native `pbwSymmetrization_mem_center_iff` |
| same, hypothesis | 𝔽_p, n = p | (p! : K)⁻¹ = 0 in Lean, so `he` forces e(Xᵖ) = 0 ∈ F₀ while Xᵖ is not in K: clause 2 fails | `[CharZero K]` is needed and is in the signature |
| same, wrong model | ordered map e′(XY) = xy | `he` demands (xy+yx)/2; xy − (xy+yx)/2 = y/2 ≠ 0 | `he` excludes it |
| §3.2 via §0.4, degree 2 | Rees, X = j(H), Y = j(N) | (XY+YX)/2 = YX + ħY/2, Rees degree 2 | holds (R02) |
| `normalizedPolynomialTensorBasis` (r51) | 0≤m,n≤3, random invertible g | 1082 exact equalities, 0 failures; Gram diagonals (1,1): 1, 1/2, 1, 2 | Keep |
| §0.1 item 5 (r51) | m = 2, n = 2, 3, 5 | F²w₁ = (2,4n,n(n−1)); Fw₂ = (1,n−2,−(n−1)); w₃ = (1,−2,1) | Keep |
| `polynomialAction` (r51) | swap, m = n = r = 1 | image −(x⊗y−y⊗x), det = −1 | Keep |
| `exists_reesZeroFiberBracket` (r51) | `[x,y]=y`; abelian | B(x,y) = y; B = 0 | Keep |
| `symmetricGradient` (r51) | b = (x,y), ξ = (2,3) | x² ↦ 4x, xy ↦ 3x+2y | Keep |
| `lift_reesZeroFiberBracket_eq_lie_symmetricGradient` (r51) | `[x,y]=y` at (2,3); sl₂ | 3 = 3; 12 = 12; {e, h²+4ef} = 0 on both sides | Keep |
| §3.2 ordered and symmetrized products (r51) | a=0, b=1, c=1, d=0; p = x, q = y | x⋆y = yx+ħy; D(xy) = y/2, B_sym(x,y) = y/2 | Keep |
| `invariantForm_isSymm_iff_tits_sign` (r51) | sl₂ V(1), V(2); sl₃ adjoint | signs −1, +1, +1 | Keep |
| §6.2 fixed-point sum (r51) | GL₂, λ = (1,0), t = (2,3) | −4+9 = 5 = 2+3 | Keep |
| §7.1 translation (r51) | A₁, ρ(h) = 1 | τ₋ρ(h²+2h) = h²−1 | Keep |
| `serreLift_injective_of_base` (r51) | A₂; B₂ | height reductions as listed in r51; 2+6 = 8, 2+8 = 10 | Keep |
| `octonionSerreLift_injective`, division octonions (r51) | i, j, ℓ | (ij)ℓ = (0,k), i(jℓ) = (0,−k) | Keep |
| `nonempty_derivationAlbert_equiv_f4`, Albert determinant (r51) | diag(1,2,3) | (216−252+72)/6 = 6 | Keep |
| `finrank_e6_e7`, `finrank_e8` (r51) | rank + roots | 78, 133, 248 | Keep |
| `exists_complexified_divisionOctonion_equiv`, `compact_g2_derivation_divisionOctonion` (r51) | dimension | 14 = 2+12 | Keep |
| `isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau` (r51) | n = 2, λ = μ = (1) | 2·2 = 3+1 | Keep |
| `exists_productCenterEquiv` (r51) | sl₂, characteristic 3 | [h,e³] = 6e³ = 0; [f,e³] = −3e²(h+2) = 0 | Keep |
| `eq_of_mem_closedFundamentalAlcove_of_mem_affineWeylGroup` (r51) | A₁: x = 2/3, 1, 0 | the orbit meets [0,1] once; stabilizer of 0 has order 2 | Keep |
| Lie–Poisson sign across roadmaps (r51) | `[x,y]=y` | {x,y} = y here and in LieGroupoidsPoisson §G4.6A | Agree |

### Sources: the seeded sample

No locator in the README is marked unverified.

| Target | Passage read this round | Outcome |
| --- | --- | --- |
| 3.1 | GuttDeformationQuantization lines 899–905 (Lecture 1, slide 14): positive linear Poisson convention at line 902; 1/k! symmetrization σ at line 905 | As cited; σ is the formula of `he` and of §0.4 |
| 3.2 | same slide; the changed sentence adds no locator | Consistent with B_sym = ½{,} |
| 7.1 | EtingofRepresentationsLieGroups lines 2153, 2207 (Thm 10.1, Rem. 10.2, pp. 51–52), lines 2987 and 2994–2997 (Thm 13.5 and proof, p. 69: symmetrization is a g-module isomorphism) | As cited; lines 2994–2997 are the locator R01 asks for |
| 7.2 | same Theorem 10.1 and Remark 10.2 | As cited |
| 0.1, 5.1, 6.1, 6.2, 9.1, 9.2, 10.1 | untouched; read in r51 at the lines it lists | As cited (r51) |
| 9.3 | Dixmier §1.6 | Not verifiable (below) |

I re-read only the passages above. I found no new source issue; the previous report's three entries stand.

### Remarks on untouched text (no change requested)

- #1015 NoncompactQuantumSymmetry `README.md:1089–1090` cites “Layer7's `pbwSymmetrization` … `pbwSymmetrization_symbol`, `pbwSymmetrization_mem_center_iff`”. These are names from main's `Suggested.lean:1375–1408`, and the former-name table at `README.md:85–95` does not map them. #1797's `README.md:138–142` does. No roadmap on main cites them.
- `README.md:861–863` puts “for `L` free” on the degreewise map. Only the centre criterion needs it; `pbwSymmetrization` needs only `n!` to be a unit.
- The generated `roadmap-summary` block's “Layers 7–9 sharpen normalized symmetrization” is compatible with this head.

## Not verifiable

- **Dixmier, *Enveloping Algebras*, §1.6** (`README.md:2834`). Not in the sources cache or the manifest; this review edits no manifest.
- **HumphreysIntroLieAlgebras §20.3, BourbakiLie78, GoodmanWallachSymmetry.** Settled as uncertified, cited by locator only.
- **Background references, not opened:** Serre 1987, Fulton–Harris 1991, Humphreys 2008, Jantzen, Molev 2007. No changed statement depends on them.

## Source issues

- none
