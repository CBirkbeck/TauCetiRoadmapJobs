# Review of QuiverRepresentations (pull request #2479 at 5a4ca69)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

The previous review of this folder listed no finding, so there is nothing to check as repaired. The passage this pull request changes (README.md:340–344) is correct at the pin; R01 and R02 are the three other places that still state the hypothesis it removes. README line numbers are at `5a4ca69`; `TauCeti/` paths are at the pinned Tau Ceti `2fd255d`.

## R01 (P3) — Scope still attaches a locality hypothesis to almost-split uniqueness

**Location:** `README.md:51–52`: "uniqueness extending any specified isomorphism of the right endpoints under local-endomorphism hypotheses".
**Claim:** The pinned uniqueness theorem needs local endomorphism rings.
**Witness:** `TauCeti/CategoryTheory/AlmostSplit/Uniqueness.lean:129`, `exists_iso_τ₃_eq (hS) (hS') (e : S.X₃ ≅ S'.X₃)`, under `[Preadditive C] [Balanced C]` only (line 92); README.md:341–342 itself says "with no locality hypothesis".
**Repair:** Replace the clause by "uniqueness extending any specified isomorphism of the right endpoints, in any preadditive balanced category,".

## R02 (P3) — §6.3 keeps the redundant locality hypothesis and its *Needs:* entry

**Location:** `README.md:950–951`: "Any almost-split sequence ending at M whose left end has local endomorphism ring, for instance a finitely generated one, has left end isomorphic to D Tr"; `README.md:971`: "finite-length locality".
**Claim:** Comparing left ends needs a local endomorphism ring at the left end.
**Witness:** `Uniqueness.lean:145`, `nonempty_iso_X₁ (hS) (hS') (e)`, has no such hypothesis; `TauCeti/CategoryTheory/AlmostSplit/Basic.lean:593`, `IsLeftAlmostSplit.isLocalRing_end`, proves locality for every almost-split left end.
**Repair:** Line 950–951: "Any almost-split sequence of A-modules ending at M has left end isomorphic to D Tr of each finite minimal projective presentation of M: compare it …". Line 971–972: "*Needs:* the pinned existence and translate theorems and native almost-split uniqueness."

## R03 (P3) — ARS II.4.1 does not state existence or uniqueness of injective envelopes

**Location:** `README.md:516–517`: "(… ASS I.5.12–5.14, pp.30–31; ARS II.4.1, over any field)"; also `README.md:121–122` and `README.md:1028`.
**Claim:** ARS II.4.1 gives every finitely generated module a finitely generated injective envelope, unique over the module.
**Witness:** `ars line 1805–1812` (II.4.1, p.40): properties of the socle; (c) reduces an envelope of a module to one of its socle. Existence and uniqueness are recalled at `ars line 1703–1707` (p.37); finite generation is II.4.6, `ars line 1893–1895` (p.42).
**Repair:** In the three places cite "ARS II.3, p.37 (existence and uniqueness, any ring), with II.4.1(c), p.40, and II.4.6, p.42 (the envelope is finitely generated)".

## R04 (P3) — BGP §2 supports only one direction of "roots are exactly the vectors of q-value 1"

**Location:** `README.md:802–803`: "its roots are exactly the nonzero integral vectors of q-value 1 (BGP §2, pp.26–28; Etingof v5 Definition 5.20 and Remark 5.21, p.89)".
**Claim:** BGP §2 identifies the roots with the integral vectors of form value one.
**Witness:** `bgp line 407` (Lemma 2.2(1), p.27): a root is integral with B = 1, nothing more. The converse for positive definite B is §3, Note 1, `bgp line 527–529` (p.30).
**Repair:** "(BGP Lemma 2.1(1), p.26, for the Cartan entries; Lemma 2.2(1), p.27, with §3 Note 1, p.30, for the roots; Etingof v5 Definition 5.20 and Remark 5.21, p.89)".

## Verified sound

