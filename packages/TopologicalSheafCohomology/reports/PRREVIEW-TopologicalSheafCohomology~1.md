# Review of TopologicalSheafCohomology (pull request #973 at 6e3d3a9)
**Verdict:** needs changes

:robot: Independent AI review. Four blocking findings concern supplier direction, overlapping ownership, and the missing acceptance statements. The supplied gate passes; the requested direct Lean elaboration also passes. No change was made to the pull request.

## R01 (P1) — Break the reciprocal supply with CharacteristicClasses

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:90`, TS3.7: “then compose with CC's `cechSingularCWTypeComparison`”. Also lines 13 and 139.

**Claim:** CharacteristicClasses C1.2b supplies a comparison to TS3.7, while this roadmap supplies C1.2b's foundational Čech construction.

**Witness:** On main, `TauCetiRoadmap/CharacteristicClasses/README.md:449` explicitly consumes TS1.1–TS1.2; line 462 constructs `cechSingularCWTypeComparison` from those inputs. Thus the roadmap-level edges are TS → CC and CC → TS.

**Repair:** Establish one direction of supply. For example, put the generic cover/refinement foundation in an earlier independently owned supplier, or keep TS as supplier and move the CC-dependent overlap comparisons to a downstream Part II, relocating independent support prerequisites if necessary. Do not merely label the return edge an overlap check. The proposed dependency graph must admit one roadmap merge order. On the witnessed pair, either repair must remove one of the two arrows; ordering the internal TS layers alone leaves both arrows present.

The prescribed mechanical check returned zero problems (output below). It does not negate this explicitly resolved reciprocal citation; this is a manual finding, not an invented UPWARD/CYCLE output line.

## R02 (P2) — Import the existing Godement construction

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:33`, TS0.1: “Construct an R-linear Godement resolution from products of skyscraper stalk R-modules and prove its exactness and functoriality.”

**Claim:** This roadmap owns the Godement resolution and its basic exactness/functoriality.

**Witness:** Main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3391` already specifies Godement resolutions for abelian sheaves and O_X-modules on topological spaces, including augmentation, flasqueness, exactness, restriction and cohomology comparison through line 3397.

**Repair:** Import SchemeAndStackFoundations §2.5 by name and section. Keep only the explicitly identified adapter from its ring-sheaf modules to this roadmap's constant-R `ModuleCat` sheaves and any genuinely additional scalar comparison. If a precise adapter is missing from that supplier, own it here or declare the precise supplier gap; do not reconstruct the resolution. On a point with coefficient module ℤ, both proposals give degree-zero cohomology ℤ and zero higher cohomology, so a different coefficient presentation does not distinguish a new resolution theorem.

## R03 (P2) — Resolve ownership with the earlier ImplicitAtlases roadmap

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:13`, ownership of compact Čech/K-sheaf theory, and lines 53–70, 114–134, 143–153.

**Claim:** These sections own K-sheaves, purity, closed-subset duality and finite interval gluing.

**Witness:** The supplied open head's `TauCetiRoadmap/ImplicitAtlases/README.md:9` claims these same objects. Its §§0.6–0.11, especially lines 173, 210–214 and 258–264, state the same constructions and theorems. ORDER places ImplicitAtlases at 200, this roadmap at 283.

**Repair:** Cite the earlier owner for the shared constructions and state precisely the extensions retained here. Alternatively, coordinate an explicit transfer of ownership, removing the duplicated targets from ImplicitAtlases and correcting the supplier order before this folder is accepted. A scope sentence excluding implicit-atlas geometry does not resolve duplicate ownership of its generic Layer 0. The constant identity diagram on {0<1} gives the same complex ℤ → ℤ², x ↦ (−x,x), and H⁰=ℤ in both specifications; these are the same construction, not two application-specific variants. No fully qualified Lean-name collision was found; the defect is mathematical ownership.

## R04 (P2) — State the headline theorems that the pins already support

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean:6`, “The advanced comparison, purity and duality targets are stated in the README”, and the whole declaration block, lines 23–126.

**Claim:** An interface sketch substitutes for an acceptance test; no headline theorem is stated, and the docstring gives neither a theorem-by-theorem omission list nor the missing carriers.

**Witness:** TS3.5's proper finite-fiber stalk theorem elaborates using only `import Mathlib`, native pushforward/stalks/products, one short definition of the canonical map, and one theorem with `sorry`. It requires no K-sheaf carrier.

**Repair:** State this theorem and audit every other headline listed below. For genuinely unavailable carriers, name the individual theorem and the precise missing construction in the module docstring. Keep only simple definitions needed by retained headlines. The tested TS3.5 signature has commutative R, locally compact Hausdorff X,Y, proper f, finite fibers, every R-module sheaf F, every y, and concludes that the actual map `(f_*F)_y → ∏_(f x=y) F_x` is an isomorphism. Its two-point-to-point instance is ℤ² → ℤ², the identity on the two stalk coordinates; the empty-fiber instance is 0 → 0. This supplies a concrete acceptance statement without weakening the README.

## R05 (P3) — Delete elementary API padding from Suggested.lean

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean:56`, `compactRestriction_refl`; line 61, `compactRestriction_comp`; line 112, `interval_le_iff`; and the two examples at lines 24 and 30.

**Claim:** These declarations test the completion of this roadmap.

**Witness:** On a scratch copy, the three theorem proofs close respectively with `simp [compactRestriction]`, `simp [compactRestriction, ← Functor.map_comp, ← op_comp]`, and `exact Iff.rfl`. Both examples already consist of one existing Tau Ceti declaration.

**Repair:** Delete them from `Suggested.lean`; keep the restriction laws and interval-order checks in the README. The examples merely invoke `TauCeti.Topology.isFlasque_of_injective` and `TauCeti.koszulBraiding`, and do not test a nontrivial kept definition. Delete unused carrier aliases/adapters too, after selecting the actual headlines under R04. For the constant ℤ functor on nested compact sets the first two laws are id=id and id∘id=id; the interval equivalence unfolds to the same two inequalities on both sides. Proving these in place does not address padding.

## R06 (P3) — Attach exact source locators to the targets

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:167`: “version6, AppendixA.1–A.8”; targets throughout TS0–TS5. The folder contains no `sources.toml`.

**Claim:** One appendix-wide bibliography entry identifies the sources for all these theorems and their strengthened variants.

**Witness:** TS2.4 is Pardon Definition A.5.1, Lemma A.5.3 and Proposition A.5.4, printed p.124; TS4.2 is Lemma A.6.4, p.127; TS5.4 is Lemma A.8.2, p.129. None is attached to its target.

**Repair:** Give each definition/theorem its own theorem/section and printed-page locator, record each cited work once in `sources.toml`, and distinguish the roadmap's extensions from results literally stated in the source. For TS4.0d, add Hatcher Proposition 3.29, p.239, alongside Lemma 3.27, pp.236–238: the latter states compact-relative vanishing, not the final absolute noncompact vanishing statement. The source table below supplies verified locators for the sample. In particular the nonempty ℝ⁰ case has H₀=ℤ, while Proposition 3.29 assumes noncompactness; preserve the existing dimension-zero exception.

## R07 (P3) — Give each definition three discriminating Checks

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:39`, independent-parity adapter; lines 53–58, K-sheaves; lines 143–149, interval totals. Line 161 is the single pooled acceptance paragraph.

