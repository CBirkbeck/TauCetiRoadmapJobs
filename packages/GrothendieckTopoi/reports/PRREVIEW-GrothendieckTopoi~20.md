# Review of GrothendieckTopoi (pull request #1520 at 119dbd3)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not elaborate: `canonicalTopology` is not in scope

**Location:** `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` lines 514 and 523: "IsIrreducibleObject (canonicalTopology (Sheaf J (Type u))) (J.yoneda.obj c) ↔" and "IsIrreducibleObject (canonicalTopology E) A ↔".

**Claim:** At the pinned Mathlib the canonical topology is `CategoryTheory.Sheaf.canonicalTopology`. Under `open CategoryTheory CategoryTheory.Limits` the bare name becomes an auto-bound implicit, so the build fails (the gate reports `build=3 FAIL`), and 6.6 (a) and (b) are not stated.

**Witness:** `Mathlib/CategoryTheory/Sites/Canonical.lean` line 103 declares `canonicalTopology` inside `namespace Sheaf` (lines 49–120). `lake env lean` on the head reports "Function expected at canonicalTopology" at 514:25 and 523:25, and exits 1.

**Repair:** In `Suggested.lean`, write `Sheaf.canonicalTopology` at lines 514 and 523 and in the docstring at line 498. In the README, write `Sheaf.canonicalTopology` at lines 187, 1088 and 1132. Tested on a scratch copy with the two Lean edits: it exits 0 with 44 `sorry` warnings and nothing else.

## R02 (P3) — 6.6's *Needs:* line omits inputs that routes (a) and (b) use

**Location:** README line 1132: "*Needs:* 1.1, 6.5; Mathlib `canonicalTopology`, `GrothendieckTopology.Subcanonical`, …"; line 1173: "6.6 uses 1.1 and 6.5".

**Claim:** Route (b) uses two facts that the line does not list:
- disjoint, universal coproducts (1.4);
- epimorphic families are the canonical covers (1.2).

Route (a) uses Elephant C2.3.2 (c). The pin provides it through two Mathlib lemmas, and neither is listed either.

**Witness:** README lines 1102–1106: "an epimorphism `B → A` is an epimorphic family and so splits"; "(coproducts are disjoint and universal)". `Mathlib/CategoryTheory/Sites/LocallySurjective.lean` lines 377 and 491.

**Repair:** At line 1132, write: "*Needs:* 1.1, 1.2, 1.4, 6.5; Mathlib `Sheaf.canonicalTopology`, `GrothendieckTopology.Subcanonical`, `GrothendieckTopology.yoneda`, `GrothendieckTopology.ofArrows_mem_iff_isLocallySurjective_sigmaDesc_uliftYoneda_map`, `Sheaf.isLocallySurjective_iff_epi`, `Functor.IsDenseSubsite`, `Functor.IsDenseSubsite.sheafEquiv`, `sheafBotEquivalence`, `Retract`, `Projective`, `ObjectProperty.FullSubcategory`." At line 1173, write: "and 6.6 uses 1.1, 1.2, 1.4 and 6.5."

## R03 (P3) — Seven targets state theorems with no source locator

**Location:** README 3.2 (lines 596–605), 3.3 (618–623), 5.1 (791–794), 7.1 (1179–1183), 7.3 (1221–1229), 8.4 (1351–1362) and 9.5 (1548–1558). None of these paragraphs gives a source at any claim.

**Claim:** The only support for these targets is the prose route, but every claim needs a locator. For the sampled targets 3.2, 7.3 and 9.5 there is nothing to check against a source.

**Witness:** 7.3, line 1224: "Prove that the points of `Sh(L)` correspond to Mathlib's `Locale.PT L`". The paragraph runs to its *Needs:* line without a source in parentheses.

**Repair:** Put a source locator at each claim. The References already list candidates:
- SGA 4 IV §5 and §9 for 3.2 and 3.3;
- Mac Lane–Moerdijk IX.1–IX.5 and Stone Spaces II §§1–3 for 7.1, 7.3 and 8.4.

