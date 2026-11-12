# Review of ArtinAlgebras (pull request #2190 at 292f85b)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — §7.4 cites Tau Ceti declarations absent at the pin, one for §7.1's own target

**Location:** README.md:1374–1383, 1413: “the double centralizer property of a generator-cogenerator, used in the converse below, is Tau Ceti's `TauCeti.toModuleEnd_moduleEnd_bijective_of_isGenerator`”; *Needs:* “Tau Ceti `TauCeti.Module.IsGenerator`”.

**Claim:** `TauCeti.Module.IsGenerator`, `TauCeti.Module.isGenerator_iff_exists_surjective` and `TauCeti.toModuleEnd_moduleEnd_bijective_of_isGenerator` are not in the pinned Tau Ceti. The double centralizer of a generator is §7.1's own target (README:1229–1230).

**Witness:** At `2fd255d9` there is no `TauCeti/Algebra/Module/Generator.lean`, and a grep of the pinned tree finds none of the three names. They exist only on Tau Ceti's main branch (`Generator.lean:90,132,228`).

**Repair:** Delete the bullet “**comparison with Tau Ceti's generators**: … `TauCeti.toModuleEnd_moduleEnd_bijective_of_isGenerator`;” (README:1374–1383). Delete “; Tau Ceti `TauCeti.Module.IsGenerator`” from the *Needs:* line at 1413. The correspondence's *Needs:* line already lists “7.1's projectivization and double centralizer”.

## R02 (P3) — §0.5 plans to redefine a Tau Ceti declaration that is absent at the pin

**Location:** README.md:482–487: “A target here: redefine `TauCeti.IsAdditiveGenerator G` as `∀ X, TauCeti.additiveClosure G X`, prove the Krull-Schmidt equivalence …”. Also README.md:466–469 and Suggested.lean:124–125 (`TauCeti.additiveClosure`).

**Claim:** `TauCeti.IsAdditiveGenerator`, `TauCeti.additiveClosure` and `TauCeti.additiveClosure_iff` are not at the pin. A target cannot redefine a declaration the pin lacks, and this roadmap's `IsAdditiveGenerator` already is the target.

**Witness:** At `2fd255d9`, `TauCeti/CategoryTheory/Preadditive/` has neither `AdditiveClosure.lean` nor a `KrullSchmidt/` directory, and the three names occur nowhere in the pinned tree.

**Repair:** At README:466–469, replace “Here `add G` is Tau Ceti's … and `Suggested.lean` states its unfolding.” with “Here `add G` is the class of retracts of the finite biproducts `Gⁿ`, and `Suggested.lean` states `add G = C` in this unfolded form.” Delete README:482–487. At Suggested.lean:124–125, delete the sentence “This unfolds `∀ X, TauCeti.additiveClosure G X`, … later than the pinned revision.”

## R03 (P3) — The pinned field case of the new dual existence theorem is not cited

**Location:** README.md:1023–1025: “Over a field the existence theorem is Tau Ceti's `ModuleCat.exists_isAlmostSplit_arTranslate`, its case `R = k`”. Also README.md:272–274 (“From Tau Ceti”).

**Claim:** The pin also proves the field case of `exists_isAlmostSplit_of_not_injective`. Scope (README:59–62) says the field declarations are derived from the general ones and “No parallel construction is kept”, but this declaration is not listed.

**Witness:** `ModuleCat.exists_isAlmostSplit_of_not_injective` (`TauCeti/Algebra/Category/ModuleCat/AuslanderReiten/Sequence.lean:110` at `2fd255d9`). Over a finite-dimensional algebra, a finitely generated indecomposable non-injective module starts an almost-split sequence whose terms are finitely generated.

**Repair:** At README:272–274, write “the existence of almost-split sequences `ModuleCat.exists_isAlmostSplit_arTranslate` and its dual `ModuleCat.exists_isAlmostSplit_of_not_injective` (`TauCeti.Algebra.Category.ModuleCat.AuslanderReiten.Sequence`)”. At README:1023–1025, write “Over a field the existence theorems are Tau Ceti's `ModuleCat.exists_isAlmostSplit_arTranslate` and `ModuleCat.exists_isAlmostSplit_of_not_injective`, their case `R = k`, …”. Add the dual to the §4.3 *Needs:* line.