**Claim:** The pooled examples provide the required per-definition checks and convention witnesses.

**Witness:** There are no `**Checks.**` blocks. TS0.4 gives both sign formulas but computes neither; TS5.1 requests the empty/singleton cases elsewhere without computing its two-element differential.

**Repair:** Attach at least three computed positive, negative and boundary examples to each definition, retaining its API list. For independent parity use (q,r,τ_A,τ_B)=(0,0,1,1), giving transported swap −1 versus naive Koszul +1; τ_A=1,r=1 gives conjugation −1; τ_A=0 gives +1. For flags use the empty total 0, singleton total A, and {0<1} with differential x↦(−x,x); zero endpoint maps instead give H⁻¹=ℤ and H⁰=ℤ². These tests distinguish the wrong signs and a missing quasi-isomorphism hypothesis. Keep the existing half-line cone and nonzero-empty-presheaf examples with the definitions they test.

## R08 (P3) — Supply the requested layer structure and item-level dependencies

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:1`, title; lines 31–153, numbered TS paragraphs; lines 155–159, global proof-order prose.

**Claim:** A global dependency narrative specifies the inputs to each individual target.

**Witness:** The README has zero `*Needs:*` lines, no exact supplier-contract section, no per-layer Examples/Dependencies sections, and no opening Summary paragraph. TS0.1 asks that categorical hypotheses be stated instead of listing a precise contract.

**Repair:** Use the prescribed `# Roadmap: …`, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and Layer/subsection structure. Preserve the mathematics; split compound paragraphs into individually sourced targets with their own inputs and explicit hypotheses. For example, the TS3.5 stalk formula needs properness and finite fibers; TS3.6's invariant comparison additionally needs |G| invertible. Their point tests differ: direct-image stalks need no averaging, whereas the sign ℚ[C₂]-module has invariant stalk 0. A common undifferentiated dependency sentence hides that distinction. Replace the Mathlib pull-request-number prose at line 169 with a timeless API/provenance citation consistent with house style.

## R09 (P3) — Reconcile the Lean names and declaration documentation

**Location:** `TauCetiRoadmap/TopologicalSheafCohomology/README.md:47`, `cechDerivedComparison`; `Suggested.lean:68`, `compactStalkMap`, and lines 108, 112, 124.

**Claim:** Backticked local API names identify declarations in Suggested.lean, and its declarations are documented and mirrored in the README.

**Witness:** `cechDerivedComparison`, `alphaCompact` and `alphaOpen` have no declaration in Suggested.lean. Conversely `compactRestriction_refl`, `interval_le_iff` and `IsWeaklyLocallyBoundedBelow` are not named in the README. Several definitions/theorems have no declaration docstring.

**Repair:** After R04/R05, name each retained Lean declaration in the README, document it, and add the required layer comments. Express future constructions in prose when not declared; do not add placeholder data just to satisfy a name check. The native library names and upstream design names must be clearly distinguished from this roadmap's own declarations. This reconciliation changes no mathematics: the checked restriction direction remains F(L)→F(K), and weak lower vanishing retains ∀x ∃U ∃N ∀K⊆U ∀i≤N.

## Verified sound

### Scope, gate, and build evidence

Read the normative repository README and CONTRIBUTING, the complete target README and Lean file, and main-roadmap material from AlgebraicTopology, DGAInfinity and ComplexKahlerGeometry for shape and ownership. Main was `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`; the reviewed head is the requested `6e3d3a95ba905d8a66ce20c5cf3a8aef989890e9`. The pinned Mathlib commit is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The worker gate reports every check passing, including the targeted module build, dependency scan, imports, metadata and outside-folder scan. Independently checked the head, the empty outside-folder diff, all three tracked folder files, and the absence of sorry-data, admitted examples and set_option in the target Lean file. There is no computational-algorithm target or route-specific coefficient shortcut. The finite quotient statement retains invertibility, ineffective actions and fixed points; the duality target retains wild closed subsets and non-second-countable Hausdorff manifolds.

Built exactly the two imported Tau Ceti modules successfully (2203 jobs), then ran the required direct Lean elaboration on `TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean`: exit 0, no diagnostics. A single scratch copy with `#check @name` for all 19 named declarations also elaborated. No needed section hypothesis disappeared: singleton/refinement constructions correctly omit R, interval indices correctly omit R and X, and the parity/diagram carriers correctly omit X. There are no sorried theorems to probe in the submitted file. The three elementary proved theorems passed the one-tactic probes in R05. The separate R04 native-map headline probe elaborated with only the intended sorry warning; it is a statement-availability test, not a proof of the theorem.

The prescribed dependency check output was exactly:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was printed. All five explicit roadmap citations were resolved: AlgebraicTopology, CharacteristicClasses, ComplexKahlerGeometry, DGAInfinity and Orbifolds. None of their cited sections was missing. There are no declared supplier gaps. R01 records a reciprocal supplier edge that the mechanical check did not report.

### Pinned declarations opened

Paths in this table are relative to the named library repository at the pins above.

| Library file and line | Declaration/body read | What it supplies, and the boundary checked |
|---|---|---|
| Mathlib `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65` | `CategoryTheory.cechComplexFunctor` | Tuple-indexed native complex; degree n uses Fin(n+1)→ι. No covering condition, no distinct-index restriction, no Čech/derived theorem. |
| Mathlib `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | `CategoryTheory.Sheaf.H` | Ext from the constant integral sheaf, for abelian sheaves. Does not silently furnish the R-linear comparison. |
| Mathlib `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:84` | `CategoryTheory.Sheaf.H'` | Open/object cohomology with explicit sheafification and Ext hypotheses. |
| Mathlib `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:51` | standing hypotheses and `Sheaf.H.δ` | Abelian-sheaf connecting map; the module comparison must carry its own R-action. |
| Mathlib `Mathlib/Topology/Sheaves/Sheaf.lean:107` | `TopCat.Sheaf` | Native site-sheaf wrapper, with no separation or local compactness built into X. |
| Mathlib `Mathlib/Topology/Sheaves/Flasque.lean:48` | `TopCat.Presheaf.IsFlasque` | Every restriction map is epi; no injectivity assumption or converse built into the definition. |
| Mathlib `Mathlib/Topology/Sheaves/Functors.lean:60` | `TopCat.Sheaf.pushforward` | The native direct image used in the successful headline probe. |
| Mathlib `Mathlib/Topology/Sheaves/Stalks.lean:76`, `:82`, `:172` | `stalkFunctor`, `stalk`, `stalkPushforward` | Actual stalk objects and canonical coordinates for the finite-fiber map. |
| Mathlib `Mathlib/Topology/Maps/Proper/Basic.lean:77` | `IsProperMap` | Continuity plus the filter cluster-point lifting property; neither finite fibers nor Hausdorffness is part of it. |
| Mathlib `Mathlib/CategoryTheory/Category/Preorder.lean:76` | `homOfLE_comp` | Native thin-category composition underlying the restriction padding probe. |
| Tau Ceti `TauCeti/Topology/Sheaves/Flasque.lean:75`, `:149`, `:156` | `isFlasque_of_injective`, `subsingleton_H'_succ_of_isFlasque`, `subsingleton_H_succ_of_isFlasque` | Injective→flasque and positive-degree acyclicity for abelian sheaves on arbitrary topological spaces. |
| Tau Ceti `TauCeti/Algebra/Homology/Monoidal/Braiding.lean:91`, `:380` | `koszulBraidingSummand`, `koszulBraiding` | Component sign (−1)^(pq), and actual chain isomorphism. Independent parity is an additional adapter. |
| Tau Ceti `TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean:61`, `:84`, `:145` | free-Yoneda functor, section equivalence, monicity | Existing abelian free-sheaf infrastructure, not a reason to assume forgetting module-sheaf injectives preserves injectivity. |
| Tau Ceti `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean:198`, `:309`, `:321` | augmentation and its quasi-isomorphism criteria | Existing native augmentation; no all-cover-colimit comparison supplied by these declarations alone. |
| Tau Ceti `TauCeti/CategoryTheory/Sites/SheafCohomology/Terminal.lean:101`, `:109` | terminal evaluation comparisons | Native terminal/open cohomology comparison. |
| Tau Ceti `TauCeti/CategoryTheory/Sites/ExtensionByZero.lean:300`, `:315` | sheafified extension construction and `preservesFiniteLimits_sheafPullback` | Exact abelian preorder-site extension; TS3's module/topological adapter is a distinct obligation. |