Add a source for 5.1. For 9.5, if no source states it, say in the target that the route given is its proof.

## R04 (P3) — The description says the gate passes at this head

**Location:** pull request description, "Checks run locally": "The worker's gate gives 0 on every check at the current head."

**Claim:** At 119dbd3 the gate fails the build (R01). The same paragraph says that the declarations of 6.6 were not elaborated.

**Witness:** The gate at 119dbd3 reports "… depcheck=0 … build=3 FAIL", with errors at `Suggested.lean` 514:25 and 523:25.

**Repair:** After R01, replace the bullets with the following, once rechecked:
- "`lake build TauCetiRoadmap.GrothendieckTopoi.Suggested` succeeds with 44 `sorry` warnings and nothing else, including the six declarations of 6.6, whose four theorems resist a one-tactic probe."
- "The worker's gate gives 0 on every check."
- Keep the depcheck sentence.

## Previous findings (review of a43840d)

- R01 (description: eight layers, missing 5.6, 6.5 and Layer 9): repaired. The description now says "in nine layers", items 5, 6 and 9 name essential morphisms, Roos and Layer 9, and the ownership sentence and the `Suggested.lean` list cover them.
- R02 (missing suppliers and sources): repaired. The description now reads "It consumes: … AdicEtaleGeometry A1.15 …; DiamondEtaleCohomology, "Topological open extension by zero" …; Tau Ceti's `supportedSections` …", and the Sources sentence now lists Kashiwara–Schapira 1990, Stone 1948 and Bannister 2024.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.6 `IsIrreducibleObject` | Sierpiński `Opens X`; `Opens ℝ`; `Type u`, canonical | `∅`: the empty sieve covers it. `{o}`, `X`: only `⊤` covers. `(0,1)`: covered by `(0,2/3)`, `(1/3,1)`. `PUnit` irreducible; `Bool` covered by two constants. | discriminates | none |
| 6.6 `IsRigidTopology` | Sierpiński; `Opens ℝ`; `End(Bool)` with the induced canonical topology | Sierpiński is rigid with `D = {{o} ≤ X}`. ℝ: no irreducible opens, so not rigid. `Bool`: not irreducible, so not rigid. | discriminates | none |
| 6.6 (a) `isIrreducibleObject_yoneda_iff` | site `d →f c` with `{f}` covering; Sierpiński | `y c = (1,1)` is a sheaf and `y d = (∅,1)` is not. `ℓ c ≅ 1` is irreducible, `c` is not. Sierpiński: `y{o} = (∅→1)` and `yX = (1→1)` are irreducible. | holds with `[J.Subcanonical]`, fails without (README Check 3) | none |
| 6.6 (b) `isIrreducibleObject_iff_projective_preservesCoproducts` | `Type u`: `PUnit`, `Bool`, `∅`; degenerate topos | `PUnit`: both sides true. `Bool`: `Hom(Bool, 1⊔1)` has 4 elements against 2. `∅`: the empty sieve covers it, and `Hom(∅, ∐∅) = 1 ≠ ∅`. Degenerate: both false. | holds | none |
| 6.6 (c) `nonempty_equiv_presheaf_of_isRigid` | `C` empty; `PUnit` with `⊤`; Sierpiński | Empty: one object on each side. `⊤`: `PUnit` not irreducible, `D = ∅`, both degenerate. Sierpiński: `PSh(0<1)` = maps `F(X) → F({o})`. | holds | none |
| 6.6 (d) `isRigidTopology_iff_nonempty_equiv_presheaf` | `End(Bool)` induced canonical; `Opens ℝ`; `⊤` on `PUnit` | Bool: a presheaf topos, not rigid; retract `PUnit ≇ Bool`, so `hret` fails. ℝ: retracts of `ℓU` are `ℓV`, `hret` holds, both sides false. `⊤`: both true. | holds; `hret` needed | none |
| 6.6 locators | Caramello 2012 Def 2.3 (c), §2, Props 2.5 (iii) and 2.6 (iii), Thm 3.13, Rem 3.14 | caramello2012 lines 98–100, 123–127, 138–148, 169–170, 428–445 and 446–453 state what the README cites. 2.6 (iii) is stated for every site. | supported; source issue below | none |
| 2.1 existence criterion | `S ↦ S×S`; `S ↦ Bool×S`; `Over.forget Bool` | `(1⊔1)²` has 4 elements against 2. `Bool×1 = Bool ≠ 1`. `𝟙 Bool ↦ Bool`, which is not terminal. The pinned adjoint functor theorem takes `HasColimitsOfSize`, `WellPowered Cᵒᵖ` and a small separating property. | holds | none |
| 2.2 2-cells | `B G` canonical point; Sierpiński | Endomorphisms of the forgetful functor ≅ `G`, against `|G|²` for unrelated pairs. 2-cell `o ⟶ c`; none `c ⟶ o` (the sheaf with `F(X)=∅`, `F({o})=1`). | holds | none |
| 3.1 slices | `Over Bool`; `Discrete {c,d}` with empty sieve on `d` | `Over Bool ≃ Type×Type`. `ℓ d = y d = (∅,1)`, which is initial. `y c(d) = ∅`, so `y c` is not a sheaf. | holds | none |
| 3.2 étale morphisms | `X = Bool` in `Type u` | `Hom((A,B),(S,S)) = Hom(A⊔B,S)` and `Hom((S,S),(A,B)) = Hom(S,A×B)`. So `f_! = ⊔` and `f_* = ×`. | holds; no locator | R03 |
| 3.3 open embeddings | `X = Bool`; Sierpiński `{o}` | `(Bool,1) → (Bool,Bool)`: 8 maps, against 16 maps `Bool → Bool×Bool`, so not full. `Over(ℓ{o}) ≃ Type u`. | holds; no locator | R03 |
| 4.1 subtopoi | `≤1`-element types, reflector `PLift (Nonempty X)` | The equalizer of `PUnit ⇉ Bool` is `∅ ↦ ∅`, but the image pair `PUnit ⇉ PUnit` has equalizer `PUnit`. So the reflector is not left exact. | holds | none |
| 4.3 open, closed, `¬¬` | Sierpiński, `U = ℓ{o}` | `(Bool, Bool, const false)`: not bijective and `F({o})` has two elements, so it lies in neither `o(U)` nor `c(U)`. `¬¬{o} = X`. | holds | none |
| 4.4 gluing | `Φ = 𝟭`; `Φ` constant `⊤`; `Comma Φ 𝟭` | Arrow category = `Sh(Sierpiński)`. Constant `⊤` gives `G × F`. `F × Pointed(G)`: `(∅, ⊤⊔⊤) ⟶ (∅, 𝟙⊤)` into the initial object is not invertible. | holds | none |
| 4.5 surjection–embedding | étale morphisms of `Bool` and `∅`; points `o`, `c` | `S ↦ (S,S)` is faithful. `Type → 1` is not faithful. `o_*S = (S,S,id)` is fully faithful. `c_*S = (S,1)` is closed. | holds | none |
| 5.1 connected | `Type u`; degenerate topos; discrete `Bool` | `Δ = 𝟭` is fully faithful. `Type → 1` is not faithful. `S ↦ (S,S)` is not full. | holds; no locator | R03 |
| 5.4 hyperconnected, localic | `B G`, `G ≠ 1`; Sierpiński | Trivial `G`-sets are closed under subobjects. `G` acting on itself is no subquotient of a trivial `G`-set. `ℓ{o} = (∅,1)` is not constant. | holds | none |
| 7.1 frame topology | two-element frame; `Opens ℝ` | The empty sieve covers `⊥`, so `Sh ≃ Type u`. `(−∞,0)` and `(0,∞)` miss `0`, so they do not cover. | holds; no locator | R03 |
| 7.3 points and spaces | `PUnit → Sierpiński`; cofinite `ℕ` | `c ∈ closure{o}`, so there is a 2-cell `o ⟶ c`. The nonempty cofinite opens form a completely prime filter; `ℕ∖{n}` excludes each point `n`. | holds; no locator | R03 |
| 7.4 sublocales | frame `0 < a < 1` | Four sublocales: `{1}`, `{0,1}` (open, `a ⇨ 0 = 0`), `{a,1}` (closed, `0 ⇨ a = 1`) and the whole. The middle two are incomparable. | holds | none |
| 8.1 fibre products | `E × Type u`; discrete `I, K`; `Over X × Over Y` | `E × Type u ≃ E`. `Sh(I) × Sh(K)` = families indexed by `I × K`. `Over X × Over Y = Over (X × Y)`. | holds | none |
| 8.3 way-below, core-compact | `Opens ℝ`; `ℚ`; `⊥ ≪ ⊥` | `(0,1) ≪ (−1,2)` via `[0,1]`. `(1/n, 1−1/n)` refutes `(0,1) ≪ (0,1)`. `ℚ∖[t±1/n]` refutes core-compactness. hofmann-lawson1978 line 521, p. 297. | holds | none |
| 8.4 `quasiSober_pi`, `quasiSober_prod` | indiscrete two-point space; Sierpiński² | The indiscrete space and its square are quasi-sober but not T0. Sierpiński² has four points. | holds; no locator | R03 |
| 8.5 products of spaces | `ℚ` and `ℚ+√2` in `ℝ`; `T = ∅` | Disjoint, dense, meet ⊇ Boolean dense part ≠ 0: isbell1981 line 62; Thm 1: line 53. `T = ∅`: one-element frame on both sides. | holds | none |
| 9.5 no projectives on `ℝ` | one-point space; Sierpiński `j_!ℤ`; `V=(−1,1)`, `N=(−2,2)` | `Hom(ℤ,−)` is exact. `Hom(j_!ℤ,F) = F({o})` is exact. `ℤ_V(N) = 0` because `V` is not closed in `N`; `ℤ_V(V) = ℤ`. | holds; no locator | R03 |
| 1.4 Giraud | `Fin 3`, 7-pair relation; `Ab`, empty coproduct | The coequalizer is `Fin 3 → 1`, whose kernel pair has 9 pairs, not 7. The pullback of `0` along `ℤ → 0` is `ℤ`, which is not initial. | holds | none |
| 2.5 Diaconescu | `Discrete{c,d}`, `A = (1,∅)`; `Discrete PUnit`; constant `PUnit` on `Opens X` | Filtering but not flat (two components). `A *` is forced to have one element. (iv) fails at `⊥`. | holds | none |
| 4.2 closure operators ↔ subtopoi | `Type u` | The identity gives all types. The constant `⊤` gives one-element types (`∅ ↪ 1` is dense). The larger operator gives the smaller subtopos. | holds | none |
| 5.5 hyperconnected–localic | `B G`; `Sh(X)`; degenerate topos | `B G → Type` then `id`. `Sh(X)`: `id` then global sections. Degenerate: `id` then itself. | holds | none |
| 5.6 essential | étale morphism of `Bool`; `Sh(ℚ)` | `(S,S)` preserves products, with left adjoint `⊔`. `ℚ ↪ 2^ℕ` is continuous and injective but not locally constant, so `∏ₙ Bool` is not preserved. | holds | none |
| 6.1 points | Sierpiński; empty site | Two points and one arrow `o ⟶ c` on both sides. The empty site has no points. | holds | none |
| 6.4 Deligne | `C` empty; discrete `ℕ` | Empty: degenerate topos, the empty family works. Discrete `ℕ`: the stalks at each `n` are conservative. | holds | none |
| 6.5 Roos | `B G`; monoid `{1,e}`; `Sh(ℝ)` | One essential point. Two (`1` and `e` in the Karoubi envelope). `∏ₙ ∐ₖ ℓ(Iₙ,ₖ) → 1` is not an epimorphism near `0`. | holds | none |
| 7.2 localic | `Type u`; `B G` | `Type u` is localic with the two-element frame. `B G`: the only subterminals are `∅` and `⊤`, so it is not localic for `G ≠ 1`. | holds | none |
| 9.1–9.2 extension by zero, recollement | Sierpiński `U={o}`; étale morphism of `Bool` | `j_!ℤ` has stalks `ℤ` and `0`. Sequence: `0 → (0,B) → (A,B) → (A,0) → 0`. The codiagonal `ℤ⊕ℤ → ℤ` has kernel `ℤ`, so `hc` is needed. | holds | none |
| 9.3–9.4 supports, local cohomology | Sierpiński `Z={c}`, `ℤ`; `ℝ`, `Z={0}` | `i^!ℤ = ker 𝟙 = 0` while `i^*ℤ = ℤ`. `j_*j^*ℤ` has stalk `ℤ²` at `0`, and the diagonal has cokernel `ℤ`. | holds | none |
| R01 repair | patched copy of `Suggested.lean` | Exits 0 with 44 `sorry` warnings. The `#check` types of the six 6.6 declarations match README (a)–(d). | elaborates | R01 |