## R04 (P3) — §7.5 *Needs:* omits inputs that its statement and its route use

**Location:** README.md:1532–1535: “*Needs:* 7.4's correspondence; 1.4's projective dimension bound; 0.5's additive generators; … and `Quotient`.”

**Claim:** `exists_equiv_quotient_moritaSetoid` is stated with `TauCeti.IsRepresentationFinite`, and the `→` route of `isMoritaEquivalent_end_iff` uses “the duality `D` of Layer 2”. The line names neither.

**Witness:** Suggested.lean:426 (`TauCeti.IsRepresentationFinite.{u} A`). README:1489–1491 (“Morita equivalence of Artin algebras passes to opposite rings through the duality `D` of Layer 2”).

**Repair:** Append “; 2.3's duality for Artin algebras; Tau Ceti `TauCeti.IsRepresentationFinite` (6.1)” to the *Needs:* line.

## R05 (P3) — `HasProjectiveInjectiveCopresentation` and `two_le_dominantDimension_iff` are padding

**Location:** Suggested.lean:309–314 (`def HasProjectiveInjectiveCopresentation`) and 338–342 (`theorem two_le_dominantDimension_iff`); module docstring 49–52; README.md:1312–1314.

**Claim:** Together the two restate the definition of `dominantDimension` at `n = 2`, via truncation. No headline uses `HasProjectiveInjectiveCopresentation`, so it is a definition kept only for an API lemma.

**Witness:** `HasProjectiveInjectiveCopresentation` occurs only at Suggested.lean:51, 311 and 341. `two_le_dominantDimension_end`, `exists_algEquiv_end_of_two_le_dominantDimension` and `IsAuslanderAlgebra` state `2 ≤ dominantDimension` directly.

**Repair:** Delete both declarations from `Suggested.lean`. Replace docstring lines 49–52 with “* Dominant dimension (Layer 7): `HasProjectiveInjectiveCoresolution`, the number `dominantDimension` in `ℕ∞`, and the left-right symmetry `dominantDimension_mulOpposite`.” At README:1313–1314, delete “(`two_le_dominantDimension_iff`, in `Suggested.lean`, on `HasProjectiveInjectiveCopresentation`)”. The bullet keeps the statement in prose.

## R06 (P3) — A naming instruction for later library work

**Location:** README.md:1305–1306: “so if the flat version is added to Tau Ceti later, it should be `flatDominantDimension`, and `dominantDimension` keeps its name”. Suggested.lean:333–334: “the flat version, if added later, is the *flat-dominant dimension* `flatDominantDimension`”.

**Claim:** The README is timeless and plans nothing “for later”, and a backticked name exists in `Suggested.lean` or at the pins. `flatDominantDimension` is neither, and Scope (README:97–101) already excludes the flat version.

**Witness:** `flatDominantDimension` occurs in no pinned Mathlib or Tau Ceti file and is not declared in `Suggested.lean`.

**Repair:** At README:1305–1306, end the sentence at “([Xi, §1]).” and delete the rest of the clause. At Suggested.lean:333–334, write “Following Xi, the flat version is the *flat-dominant dimension*.”

## R07 (P3) — The description miscounts Part 2, misplaces a Check and omits two renames

**Location:** Description: “Part 2 (the last six commits)”; and, under **Generator-cogenerators** (§7.4): “Checks: `k` in `mod k`; `ℤ` is not a cogenerator of `mod ℤ`.”

**Claim:** Part 2 is five commits. §7.4 has no `k` Check: the `k` Check is §0.5's, in `ModuleCat k`. Two theorems of main's `Suggested.lean` are renamed, and the description does not say so.

**Witness:** `git log origin/main..HEAD` lists 11 commits, five after `e1b2c59` (`248cf37` to `292f85b`). The `k` Check is README:496–498. `hasProjectiveInjectiveCopresentation_end` and `exists_algEquiv_end_of_hasProjectiveInjectiveCopresentation` are on main but not at the head.