Searched by objects in both pinned libraries, main, board packages and the supplied open work, using the roadmap grep/show tools as well as file searches. The important overlapping objects are reported in R02/R03. SchemeAndStackFoundations' main §2.5, rather than a progress/revision PR, is the supplier for Godement. The earlier open ImplicitAtlases §§0.5–0.11 must be accounted for. The broad search also returned spectral Godement constructions and interval diagrams in algebraic K-theory; those use different carriers and are not duplicates of ordinary topological K-presheaves or TS5's flag complex. The supplied SheafTheoreticSmithTheory scope concerns étale sheaf Tate quotients and Smith restriction (`TauCetiRoadmap/SheafTheoreticSmithTheory/README.md:3–16`); it does not duplicate these topological K-presheaf carriers. No duplicate fully qualified declaration in the reviewed namespace was found in the readable open heads.

Resolved main citations: AlgebraicTopology Stage 2 local coefficients and reference classes, Stage 3 excision/Mayer–Vietoris (`README.md:382`, `:471`, `:487`), Stage 6.0 integer extension (`:968`), and the explicit manifold-scope restriction preceding ordinary 6.1–6.4 (`:1005`); CharacteristicClasses S0–S5 (`README.md:331–401`) and C1.2b (`:449–474`); ComplexKahlerGeometry K2 (`README.md:270–282`); DGAInfinity Layer 0 (`README.md:263–283`). These give the stated conventions and scopes. Orbifolds is an ownership exclusion, not an input to finite quotient descent. The manual return edge in R01 is the unresolved direction problem.

### Headline inventory and acceptance coverage

The README's headline results are: module-linear derived/underlying-abelian comparison (TS0.1); compact Čech/derived comparison and bounded-below hypercohomology with both spectral sequences (TS1.3–4); open/K-sheaf equivalence (TS2.1); purity, negative vanishing and evaluation/Čech comparison (TS2.4–5); compact-support/extension/compactification comparison (TS3.1–3); proper finite-fiber direct-image comparison (TS3.5); finite quotient descent (TS3.6); arbitrary closed-subset, boundary-cone duality and its cap comparison (TS4.1–3); finite interval-total invariance, terminal contraction and pure gluing (TS5.3–4).

None appears as a headline theorem in Suggested.lean. The actual proper finite-fiber stalk map is demonstrably statable (R04). Likewise its sheaf objects and topology are already native, not a missing-site excuse. The current file does not define open/K functors, the homotopy K-sheaf predicate, cover-colimit cohomology, orientation-cone carriers, or interval totalization. Their absence from this sketch does not establish their impossibility at the pins; the required per-headline distinction between simple admissible definitions and genuinely missing constructions is itself absent. No replacement theorem about unrelated free variables was found.

The following self-contained signature probe elaborated at the pins with only the intended sorry warning. It is included to make R04 directly reproducible; it does not claim the theorem has been proved.

```lean
import Mathlib
open CategoryTheory CategoryTheory.Limits TopologicalSpace
noncomputable section
universe u
namespace ReviewProbe
variable (R : Type u) [CommRing R] {X Y : TopCat.{u}}
/-- The canonical map from a direct-image stalk to the product of the fiber stalks. -/
def fiberStalkMap (f : X ⟶ Y) (F : X.Sheaf (ModuleCat.{u} R)) (y : Y) :
    TopCat.Presheaf.stalk ((TopCat.Sheaf.pushforward (ModuleCat.{u} R) f).obj F).obj y ⟶
      ∏ᶜ (fun x : { x : X // f x = y } => TopCat.Presheaf.stalk F.obj x.val) :=
  Pi.lift fun x =>
    eqToHom (congrArg (TopCat.Presheaf.stalk ((TopCat.Sheaf.pushforward (ModuleCat.{u} R) f).obj F).obj) x.property.symm) ≫
    TopCat.Presheaf.stalkPushforward (ModuleCat.{u} R) f F.obj x.val
/-- TS3.5, with the actual stalk map and all standing topological assumptions. -/
theorem properFiniteFiberStalk [T2Space X] [T2Space Y]
    [LocallyCompactSpace X] [LocallyCompactSpace Y]
    (f : X ⟶ Y) (hf : IsProperMap f)
    (hfin : ∀ y : Y, Finite { x : X // f x = y })
    (F : X.Sheaf (ModuleCat.{u} R)) (y : Y) :
    IsIso (fiberStalkMap R f F y) := by
  sorry
end ReviewProbe
```

### Sources and the seeded sample

The brief did not provide fifteen target identifiers; it said “none found by heading”. To make the sample reproducible, enumerated the 31 TS-numbered paragraphs/subsections in document order and sampled 15 without replacement using Python Random seeded by hexadecimal `6e3d3a95`. The sample, in draw order, is TS3.2, TS0.3, TS2.5, TS3.3, TS1.3, TS0.2, TS1.2, TS5.1, TS4.3, TS1.1, TS5.3, TS2.1, TS5.4, TS4.0b, TS4.0a. The whole roadmap, including nonsampled headlines, received the adversarial pass below.

Fetched all four cited works through the sources service: Pardon arXiv 1309.2370 **v6**, Hatcher's author-hosted book, the Mathlib Čech pull request, and Riou's discussion via the public Lean Zulip archive. The initially fetched Zulip application shell contained no message; the archive supplied the actual discussion. Hatcher's first title search failed with HTTP 429; the author-hosted book then succeeded. No text remains missing, and no repository source manifest was edited. Pardon PDF/printed page numbers agree in the appendix; Hatcher printed pp.236–239 correspond to PDF pp.245–248. No published-version numbering was substituted for the explicitly cited v6.