Conventions of the README: A₂ is 1 → 2 with arrow a, left modules, later factor first; S₁ = (k,0), S₂ = (0,k), P₁ = (k → k), P₂ = S₂; E(d,e) = ∑dᵢeᵢ − ∑ₐ dᵢeⱼ.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Contract 340–344, `exists_iso_τ₃_eq` (changed passage) | pinned signature; rescaled dual-number sequence | binders: `[Preadditive C] [Balanced C]`, `hS`, `hS'`, `e` only; (a⁻¹,1,1): (af)a⁻¹ = f, g·1 = 1·g | pass | none |
| Scope 51–52, §6.3 950–951, 971 | same theorem; `nonempty_iso_X₁` | hypothesis count 0 for locality in both; README states 1 | fail | R01, R02 |
| 0.1 generators (ASS II.1.2–1.4, 1.8) | k×k; A₂; empty; loop | arrows alone span dim 1 of 2; e₂a = a = ae₁, e₁a = 0; path counts 0, 1, 3; loop infinite | pass | none |
| 1.1 elementary representations (ASS III.1.6, 2.4, 2.6) | A₂; loop; 𝔽₂ | P₁ = (1,1), P₂ = (0,1), regular (1,2), total 3; (X−1) ↦ −1 onto k; dual cardinality 2^ℵ₀ vs countable | pass | none |
| 2.1 Krull–Schmidt (ASS I.4.8, I.4.10) | 0, k, k²; k[ε]/ε² | summand counts 0, 1, 2; End contains nilpotent ε ≠ 0, still local | pass | none |
| 3.1 envelopes, copresentation, Morita (ASS I.5.12–5.16, I.6.3, 6.10; ARS II.2.6) | k; dual numbers; A₂; M₂(k) | kε meets ideals 0, kε, A; 0→k→A→A image/kernel kε; dim End(P₁) = 1 ≠ 3; E₁₂² = 0 | pass; ARS II.4.1 locator fails | R03 |
| 3.2 `exists_admissible_presentation` (ASS II.2.1, II.3.7, III.2.12) | A₂; dual numbers; k×k; zero algebra | ASS right-module e_a(rad/rad²)e_b ↔ left e₂(rad)e₁ = ka; Ext¹(S₁,S₂) = 1, Ext¹(S₂,S₁) = 0; loop 1 = 1; Q empty | pass | none |
| 3.3 Cartan and Euler (ASS III.3.8–3.13) | A₁; A₂; dual numbers | C = [[1,1],[0,1]], E = [[1,−1],[0,1]], CE = I, B = [[2,−1],[−1,2]]; dim e₂Ae₁ = 1 = paths 1→2; C = [2] | pass | none |
| 4.1 `pathAlgebra_higher_ext_vanish` (Crawley-Boevey p.7–8; ASS VII.1.4, 1.7(a)) | loop; dual numbers (control); pin | k[X] PID gives Ext² = 0; k[ε]/ε² has Ext²(k,k) = 1, not a path algebra; pinned `Projective/Dimension.lean:49,69,81` all acyclic or finite | pass, not at pin | none |
| 4.1 `nonempty_homDifferential_coker_linearEquiv_ext` | A₂ both orders; loop k_λ, k_μ | cokernel dims 1, 0 = Ext¹ dims; loop x ↦ μx − xλ, cokernel 1 iff λ = μ | pass | none |
| 4.1 Euler corollary | A₂; P₁; loop | −1 = 0 − 1; 0 = 0 − 0; q(1,1) = 1 = 1 − 0; loop 0 = 1 − 1 | pass | none |
| 4.2 reflections (BGP Thm 1.1; Etingof 5.26–5.27) | A₂ sink 2; k² → k; shift on k^(ℕ) | (1,0) ↦ (1,1), (1,1) ↦ (1,0), (0,1) ↦ (0,−1); (2,1) fixed, 2·1 − 2 = 0; finranks (0,0) ↦ (0,1); s₁s₂(1,0) = (0,1) | pass | none |
| 5.1 Gabriel (BGP Thm 3.1, Note 1, Lemma 2.3; Etingof 5.23) | A₂; D₄; Kronecker | 3 roots; (1;1,1,1) ↦ (2;1,1,1), q = 4−3 = 7−6 = 1; 3+8+1 = 12; q(n,n+1) = 1 | pass | none |
| 5.2 `exists_rootPairing_titsForm` | A₁; A₂; D₄; Kronecker; loop | q(1,−1) = 3; coroot 2α gives 2I and pairing 4; D₄ mixed vector q = 1+1+1 = 3; Kronecker q(1,1) = 0; diagonal entry 2 − 2·loops = 2 | pass; locator one-directional | R04 |
| 5.2 reflection preserves q | general α with q(α) = 1 | q(v − B(v,α)α) = q(v) − B² + B²q(α) = q(v) | pass | none |
| 6.1 translate, stable Hom (ASS IV.2.10–2.11; IV.2 pp.109–110) | k; dual numbers; A₂ | extending maps dim 1 of 1, 0 of 1; I₁ = S₁, I₂ ≅ P₁, Hom(P₁,S₂) = 0; τS₁ = S₂, τk ≅ k | pass | none |
| 6.2 AR duality (ASS IV.2.13; ARS IV.4.1, 4.6) | A₂ (S₁,S₂), (S₁,S₁); dual numbers | 1 = 1; 0 = 0; 1 = 1; pinned `AuslanderReiten/Basic.lean:167` has no finiteness or minimality binder | pass | none |
| 6.3 existence (ASS IV.3.1; ARS V.1.14–1.15) | A₂; dual numbers; split sequence | 0→S₂→P₁→S₁→0; dims 1,2,1; projection split epi; `Sequence.lean:70,97,110,123` as stated | pass | R02 for the left-end sentence |
| 6.4 AR quiver, mesh (ASS IV.4.1–4.4) | A₁; A₂; dual numbers | no arrows; Irr dims 1,1, Irr(S₂,S₁) = 0; ε = (k→A)∘(A→k) ∈ rad²; mesh at k: 1 = 1 | pass | none |