- **Gate:** worker's gate at 119dbd3 `build=3 FAIL` (R01), 0 on every other check; rerun without the build: only `NOT IN ORDER`; depcheck (candidate order, `--movable`): "206 roadmaps, 1897 edges, 0 problem(s)"; outside-folder diff empty.
- **Elaboration:** head exits 1 (514:25, 523:25); patched copy exits 0 with 44 `sorry` warnings; `#check @` of 19 declarations agrees with the README, no lost binder; one-tactic probe fails on all four 6.6 theorems.
- **Source locators read against the text, 18:** caramello2012 (7), hofmann-lawson1978 Def 4.1 (line 521), isbell1981 Thms 1–2 (lines 53, 62), isbell1972 pp. 14, 18, 22, 30, 31, stone1948 Thm 3 p. 980 (line 148), bannister2024 Cor 3.13 (line 414).
- **Library declarations opened at the pin, 12:** `Canonical.lean` 103, 129, 163; `DenseSubsite/Basic.lean` 530, 788; `Sites/Sheaf.lean` 438; `Retract.lean` 27; `Projective/Basic.lean` 48; `AdjointFunctorTheorems.lean` 105, 119; `LocallySurjective.lean` 377, 491; neither pin has rigid topologies or irreducible objects.
- **Cross-roadmap citations resolved, 3:** AdicSpacesPartII R0.19.10 (main, line 8005); AdicEtaleGeometry A1.15 (main, lines 5673, 5763); DiamondEtaleCohomology "Topological open extension by zero" (its open head, line 151).
- **Ownership:** only this roadmap owns rigid topologies and irreducible objects; ClassifyingTopoi's head cites Conventions 1, 4 and 1.1, 1.2, 2.1, 2.2, 2.4, 2.5, 4.1, 4.2, 6.1, 6.5, 6.6, as Downstream consumers says; TotallyDistributiveTopoi cites 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5, 7.1; no dropped id.

## Not verifiable

- SGA 4, Elephant, Mac Lane–Moerdijk, Stone Spaces, Picado–Pultr, Gierz et al., Kashiwara–Schapira 1990 and Godement are paywalled books. The sampled 2.2, 3.1, 4.1, 4.3, 4.4, 4.5, 5.4, 7.4 and 8.1 cite only them, so their mathematics was recomputed in the table instead.
- isbell1972 is an OCR scan. The OCR loses the statement line of 2.4 on p. 18. The remark before it and its proof, at lines 538–548, are legible.

## Source issues

- **Error** in caramello2012 at Proposition 2.6 (iii), p. 180: the source says that, for every site, `ℓ(c)` is irreducible exactly when every `J`-covering sieve on `c` is maximal; it should be stated only for subcanonical `J`, since on the site `d → c` with `{f}` covering, `ℓ(c) ≅ 1` is irreducible but `c` is not `J`-irreducible; affects nothing.