| Sampled target | Source locator and extraction | What the text actually supports |
|---|---|---|
| TS3.2 | Pardon A.4.3, p.119; `pardon line 5240` and `pardon line 5258` | Section-support kernels and the colimit over compact supports. The README correctly distinguishes this from derived fixed supports. |
| TS0.3 | Pardon A.0.2–3, pp.113–114; `pardon line 4932`, `pardon line 4959`; A.4.13, p.122, `pardon line 5386` | Complex/total/sign conventions and a bounded-below spectral-sequence precursor. This is not an exact source locator for the new R-linear injective-resolution comparison. |
| TS2.5 | Pardon A.3.6, p.119, `pardon line 5224`; A.4.19, p.123, `pardon line 5432`; A.5.5, p.125, `pardon line 5500` | Injective-map restriction, stalk detection with lower vanishing, and open/closed purity. The README gives an actual compact-neighborhood implementation. |
| TS3.3 | Pardon A.4.5, p.120, `pardon line 5272`; A.4.7, pp.120–121, `pardon line 5280` | Compact=ordinary and extension-by-zero compact supports, including the finite support-shrinking proof. |
| TS1.3 | Pardon A.4.16–18, p.123, `pardon line 5407` | Stalk/sheafification route, but with the empty-value defect recorded below. The README repairs it. A separate exact locator is needed for the derived comparison itself. |
| TS0.2 | Pardon A.1.7, p.115, `pardon line 5022`; A.1.10, p.116, `pardon line 5079` | Finite-intersection cofinality on locally compact Hausdorff spaces and continuity for nonempty filtered decreasing compact families. |
| TS1.2 | Pardon A.4.1–2, p.119, `pardon line 5231`; A.4.4, p.120, `pardon line 5267` | Independence after cohomology, empty covers, and finite-cover cofinality for compact X. General-space point-neighborhood smallness is an explicitly additional construction. |
| TS5.1 | Pardon A.7.1–2, p.128, `pardon line 5609` | Interval arrows and direct sum over strict flags with the degree •+p convention. |
| TS4.3 | Pardon A.6.4, p.127, `pardon line 5568`; Hatcher §3.3 | Closed-subset duality and ordinary cap-duality background. Neither source names AT/CC's specific comparison square; that is an adapter target, not an imported theorem. |
| TS1.1 | Pardon A.4.1, A.4.3 and footnote 42, p.119; `pardon line 5231`, `pardon line 5262`; Riou `riou-cech line 1264` | Indexed covers, oriented ordered subsets, and the native tuple carrier. The detailed integral ordered/tuple/refinement homotopy adapter is additional work. |
| TS5.3 | Pardon A.7.3–5 and footnote 46, p.128; `pardon line 5624`, `pardon line 5632`, `pardon line 5639` | Terminal contraction with the specified right-endpoint quasi-isomorphisms, objectwise invariance and product map. The explicit shuffle/AW proof is requested here. |
| TS2.1 | Pardon A.1.4, p.114; A.1.6–8, pp.114–116; `pardon line 4992`, `pardon line 5003`, `pardon line 5027` | K-sheaf axioms, adjunction and equivalence, including left exactness rather than surjectivity of the last MV map. |
| TS5.4 | Pardon A.8.1–2, p.129; `pardon line 5657`, `pardon line 5662` | Both footprint inclusions, compatible coefficient isomorphisms, purity and the resulting H⁰ identification. |
| TS4.0b | Pardon A.6.2, p.126, `pardon line 5527`; Hatcher §3.3, pp.231–238, especially `hatcher line 10255` | Interior orientation, j_* versus j_!, boundary sequence and local relative classes. The parity shift and explicit boundary sign are additional convention adapters. |
| TS4.0a | Pardon A.6.1, p.125, `pardon line 5523`; A.6.4 footnote 44, p.127, `pardon line 5602` | No global second countability/paracompactness and the three local models for tame N. Native chart carriers remain a construction target. |

Additional headline checks: purity A.5.1–4, p.124 (`pardon line 5460`); proper finite fibers A.4.8, p.121 (`pardon line 5321`); quotient invertibility A.4.9, p.121 (`pardon line 5330`); closed-set chain continuity A.6.3, p.126 (`pardon line 5539`); duality A.6.4, p.127 (`pardon line 5568`); Hatcher Lemma 3.27, pp.236–238 and Proposition 3.29, p.239 (`hatcher line 10255`, `hatcher line 10370`). The roadmap's local-coefficient extension is explicitly additional; Pardon does not by itself provide all its naturality assertions.

The resolver's one missing-name lead, `TopologicalSpace.cechCochainAddCommGrpCatIso`, is **not** reported as a missing pinned supplier: the README explicitly cites an upstream design to follow. The fetched declaration diff lists that API (`mathlib-cech-pr line 398`–404), and Riou's concrete example uses it (`riou-cech line 1287`–1295). Its absence from both pinned source trees was independently confirmed. Riou's tuple carrier and repeated-index rationale are at `riou-cech line 1264` and `riou-cech line 773`.

### Adversarial computations

The 99 rows below record calculations, not a claim to have proved the roadmap. Unless indicated otherwise R=ℤ. In statements quantified over spaces, the actual locally compact/Hausdorff or compact hypotheses were retained. A “negative control” tests an excluded input or a plausible incorrect definition; it is not a counterexample to the qualified target. “Retain” means no mathematical change indicated by this computation. The sample and every headline are covered, together with the elementary Lean declarations and the objects touched by the findings.