**Repair:** Write “Part 2 (the last five commits)”. Replace the Checks sentence with “Checks: in `ModuleCat k`, `k` has every indecomposable as a summand but is not an additive generator (§0.5); `ℤ` is not a cogenerator of `mod ℤ` (§7.4).” Append to **Dominant dimension**: “`hasProjectiveInjectiveCopresentation_end` and `exists_algEquiv_end_of_hasProjectiveInjectiveCopresentation` are renamed `two_le_dominantDimension_end` and `exists_algEquiv_end_of_two_le_dominantDimension`.”

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~11.md`.

- R01 — repaired. The description now has “**Fifth review fixes** (sixth commit): `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal` moves among the Tau Ceti results valid in any category; …”.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.2 `IsKrullSchmidt` [Kr Cor. 4.4 p. 9; proof p. 10] | zero category; `mod ℤ/4`; f.g. abelian groups | n = 0 decomposition; summands of length 1 and 2, both local; `End ℤ = ℤ` not local. kr lines 478–487 | holds; locators correct | none |
| 0.3 uniqueness [Kr Thm. 4.2, Cor. 4.3 p. 9] | `ℤ/2⊞ℤ/4` vs `ℤ/4⊞ℤ/4`; `ℤ[√-5]`, `I=(2,1+√-5)` | orders 8 ≠ 16; `I²=(2)` so `I⊕I≅R⊕I²≅R²`, `I` not free. kr lines 451–472 | holds; non-local control fails as stated | none |
| 0.5 `isAdditiveGenerator_iff_forall_indecomposable` | `mod ℤ/4`: G=`ℤ/2⊕ℤ/4`, G=`ℤ/4`; `ModuleCat k`, G=`k` | true/true; false/false (`ℤ/2` not a summand of free `(ℤ/4)ⁿ`); RHS true, LHS false outside Krull-Schmidt | iff holds; `[IsKrullSchmidt]` needed | R02 |
| 1.2 Freyd-Auslander [INP p. 20] | inp lines 1215–1232; `proj k[x,y₁,y₂,…]/(xyᵢ)` | abelian ⟺ kernels ⟺ weak kernels, cited to [A1] *Coherent functors*; `Ann(x)` not f.g., so no weak kernel | locator correct | none |
| 1.3 [Kr Prop. 2.3 p. 3; proof of Prop. 3.10 p. 8; Ch Thm. 2.1 p. 460] | `P = A⊕A` | kr lines 162–164, 385–391; chase lines 139–144 (left coherence); `End(A⊕A) = Mat₂(A)ᵒᵖ` | correct; [Ch] is readable, so its “not read” note can go | none |
| 1.5 covers [Kr Cor. 3.5 p. 6, Prop. 3.10 p. 7, Prop. 4.1 p. 8] | `(-,B)→S_B`, `B=k[ε]/ε²`; `proj ℤ` | at `B`: `B→k` with kernel `εB`, residue-1 endomorphisms invertible; `ℤ/2` has no cover. kr lines 316, 377, 402–408 | holds | none |
| 2.1 `exists_isInjectiveEnvelope_quotient_jacobson` | `k`; `ℤ/p²`; `k[x,y]/(x,y)²` | `E=k`; `E=R`; length 3 with simple socle vs `soc R` of dimension 2, so `E≇R` | holds | none |
| 2.3 Nakayama functor [ARS II.4.3, II.4.6] | `T₂(k)` | `ν(simple projective)` = projective-injective of length 2 = its injective hull | Check holds; ARS not readable | none |
| 3.2 [INP Def. 1.21 p. 8, Rem. 1.22 p. 9; En §A.2 p. 24; LZ §2 p. 170] | finite abelian groups, `id_{ℤ/p}` | `Ext¹(ℤ/p,ℤ/p)=ℤ/p≠0`, so `id∉𝒫`. inp lines 523–539; enomoto lines 1490–1496; lz lines 58–74 | definitions and locators match | none |
| 3.3 route [JK Lemma 1.1; INP Prop. 2.6; Thm. 2.9, Prop. 2.10 p. 12] | `ℤ/2→ℤ/4→ℤ/2` over `ℤ/4` | `i≫d=0`, `Hom(ℤ/4,ℤ/2)={0,d}`; jk lines 138–155, proof uses only composition; inp lines 733–741 (p. 11), 779–811 | holds | none |
| 4.2 defect-formula Checks | `T₂(k)`, `δ: 0→S₁→P₂→S₂→0` | at `S₂`: `Dδ^*=k`, `δ_*(S₁)=k`; at `S₁`: `0=0`; swapped formula at `S₁`: `k` vs `0` | Checks correct; Kr03, ASS, ARS not readable | none |
| 4.3 `exists_isAlmostSplit_of_not_injective` | `ℤ/4`: `N=ℤ/2`, `N=ℤ/4` | `0→ℤ/2→ℤ/4→ℤ/2→0`; `ℤ/4` is injective, so the hypothesis fails | holds | R03 |
| 5.3 multiplicities [ARS VII.1.3] | sequence ending at `ℤ/p` over `ℤ/p²` | middle term `ℤ/p²` once; `Irr(ℤ/p²,ℤ/p)` one-dimensional over `𝔽_p`, so `b=1` | consistent | none |
| 6.2 `forall_mem_and_isRepresentationFinite_of_length_le` | `A=0`; `A=k×k`; `A=ℤ/p²` | 0: `hne` impossible, vacuous; `k×k`: `(1,0)` central, so `hA` fails and the class `{S₁}` is excluded; `ℤ/p²`: two classes, `b=2` | holds | none |
| 7.1 projectivization, double centralizer [ARS II.2.1] | `M=A`; `P=Aⁿ`; `A=k`, `M=k²` | `Γ≅Aᵒᵖ`; `End≅Matₙ(A)ᵒᵖ`; `End_{Mat₂k}(k²)=k=A` | holds; owned by 7.1 | R01 |
| 7.2 `globalDimension_mulOpposite`, `…_quotient` [Au55] | `0`; `k`; `k[ε]/ε²` | `⊥=⊥`; `0=pd(k)=0`; `pd(k)=∞` on both sides. au55 lines 40–44 (p. 68), 123–135 (p. 70), 211–237 (p. 73) | locators correct | none |
| 7.3 `dominantDimension` | `T₂(k)`; `ℤ`; `k[ε]/ε²`; zero ring; wrong model without `Injective` | 1; 0 (only f.g. projective-injective is 0); ⊤; ⊤; wrong model gives ℤ the value ⊤ via `0→ℤ→ℤ→0` | determines the object | R06 |
| 7.3 `two_le_dominantDimension_iff` | any `Γ` | `sup ≥ 2` ⟺ some `n ≥ 2` ⟺ `n = 2` (truncation) ⟺ copresentation | the definition at `n = 2` | R05 |
| 7.3 `dominantDimension_mulOpposite` [Ho p. 275] | `T₂(k)`; `End_B(B⊕k)` | `T₂(k)ᵒᵖ≅T₂(k)`, 1 = 1; 2 = 2. hoshino lines 30–42: flat version, every `n≥1`, Artinian case cited to Tachikawa [9] | holds; locator correct | none |
| 7.4 `isSeparator_iff_exists_retract` | over `ℤ`: `M=ℤ/2`, `M=ℤ⊕ℤ/2`; zero ring | false/false (every `ℤ/2→ℤ` is 0); true/true (`n=1`); true/true (`n=0`) | holds over any ring | none |
| 7.4 `isGeneratorCogenerator_iff_forall_indecomposable` | `B=k[ε]/ε²`: `M=B`, `M=S`; `ℤ` | true/true; false/false; for `ℤ`, RHS true and LHS false (`Hom(ℤ/2,ℤ)=0`) | Artin hypothesis needed and present | none |
| 7.4 Morita-Tachikawa (three theorems) | `(k,k)`, `(Mat₂k,k²)`; `R=k×k` acting on `k` by the projections; `T₂(k)` | both ends are `k` and the equivalence sends `k↦k²`; ring iso but `(1,0)` acts as 1 vs 0; dom.dim 1 < 2 | consistent | none |
| 7.5 `IsAuslanderAlgebra`, `isAuslanderAlgebra_end` | `End_B(B⊕k)`; `B`; `T₂(k)`; `0`; `ℤ/4` with `ℤ/2⊕ℤ/4` | dimension 5 with (2,2): true; gl.dim ⊤: false; dom.dim 1: false; (⊥,⊤): true; order 32 with (2,2): true | holds | none |
| 7.5 `isMoritaEquivalent_end_iff`, `exists_equiv_quotient_moritaSetoid` | `k` with `k`, `k²`; `k` vs `k×k`; zero algebra; ℝ-algebra `ℍ` | `k ∼ Mat₂k`: both sides true; false/false; `[0]↦[0]`, and only `0∼0`; `End_ℍ ℍ=ℍᵒᵖ≅ℍ` | bijection consistent | R04 |

- Source locators checked against the text: 28. Kr: 9; INP: 6; Au55: 5; En: 2; LZ: 2; JK, Hoshino, Xi §1 and Chase: 1 each. Xi §1 (lines 53–82) gives `ℤ` dominant dimension 0 and flat-dominant dimension 1.
- Library at the pins: 14 declarations opened. `IsSeparator`/`IsCoseparator` (Generator/Basic.lean:545,549), `Indecomposable` (BinaryBiproducts.lean:1096), `FGModuleCat` (FGModuleCat/Basic.lean:57) and `IsMoritaEquivalent` with refl/symm/trans (Morita/Basic.lean:123–141) are in Mathlib. `TauCeti.globalDimension` (GlobalDimension.lean:70), `IsRepresentationFinite` (RepresentationFinite.lean:48), `nonempty_iso` (Uniqueness.lean:138) and `ModuleCat.exists_isAlmostSplit_of_not_injective` (Sequence.lean:110) are in Tau Ceti. Of the 289 backticked README names, all resolve except those in R01, R02 and R06.
- Gate: the worker's gate passes. A hand run gives every check 0 except `outside-folder` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own file.
- Elaboration: `lake env lean Suggested.lean` gives 27 `sorry` warnings and nothing else. `#check @` of all 37 declarations: every Artin-algebra statement carries `R`, `[IsArtinianRing R]`, `[Algebra R _]` and `[Module.Finite R _]`, and nothing is dropped. The 10 binders the worker flagged are false positives. `Linear R (FGModuleCat A)` is `Linear.fullSubcategory` over `ModuleCat.Algebra.instLinear`.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `decide`, `aesop`): 0 of 27 closed.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap check: read RepresentationTheory (main and the open heads), QuiverRepresentations (main), GrothendieckEulerForms (main) and GeneralAlgebraicKTheory (open). No roadmap states dominant dimension, generator-cogenerators, Auslander algebras or the Morita-Tachikawa or Auslander correspondences; only the family index names them, assigning them to ArtinAlgebras. Nothing is shared.
- Cross-roadmap citations resolved on main: PurityOfBranchLocus §0.3 (`globalDimension`, Suggested.lean:132), DerivedModuleAlgebra §1.M.2, StablePeriodicCurved Layer 0, QuiverRepresentations 6E (mapped to §6.3 on main) and ZigzagPreprojective §4.2. The open CountingBundlesAndHallAlgebrasOfCurves cites §§0.1, 0.3–0.4 and 0.6, all kept.

## Not verifiable

- [ARS] (Cambridge book, no legal copy): II.2.1, II.4.3, II.4.6, IV.1.10, IV.4.5–6, V.1.15, VI.1.2–1.5, §VI.5 pp. 209–215, VII.1.3, VII.1.5.
- [ASS] (Cambridge book): IV.2.13, IV.5.2–5.3, IV.6.11.
- [Kr03]: the Elsevier DOI is paywalled, and the Bielefeld repository record has no file.
- [Mü]: the Cambridge Core page does not mark the article open access, so it was not fetched.
- [ABM], [Au78], *Coherent functors*, Freyd, Tachikawa (LNM 351), *Representation theory of Artin algebras II*, *Representation dimension*, Yoneda, Roiter: no legal copy found.

## Source issues

- none