- Source locators checked against the cached texts: 47 (ASS 25, Etingof 7, BGP 6, ARS 5, Crawley-Boevey 4); 45 as stated, 2 in R03 and R04. The README flags none as unverified.
- Library declarations: every backticked library declaration name of the README resolves at the pins; opened with file and line: `Uniqueness.lean:92,129,145`, `AlmostSplit/Basic.lean:593`, `Sequence.lean:129`, `AuslanderReiten/Sequence.lean:70,97,110,123`, `AuslanderReiten/Basic.lean:167`, `Mesh.lean:67`, `Translate.lean:80`, `Projective/Dimension.lean:49,69,81`, `FiniteRepType/Gabriel.lean:100`.
- Cross-roadmap citations resolved on main: SemisimpleAlgebras Layers 1.5–2, RootSystems §3.1, QuiverRepresentationsPartII §§1.1–1.6 and Layers 2–4, GrothendieckEulerForms Conventions and Layers 1–5, ArtinAlgebras §2.3, §4.2, §§5.1–5.3, McKaySkewGroup "Exact supplier contracts"; all exist. ArtinAlgebras cites "6A–6F", which README.md:860–873 maps.
- Gate rerun at `5a4ca69`: every counter 0, `OK`. Dependency check: `depcheck: 237 roadmaps, 2527 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing outside the folder is changed.
- Elaboration: `lake env lean` on a scratch copy with four `#check @name` lines gives four `declaration uses sorry` warnings and no error; the four elaborated types equal the README statements (no section `variable` exists in the file, so no binder can be lost).
- Headlines and padding: the four headline theorems of the Summary are stated; the Euler–Hom–Ext identity is named in the docstring as a corollary. One-tactic probe (`simp`, `infer_instance`, `exact ⟨_, rfl⟩`, `constructor`, `exact HasProjectiveDimensionLT.subsingleton …`): 20 attempts, none closes.
- Pull-request text: title and description agree with the 4-line change and the untouched `Suggested.lean`; no finding.

Overlap check: read ArtinAlgebras, GrothendieckEulerForms, ZigzagPreprojective (main); the open RepresentationTheory and ModularCharactersAndBlocks heads were searched for the four headline objects and `exists_iso_τ₃_eq` only; nothing shared: ArtinAlgebras owns the Artin-algebra AR theory, GrothendieckEulerForms the K₀ and Cartan comparison, both as consumers here.

Source independence: 10 passages compared with 5 sources, none shared; largest share ass, 25 of 47 locators; contents compared with ass: independent (Layer 2 ↔ I.4, Layer 0 ↔ II.1, Layer 3 ↔ I.5–6 + II.2–3 + III.2–3, Layer 4 ↔ VII.1 + III.3, not a run in order).

Research link: The headlines are Gabriel's theorem in the reflection-functor form of Bernstein–Gelfand–Ponomarev (1973), the bound-quiver presentation and Auslander–Reiten theory as in Assem–Simson–Skowroński (2006) and Auslander–Reiten–Smalø (1995), and the standard resolution of Crawley-Boevey (1992); rests on the README's references and the texts read.

## Not verifiable

- Library names were resolved by search of the pinned sources and the listed declarations opened; the Tau Ceti modules that `Suggested.lean` does not import were not elaborated.

## Source issues

- none

## For the human reviewers

- **Licence.** `ass` and `ars` were read from the teaching copies linked at README.md:1025 and 1030 (a course page, manifest class `institutional`); whether the publisher authorises those copies was not settled.
- **Licence.** `cbquiv` (README.md:1034–1037) is unpublished lecture notes on the author's page; it is cited for the standard resolution and consequences (1) and (3) only.