| Statement or convention | Instances and values computed on the two sides | Result / change |
|---|---|---|
| TS0.1 module/abelian sections and scalar comparison | Point, F=ℤ/3, scalar 2: H⁰_R=ℤ/3 and underlying H⁰=ℤ/3; both scalar maps send 1↦2. Positive cohomology is 0 on both sides. | Retain R-linearity requirement. |
| TS0.1 coefficient change and zero ring | ℤ→𝔽₂ on a point sends 3↦1 on sections and H⁰. For R=0, every module and every cohomology group is 0. | No nonzero-ring hypothesis needed for these constructions. |
| TS0.1 free-open module and monicity | Discrete {a,b}, U={a}, V={a,b}: stalks of R_U→R_V are id:ℤ→ℤ at a and 0→ℤ at b; both kernels are 0. Hom(R_U,F)=F_a on both presentations. | Correct restriction direction and injective-flasque route. |
| TS0.1 Godement exactness | Point with module M: augmented complex is M→M→M→M…, maps id,0,id,0,…; H⁰=M, Hⁱ=0 for i>0. A zero augmentation would have kernel M. | Mathematical control passes; ownership R02. |
| TS0.1 exact-sequence normalization | Point sequence 0→ℤ --2→ ℤ→ℤ/2→0: H⁰ sequence has kernel of mod 2 equal 2ℤ; connecting map to H¹(ℤ)=0 is 0. | Retain compatibility target. |
| TS0.2 compact neighborhoods and intersections | K={0}, L={1} in ℝ: disjoint small neighborhoods have intersection ∅, matching K∩L=∅. For K=L={0}, intersections contain 0 and shrink to {0}. | Both empty and nonempty intersections retained. |
| TS0.2 inverse limits are only left exact | Point K-model: αOpen(F)(point)=M, αOpen(F)(∅)=F(∅). For a sheaf F(∅)=0; a constant nonzero presheaf has F(∅)=M instead. | Empty value is not supplied by the inverse-limit formula. |
| TS0.3 chain reindex and shift | n=1, ∂:C₁=ℤ→C₀=ℤ is ×2: raw reindex differential is +2; G[−1] differential is −2. Multipliers in q=0,1 are +1,−1; (−1)·2=(−2)·1. | Claimed multiplier (−1)^(nq) passes. |
| TS0.3 cones and long exact sequence | Cone of ×2:ℤ[0]→ℤ[0] has ℤ in degrees −1,0 with d=2; H⁻¹=0 and H⁰=ℤ/2. Cone(id) has both groups 0. | Correct cone normalization. |
| TS0.3 bounded-below totalization | Internal lower bound b=−2, total m=0: possible resolution/Čech degrees are 0,1,2, three terms. Without a lower bound, (p,q)=(k,−k) contributes for every k≥0. | Finite-diagonal assertion uses the common bound. |
| TS0.3 shift/homotopy/quasi-isomorphism invariance | ℤ[0][1] has H⁻¹=ℤ and H⁰=0. Contractible ℤ --id→ℤ has H=0 and the map to 0 induces 0≅0. | Retain, not an unrestricted unbounded assertion. |
| TS0.3 exact filtered colimits | System ℤ --2→ℤ --2→… in degree 0 has colimit ℤ[1/2]; both H⁰(colim) and colim H⁰ are ℤ[1/2], all other groups 0. | Expected exact-colimit comparison. |
| TS0.4 differential preserves τ | (q,σ)=(0,1) gives τ=1; after d, (1,0) still gives τ=1 modulo 2. Assigning τ=σ alone instead changes 1→0. | Required independent-parity data distinguish the wrong model. |
| TS0.4 tensor conjugation and interchange | q=r=0, τ_A=τ_B=1: transported symmetry is −1, plain cochain symmetry +1. For τ_A=1,r=1, conjugation is −1; for τ_A=0 it is +1. | Formula passes; add these as Checks (R07). |
| TS0.4 source shifts and Π | q=0,σ=1, shift k=1 gives new q=−1,σ=0 and τ=1; Π alone gives τ=0. Thus shift preserves τ while Π changes it. | Correct separation of shift and parity reversal. |
| TS0.4 duality hypotheses | M=ℤ/2: Hom(M,ℤ)=0 and double dual=0≠M. For M=ℤ, double dual=ℤ and ordered evaluation(1,1)=1. | Finite projectivity is essential to the claimed double-dual isomorphism. |
| TS1.1 tuple versus ordered complexes | One open U=X with F(X)=ℤ: tuple differential alternates 0,id,0,id,…; H=(ℤ,0,…). Ordered complex has only C⁰=ℤ and the same H. | Correct without division by factorials. |
| TS1.1 repeated indices/refinement homotopy | Cover (X,X) refined by (X): the two maps on C⁰=ℤ² send (2,5) to 2 and 5. Their difference is 3, the degree-zero Čech coboundary 5−2; both act identically on diagonal H⁰=ℤ. | Raw maps must remain distinct; cohomological independence is consistent. |
| TS1.1 finite-cover bound and empty cover | Two ordered indices: C²=0; tuple C² may be ℤ⁸. Empty cover of ∅ has every term 0. One-index ordered cover has C¹=0. | Ordered/tuple bound is not conflated. |
| TS1.2 small cofinal covers | Discrete two points: point-neighborhood cover ({a},{b}) refines every cover; its constant-sheaf H⁰=ℤ²,H¹=0. Empty space has the empty index family and H=0. | Smallness convention includes the required empty family. |
| TS1.2 lack of raw filteredness | On a point, maps from a one-member refinement to a repeated two-member cover choose 0 or 1. Precomposing by any nonempty covering refinement still gives constant 0 versus constant 1. | Parallel maps cannot be equalized; no raw filtered-category claim made. |
| TS1.3 Čech/derived comparison | Point and finite discrete two-point space: both theories give M and M² in degree 0, respectively, and 0 in positive degree. A one-open cover of S¹ has H¹=0 but derived H¹(S¹;ℤ)=ℤ. | Cover colimit or intersection acyclicity is necessary; retained. |
| TS1.3 zero-sheafification negative control | P(∅)=ℤ, P(nonempty)=0 on {a,b}: tuple C⁰=0, C¹=ℤ², cocycles (u,−u), boundaries 0; hence Čech H¹=ℤ. P^#=0 gives H¹=0. | Existing P(∅)=0 qualification is necessary and correct. |
| TS1.3 degree-zero gluing/restriction/coproducts | On {a,b}, sections (2,5) restrict to 2 and 5; gluing returns (2,5). F⊕G gives (F_a⊕G_a)×(F_b⊕G_b), identical under the finite distributivity map. | No sign or covariance discrepancy. |
| TS1.4 the two spectral-sequence pages | Point, sheaf complex ℤ --2→ℤ in internal degrees 0,1: displayed E₁ has ℤ→ℤ in Čech degree 0; after d₁, ℤ/2 in total degree 1. E₂ has H⁰(point;ℤ/2)=ℤ/2 there. | Both abut to H¹=ℤ/2. |
| TS1.4 uniform stabilization | b=0,m=0 allows only (0,0); r>1 has no possible source/target for a differential involving total degree 0. For m=2 there are three bidegrees and r>3 lies outside the bounded quadrant. | Stated r>m−b+1 bound is consistent. |
| TS1.4 functorial-page caution | Repeated two-open cover of a point has E₁(cochain-first)=ℤ² in degree 0; the two refinement maps still send (2,5) to 2 or 5. After horizontal cohomology, E₂=diagonal ℤ and both send k↦k. | E₁ need not descend for that filtration; README retains correct first pages. |
| TS2.1 K-sheaf empty value and stalk | Constant sheaf on discrete {a,b}: G(∅)=0, G({a})=ℤ, G({a,b})=ℤ². αOpen on {a,b} returns ℤ² and αCompact at {a} returns ℤ. | Correct contravariance and singleton evaluation. |
| TS2.1 MV is left exact, not always short exact | Constant sheaf on S¹, two compact arcs overlapping in two points: ℤ→ℤ²→ℤ² has maps k↦(k,k), (a,b)↦(a−b,a−b); final cokernel is ℤ. | Non-surjective final map allowed. Degree-zero placement need not be homotopy-K. |
| TS2.1 adjunction/unit/counit/continuity | On a point: αCompact and αOpen both return M, and unit/counit are id_M. Neighborhood compacts [−1/n,1/n] for the constant sheaf have colimit ℤ, equal to the singleton value ℤ. | Correct equivalence normalization. |
| TS2.2 homotopy-K total differential | With commuting internal d and horizontal δ, internal degree k=0: cross terms in D² are +dδ and −δd, giving 0. Using +δ in every internal degree instead gives 2dδ over ℤ. | Stated sign is discriminating. |
| TS2.2 soft examples and empty axiom | Finite discrete X and G(K)=∏_(x∈K)M: restrictions are coordinate projections, last MV difference is onto; augmented total H=0. Nonzero constant value G(∅)=M gives H⁰(∅)=M≠0. | Soft positive control; empty axiom excludes the wrong constant functor. |
| TS2.2 shifts/cones/finite filtrations | For an identity morphism of such degree-zero soft models, every evaluation cone is M^K --id→M^K with H=0; shift moves H⁰ to H⁻¹. | Closure under cones/shifts does not assert preservation of purity by shifts. |
| TS2.3 finite-cover evaluation comparison | X={a,b}, compact cover ({a},{b}): F(X)=M² and total has C⁰=M²,C¹=F(∅)=0; evaluation comparison is identity. For X=∅ both are acyclic/zero. | Empty-cover case uses the explicit axiom. |
| TS2.3 continuity alone and sheafification | The previous P with P(∅)=ℤ is continuous on this finite discrete compact poset: αOpen G=P and αCompact P=G. Čech H¹ remains ℤ although sheafification gives 0. | The added empty-value qualification is indispensable. |
| TS2.3 bounded complex invariance | On a singleton, ℤ --id→ℤ maps to zero by a quasi-isomorphism; both finite-cover totals have H=0. Shifting this complex by any integer leaves H=0. | Objectwise invariance is compatible with finite filtration. |
| TS2.4 weak lower bound and purity | On a point, ℤ in degree 0: N=−1 works, singleton concentration holds, H⁻¹=0 and H⁰=ℤ=Čech⁰. ℤ in degree −1 still has a lower bound (N=−2), but concentration fails and H⁻¹=ℤ. | Both conditions needed; no arbitrary-complex theorem inferred. |
| TS2.4 empty-space vacuity guard | X=∅: both pointwise predicates in Lean are vacuously true even for F(∅)=ℤ[0]. The homotopy-K empty axiom fails since H⁰=ℤ; imposing it gives H=0=Čech(∅). | Predicates are not misrepresented as all homotopy-K axioms. |
| TS2.5 embedding pullback and detection | Closed inclusion {0}→ℝ applied to local relative-chain model has H⁰=ℤ at {0}; identity restriction gives id_ℤ. A map ×2 on that stalk has kernel 0,cokernel ℤ/2 and is not a quasi-isomorphism. | Detection rejects a nonunit rescaling. |
| TS2.5 open/closed purity control | Discrete {a,b}, U={a}, Z={b}: pure degree-zero models restrict to M,N and glue to H⁰=M⊕N,H⁻¹=0. Put ℤ in degree −1 at b: Z restriction has H⁻¹=ℤ and fails purity. | Both restrictions are needed. |
| TS2.5 flat/K-flat tensor caution | Tensor exact ℤ --2→ℤ→ℤ/2 with ℤ/2: first map becomes 0:𝔽₂→𝔽₂, with kernel 𝔽₂. Tensor with the orientation line ℤ leaves the original maps unchanged. | Flatness warning is substantive, rank-one case safe. |
| TS3.1 extension by zero versus direct image | j:(0,1)→[0,1], constant ℤ: (j!F)_0=0, (j_*F)_0=ℤ; at 1/2 both stalks are ℤ. | The two functors cannot be identified. |
| TS3.1 exactness/base change/composition | For inclusions (0,1)⊂(−1,2)⊂ℝ, j! stalk at 1/2 is M by either composite, at 3 is 0 by either. Short exact stalk sequences are unchanged inside and become 0→0→0 outside. | Stalkwise exactness and the open-base-change pattern pass. |
| TS3.1 c-soft/acyclic compact-support comparison | On a point every module sheaf is c-soft and Γ_c=M with higher groups 0. On ℝ the constant sheaf has H_c¹=ℤ, so it cannot simply be treated as Γ_c-acyclic. | Retain actual resolution route. |
| TS3.2 fixed supports versus derived supports | X=ℝ,K={0},F=ℤ: section-support sheaf=0, all its Čech groups=0. Relative H¹(ℝ,ℝ∖{0};ℤ)=ℤ, from coker(ℤ→ℤ²). | README's negative control is correct. |
| TS3.2 support enlargement and common bounds | Finite discrete {a,b,c}, K={a}, L={a,b}: sections M→M² send m↦(m,0); enlargement to all three gives (m,0,0) by either route. | Covariant support maps are correctly oriented. |
| TS3.3 compactification and open extension | ℝ⊂S¹ with one infinity point: H_c¹(ℝ;ℤ)=ℤ and H¹(S¹;j!ℤ)=ℤ; H⁰ on both is 0. | Compactification comparison passes. |
| TS3.3 compact and empty cases | Compact point plus isolated infinity: j!M has values M,0, hence H⁰=M=H_c⁰(point;M). X=∅ gives zero sheaf on its one-point compactification and all groups 0. | The isolated-infinity convention is needed and correct. |
| TS3.3 open/closed triangle | [0,1], open (0,1), closed {0,1}: H⁰(closed)=ℤ² and H⁰(interval)=ℤ maps diagonally; quotient is ℤ=H_c¹((0,1)). | Boundary difference must be fixed by the cone convention. |
| TS3.4 ordinary cohomology is not arbitrary-sheaf homotopy invariant | Skyscraper ℤ at 0 on [0,1], point maps to 0 and 1: pullback H⁰ are ℤ and 0, although the maps are homotopic. | Explicit transport condition is necessary. |
| TS3.4 product pullback with transported coefficients | π:I→point and F=M: H⁰(I;π⁻¹F)=M and endpoint maps both send m↦m; higher groups are 0. For the unrelated skyscraper, previous row instead gives M and 0. | Correct coefficient distinction. |
| TS3.4 joint properness negative control | H(t,x)=x−tx² on I×ℝ: every slice is a proper polynomial (t=0 is id); H(1/n,n)=0. Thus H⁻¹({0}) contains an escaping sequence, unlike a compact inverse image. | Slice-wise properness does not suffice, as README says. |
| TS3.5 finite proper stalk map | Collapse {a,b}→point, stalk modules M,N: direct-image stalk M×N and fiber product M×N; canonical map (m,n)↦(m,n). For an empty fiber both sides are 0. | Correct, and statable at pins (R04). |
| TS3.5 properness is essential | (0,1)→[0,1] is injective with finite fibers but not proper: at 0, direct-image constant-sheaf stalk is ℤ and product over empty fiber is 0. | Properness cannot be dropped. |
| TS3.6 quotient invertibility | Reflection on S¹: over ℚ, H¹ action is −1 so invariants=0=H¹(interval;ℚ). Over 𝔽₂, action is +1 so invariants=𝔽₂≠0=H¹(interval;𝔽₂). | Invertibility excludes the counterexample. |
| TS3.6 stabilizers and ineffective action | C₂ acts trivially on a point with a sign ℚ-stalk: E^C₂=0, not ℚ. For a pulled-back coarse ℚ-stalk the action is trivial and invariants=ℚ. | Coarse descent does not preserve arbitrary equivariant stalks. |
| TS3.6 nonabelian groups, norm and two stages | S₃ acts trivially on ℚ: norm=6·id, average=id. A₃ then S₃/A₃ averages by 1/3 and 1/2, composite normalization 1/6. Over the zero ring all maps and modules are 0. | Correct order normalization, including nonabelian and zero-coefficient controls. |
| TS3.7 ordinary overlap and wild carrier | S¹: both Čech and singular H¹=ℤ. On the comb, near (0,1/2), a singular 0-cocycle equal to 1 on each 1/n tooth and 0 on the limit tooth has a germ; it is not locally constant at the limit tooth. | CW-type alone does not provide the claimed local singular resolution; README correctly restricts that diagram. |
| TS3.7 supported overlap | Finite CW point: both supported cochain and sheaf constructions give M in degree 0. For ℝ, both supported theories give H_c¹=ℤ; unsuppported singular H¹(ℝ)=0. | Must retain actual support comparisons; dependency R01. |
| TS4.0a chart/boundary conventions | ℝ⁰=point has local H₀=ℤ and boundary ∅. Half-line at 0 has all absolute local groups 0; at positive x, local H₁=ℤ. | Dimension-zero and boundary carriers are distinguished. |
| TS4.0b orientation transport | Reflection x↦−x on ℝ sends the chosen local H₁ generator +1↦−1. Going round the nonorientable loop in ℝP² acts by −1 on the orientation fiber. | Trivial transport is excluded. |
| TS4.0b j_* versus j_! orientation at boundary | Half-line at 0: (j_*o)_0=ℤ, (j!o)_0=0; boundary sheaf stalk=ℤ. Exact sequence there is 0→0→ℤ→ℤ→0. At an interior point it is 0→ℤ→ℤ→0→0. | Correct fiber distinction and exactness. |
| TS4.0b odd boundary map | n=1: ambient orientation parity=1 and boundary parity=0, so β has odd parity; Πo_boundary has parity=1. Outward-first β(+1)=−[0]. | The parity-shifted even-map statement is consistent. |
| TS4.0c orientation pairing/dual | Rank-one fiber with basis e: e⊗e↦1, (−e)⊗(−e)↦1. If n odd, swapping factors contributes −1 in the super category, while ordinary evaluation remains +1. | No unjustified symmetric super pairing. |
| TS4.0c nonflat local coefficients | L=ℤ/2 on ℝ: H₁(ℝ,ℝ∖{0};L)=ℤ/2 and o⊗L=ℤ⊗ℤ/2=ℤ/2. Lower local H₀=0. | No flatness of L needed for the local rank-one calculation. |
| TS4.0c tensor order | Ordinary L has parity 0, orientation parity n: swap sign (−1)^(n·0)=+1, including n odd. Dual generator evaluation also gives +1. | Agreement with AT's reversed coefficient order. |
| TS4.0d Euclidean upper vanishing | U=ℝ∖{0}, n=1: H₀=ℤ², H₁=H₂=0. U=ℝ⁰: H₀=ℤ, so the stated exception is required. | Retain low-dimensional exception; locator repair R06. |
| TS4.0d absolute/relative bounds | P=S²: H₂=ℤ, H₃=0. Pair (ℝ,ℝ∖{0}) has H₁=ℤ,H₂=H₃=0; for n=1 the claimed k>n+1 bound only concerns k≥3. | The stated bound is safe, not a false top-degree vanishing assertion. |
| TS4.0d reindexed cone floor | n=1, q=−2: M contribution has H₃ and N shifted contribution H₂; both vanish by the given bounds. q=0 can have ℤ at an included boundary point. | Uniform q≤−2 floor leaves the required degree-zero class intact. |
| TS4.1 relative K-presheaf and continuity | K=∅: C(M,M)=0. K={0}⊂L=[−1,1]⊂ℝ: relative H₁(L-support)→H₁(point-support) sends +1↦+1. Decreasing [−1/n,1/n] has colimit ℤ=point value. | Correct contravariant direction. |
| TS4.1 closed-complement MV sign bridge | On a repeated compact K=L with H⁰=ℤ: first map k↦(k,k), second (a,b)↦a−b; composite k−k=0. Negating the second summand turns (k,−k) into (k,k). | Matches AT's (i,−i) convention after the stated bridge. |
| TS4.1 convex class evaluation | In ℝ, K=[−1,1], y=0 or endpoint 1: H₁(ℝ,ℝ∖K)=ℤ→H₁(ℝ,ℝ∖{y})=ℤ sends the positive relative interval class to +1. K=∅ instead gives 0. | Nonempty convex qualification matters. |
| TS4.1 boundary-cone sign witness | M=[0,∞),N={0},K=[0,1], b=[0→2],a=[0]: ∂b=−[0] modulo chains outside K, so d(b,a)=0. β(+1)=−[0]; β⁻¹(−[a])=+1, but β⁻¹([a])=−1. | Existing correction is verified. |
| TS4.1 tame edge stalk | M=closed upper half-plane, N=nonnegative boundary ray, x=edge origin: both absolute local pairs (M,M∖x) and (N,N∖x) are acyclic, hence cone stalk=0. Interior of N has N local H₁=ℤ, giving cone H⁰=ℤ. | Correct zero edge stalk and nonzero included boundary stalk. |
| TS4.2 point/full/empty closed subsets | M=ℝ: X=∅ gives 0=0; X={0},q=0 gives H₁(relative)=ℤ=H_c⁰(point); X=ℝ,q=1 gives H₀(ℝ)=ℤ=H_c¹(ℝ). | Compact supports, not ordinary cohomology on noncompact X. |
| TS4.2 nonorientable control | M=ℝP²,X=M,q=0,L=ℤ: H₂(M;ℤ)=0=H⁰(M;o). With L=o, H₂(M;o)=ℤ=H⁰(M;o⊗o). | Orientation twist is essential. |
| TS4.2 arbitrary non-locally-contractible closed subset | X={0}∪{1/n:n≥1}⊂ℝ: H₁(ℝ,ℝ∖X)≅ker(⊕_(components of ℝ∖X)ℤ→ℤ)≅ℤ⊕⊕_ℕℤ. Čech H⁰(X;ℤ) is eventually constant integer sequences, also ℤ⊕⊕_ℕℤ. Singular H⁰ is all sequences ∏_Xℤ instead. | Wild-subset generality is meaningful; no singular-cohomology substitution. |
| TS4.2 boundary choices and infinity | M=[0,∞),X={0}: N=∅ gives 0=0; N=∂M gives cone H⁰=ℤ=H_c⁰(point;ℤ). Infinity singleton in X⁺ intersects X in ∅, so relative cone=0. | Correct N and infinity conventions. |
| TS4.3 support/cap direction | K={0}⊂L=[−1,1] in ℝ: relative top classes restrict +1↦+1. Fixed point-support section sheaf is 0, unlike relative H₁=ℤ; only after the specified duality/enlargement comparison can supports be compared. | README does not identify the two raw diagrams. |
| TS5.1 interval order and endpoints | In S={0<1<2}, (0,2)→(1,1) exists; reverse arrow does not. Removing first vertex of (0<1) lands at (1,1); removing last lands at (0,0). | Native product/OrderDual carrier has correct directions. |
| TS5.1 total degree and D² | Flag length p=1, internal q=0 contributes degree −1; deleting a vertex gives degree 0. On (0<1<2), boundary twice is ([2]−[1])−([2]−[0])+([1]−[0])=0. | Alternating endpoints and grading pass. |
| TS5.2 flag parity conjugation | p=1,τ=1 gives multiplier −1. q=0,σ=1: source flag coefficient −1; conjugation at source −1 and target +1 changes it to +1, equal to (−1)^q. | Required tensor order/sign adapter passes. |
| TS5.2 orientation change | Reversing the orientation of a 1-flag multiplies its generator by −1, so boundary (−1,+1) changes to (+1,−1); applying the same basis change recovers the original complex. | Sign-sensitive change of basis, not an unsigned equality. |
| TS5.3 terminal contraction and negative control | All three objects on {0<1} equal ℤ, endpoints id: d=(−id,id), H⁻¹=0,H⁰=ℤ, inclusion of A_11 induces id. With both endpoint maps 0: H⁻¹=ℤ,H⁰=ℤ². | Quasi-isomorphism hypothesis is necessary. |
| TS5.3 invariance/empty/singleton | Empty poset total=0; singleton total=A. A contractible objectwise diagram on a finite poset has successive graded H=0 and total H=0. | No terminal-object assertion for the empty poset. |
| TS5.3 product shuffle and flatness | Singleton diagrams with ℤ/2 in degree 0: ordinary tensor and product total are both ℤ/2, shuffle=id despite nonflat coefficients. Tensoring the exact ×2 sequence with ℤ/2 instead gives kernel ℤ/2. | Structural shuffle comparison and derived tensor invariance have different hypotheses. |
| TS5.4 footprint gluing | A={a}, U_∅=U_{a}=point, G=M: interval total has differential m↦(−m,m), H⁰=M,H⁻¹=0. A=∅ gives one interval object, not the empty total. | Correct finite-set/empty-poset distinction. |
| TS5.4 union-footprint negative control | A={a,b}, at a point let only U_{a},U_{b} contain it: active poset has two incomparable vertices, total H⁰=M²≠M. U_{a}∩U_{b}⊂U_{a,b} fails. | Second footprint condition excludes this wrong gluing. |
| TS5.4 interval-convexity negative control | Only U_∅ and U_{a,b} contain the point. For ∅⊂{a}⊂{a,b}, endpoint intersection is point but U_{a}=∅; the required inclusion would be point⊂∅. | First footprint condition is needed even to construct the stated extension maps. |
| Lean ModuleSheaf/KPresheaf/KComplex carriers | Zero sheaf gives section 0; on discrete two points the product model gives F({a,b})=M²→F({a})=M. A covariant model would instead require M→M². | Genuine native carriers; no hidden geometric hypothesis. |
| Lean singletonCompact/compactStalk/compactStalkMap | x=a: underlying compact set={a}; product model stalk=M; natural transformation ×2 evaluates to m↦2m. Empty X has no x input, so no fictitious singleton stalk. | Definitions correctly typed. |
| Lean compactRestriction and both laws | Constant ℤ functor: restriction(1)=1; reflexivity gives id=id; composition on any three nested compacts gives 1↦1↦1 versus 1↦1. | Correct but padding (R05). |
| Lean weak lower-vanishing predicate | On point with ℤ in degree −1, N=−2 works. On point with ℤ in every integer degree and d=0, each proposed N has H^N=ℤ≠0. | Predicate distinguishes bounded and unbounded examples. |
| Lean singleton-concentration predicate | ℤ[0] has H⁰=ℤ,H¹=0 and passes; ℤ in degree 1 has H¹=ℤ and fails. X=∅ makes both predicates vacuous, as already guarded above. | No silently dropped hypothesis; not a complete purity definition. |
| Lean indexedOpenCech/rawOpenRefinement | n=0 has zero tuple products; n=1 gives ℤ,ℤ,… as above. For repeated n=2 covers, two raw index maps choose 0 and 1 and remain distinct. | Real bodies retain multiplicity; no covering condition asserted by construction. |
| Lean IndependentParityComplex | Degree-zero M in τ=1 and in τ=0 are different graded families; forgetting both yields the same underlying M. Their mutual odd swap is −id versus the all-even +id. | Carrier can retain the needed extra information. |
| Lean IntervalIndex/intervalObject/interval_le_iff | a=(0,2),b=(1,1): a≤b and 0≤1∧1≤2 are both true; b≤a and 1≤0∧2≤1 are both false. | Both directions computed; equivalence is definitional padding. |
| Lean IntervalDiagram/intervalStructureMap | Identity arrow maps to id; for ℤ constant diagram on [0,2]→[1,2]→[1,1], both composite and direct structure map send 7↦7. | Finite S is not built into the carrier and is correctly reserved for finite totals. |
| Ownership statements touched by R01–R03 | TS↔CC has two opposite edges; a linear merge order needs one direction. Point Godement gives M in both owners. Two-vertex flag totals give H⁰=M in TS and ImplicitAtlases alike. | Structural failures R01–R03; numerical coincidences confirm the objects overlap. |

These computations found no additional false mathematical identity in the qualified target statements. They do not discharge the missing source contracts, ownership changes, or full theorem proofs. The listed counterexamples support the README's existing restrictions, and the proposed repairs preserve those restrictions.

## Not verifiable

- The worker's original fifteen sampled target IDs were not supplied. The replacement sample is explicitly reproducible above; it is not represented as the unavailable worker draw.
- Most individual targets have no exact locator to certify as written. The source table distinguishes direct source results from additional adapter/generalization work; an appendix-wide reference cannot certify all those added maps. This is R06, not a claim that the mathematics is false.
- No legal source remains inaccessible after the author-page/archive fallbacks. Ownership searches covered the supplied sibling tree and the relevant matches were opened; no extra unprovided PR checkout was sought. The full proofs of new R-linear, local-coefficient, spectral-sequence and comparison-map extensions are implementation work, not established merely by their passing finite examples or by Lean elaboration with sorry.

## Source issues

- **Misprint** in pardon at Lemma A.3.2, printed p.118: the source says the compact set whose inverse image is considered lies in X; it should be a compact subset of the target Y; affects a stated result.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source indexes the containing cover member by f applied to an original-cover index; it should apply f to the refining-cover index; affects a stated result.
- **Error** in pardon at Lemma A.4.16, printed p.123: the source says neighborhood-continuous K-presheaves with zero point stalks have zero Čech cohomology; it should additionally require zero value on the empty compact set; affects a stated result.
- **Error** in pardon at Lemma A.4.17 and Proposition A.4.18, printed p.123: the source says bounded-below stalkwise acyclicity or equivalence suffices under neighborhood continuity; it should also control empty-set cohomology, for example by acyclic empty evaluations; affects a stated result.
- **Error** in pardon at Lemma A.4.20, printed p.124: the source says stalk-exact sequences of neighborhood-continuous K-presheaves always give Čech long exact sequences; it should also require exactness at the empty evaluation, or zero empty values; affects a stated result.

The common witness for the last three entries is the two-point presheaf computed in the table: zero point stalks but Čech H¹=ℤ. The roadmap already repairs that issue in TS1.3/TS2.3; it is recorded here as source errata, not an additional finding against this folder.
