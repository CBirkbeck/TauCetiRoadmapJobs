# Review of OddOrderTheorem (pull request #1777 at 1812f9e)

**Verdict:** needs changes

The mathematics transcribed in this README is sound: every statement I sampled agrees with Peterfalvi Part I and Bender–Glauberman as transcribed in the math-comp odd-order development (the only legally readable witness for those two books), and the five admitted Lean statements are exactly the theorems they claim to be, at the generality the sources support. What blocks acceptance is the gate (the build counter and the import rule) and the form of both files: the README is not in TauCetiRoadmap shape (no supplier-contract section, no `*Needs:*` lines, no per-definition Checks, no theorem-level locators), and `Suggested.lean` carries four definitions that no stated theorem uses.

## R01 (P1) — the targeted build fails the gate (six Lake warnings)

Location: `TauCetiRoadmap/OddOrderTheorem/Suggested.lean` lines 1–6, the six `import Mathlib.<submodule>` lines.

Claim: `lake build TauCetiRoadmap.OddOrderTheorem.Suggested` is clean.

Witness: the worker's gate reports `build=6 FAIL`, one warning per submodule import: "imports `Mathlib.GroupTheory.Sylow` from package `mathlib`, which is designed for use with the module system; consider adding `module`". At the pinned Mathlib every library file is a module file, so a non-module importer always triggers this warning, and the gate counts every warning other than `declaration uses sorry` as a build problem.

Repair (tested on the precedent `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main, which passes the same gate): make the file a module-system file whose header is

```lean
module

public import Mathlib
public import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter

/-! ... -/

@[expose] public section

namespace TauCetiRoadmap.OddOrderTheorem
```

No declaration needs to change: the probe copy I elaborated with `lake env lean` (same declarations, same imports as the pull request) produced only the five `sorry` warnings, so the bodies are not the problem.

## R02 (P3) — import rules: `imports`, `mathlib-subimports` (×6), `no-import-mathlib`

Location: `Suggested.lean` lines 1–7.

Claim: the file imports only what the gate allows.

Witness: gate lines `no-import-mathlib: line 1: no import Mathlib line` and the six `mathlib-subimports` lines. The rule is the single line `import Mathlib` followed by the individual `TauCeti.*` modules used.

Repair: the header of R01 (one `public import Mathlib`, then the one Tau Ceti module actually used; `Mathlib.SetTheory.Cardinal.Finite` and the others are all inside `Mathlib`).

## R03 (P3) — the README is not in TauCetiRoadmap form

Location: `README.md` throughout; headings at lines 23 (`## Foundations and ownership`), 84 (`## Milestone graph`), 96–394 (`### F0` … `### F6`), 403 (`## Checks`), 412 (`## References and provenance`).

Claim: the roadmap follows the shape of the roadmaps on main.

Witness: compared with `TauCetiRoadmap/FiniteGroupExtensionSplitting` (open, by the same author) and `TauCetiRoadmap/RepresentationTheory/CharacterTheory` on main, the README lacks: an opening `**Summary.**` paragraph; `## Scope and ownership`; `## Exact supplier contracts` with `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.<X>` subsections naming the consumed declarations; `## How to read the build`; `## Layer k:` headings with `### k.n` prose subsections; a `*Needs:*` line per target; a `**Checks.**` list with at least three discriminating checks per definition (there are at least twelve definitions here: minimal odd simple group, Dade data, the Dade map, `R(S)`, `CF(L,A)`, coherent extension, `σ(M)`, `α`, `β`, narrow, `τ₁`–`τ₃`, `κ`, `H(M)`, Frobenius-type data, P-configuration, the five types; the single `## Checks` section at line 403 has four sentences for all of them); `### Examples` and `### Dependencies` per layer; `## Downstream consumers` (GlaubermanZStar Z2 consumes F2 and should be listed); `## References`. Because there are no `*Needs:*` lines, the dependency check sees no edges at all: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)` is vacuous for this roadmap. I checked the direction by hand instead (see Verified sound).

Three supplier statements also need the exact-contract form: line 39 says CharacterTheory and InductionRestriction own "Burnside's `pᵃqᵇ` theorem and the norm-one virtual-character theorem", and lines 155–157 say to consume them from CharacterTheory; all three are already in Tau Ceti at the pin and belong under `### From Tau Ceti` by name: `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` (`TauCeti/RepresentationTheory/CharacterTable/Solvable.lean:219`), `TauCeti.exists_eq_irreducibleCharacter_or_neg` (`CharacterTable/VirtualCharacter.lean:490`), `TauCeti.mem_irreducibleCharacters_of_characterPairing_self_eq_one` (`VirtualCharacter.lean:528`). Likewise "Frobenius groups and their ordinary character theory" (line 38) is Tau Ceti's `TauCeti/GroupTheory/FrobeniusKernel.lean`, `TrivialIntersection.lean` and `RepresentationTheory/Induction/ExceptionalCharacter.lean`, not a roadmap.

Repair: rewrite in the house shape. The content need not change; the `*Needs:*` lines should cite `LocalFiniteGroupTheory L1`…`L7` and `FiniteGroupExtensionSplitting §2.4, §3.1` by section as now, and the per-definition Checks can be drawn from the computed instances in the table below.

## R04 (P3) — no target carries a theorem-level locator

Location: `README.md` lines 12–13, 137, 160, 176, 198, 310, 343, 419–422: the only locators are "Bender–Glauberman", "Peterfalvi Part I §§1–6", "§3", "§§5–6", "§8", "§§7, 9–11", "§12", "§13", "§14", "Appendix C".

Claim: every theorem has a locator.

Witness: none of the roughly sixty theorems in F0–F6 names a theorem number or page. The sources are Cambridge lecture notes I could not read legally; the math-comp odd-order files (open source, read through the sources service) carry the theorem numbers in their comments, and I resolved the following, which the author can paste in:

- Dade hypothesis: Peterfalvi Definition (2.2) (MC-PF2 line 93–98); Dade map Definition (2.5); isometry (2.6)(a); integrality (2.6)(b) (MC-PF2 lines 407, 727); "every `H_a = 1` iff `A` is a T.I. set with normaliser `L`": (2.3) (MC-PF2 line 172–175); Dade = induction on `CF(L,A)` under that hypothesis: supplement to (2.3)/(2.6)(a), Isaacs Lemma 7.7 (MC-PF2 line 417–418); restriction to an `L`-invariant subset: (2.11).
- Cyclic T.I. isometry: Hypothesis (3.1), existence (3.5) (MC-PFsection3 lines 28–31, 1277, 1386), with `σ(1) = 1`, `σ = Ind` on `CF(W,V)`, each `σ(w_ij)` a signed irreducible, orthonormality (MC-PFsection3 lines 1440–1480), power-map compatibility (3.9).
- Coherence: the definition preceding Hypothesis (5.2) (MC-PFsection5 lines 483–486): an isometry on `ℤ[S]` into `ℤ[Irr G]` agreeing with `τ` on `ℤ[S, A]`, exactly the `coherenceDomain` of the Lean file.
- `α, β, σ`: B&G §10 (MC-BGsection10 lines 58–68); narrow: B&G §5 (MC-BGsection5 line 51); `τ₁, τ₂, τ₃`: B&G §12 (MC-BGsection12 lines 44–46); `κ`: B&G §14 (MC-BGsection14 lines 99–104); `σ`-complement `E = E₁E₂E₃`: B&G §12 (MC-BGsection12 line 48–50).
- F1: rank ≤ 2 ⇒ `p`-length ≤ 1: B&G Theorem 4.18(c,e); `p`-stability of solvable odd-order groups: B&G Theorem 6.1 (= A.4(b)); the Z-group theorem: B&G Theorem 3.6.
- F3b: Thompson transitivity: B&G Theorem 7.6; uniqueness: B&G §9.
- F3c: `α(M) ⊆ σ(M)`: remark before B&G 10.1; Hall cores and `M_σ ≤ M'`: B&G Theorem 10.2(a1, b1, c, e); `p`-length 1 of proper subgroups: B&G Theorem 10.6; `β` lemmas: B&G 10.4(c), 10.8.
- F3d: the type definitions: Peterfalvi §8 (MC-BGsection16 lines 110–162); the alternative: Peterfalvi Theorem (8.8).
- F4: type I is Frobenius: (12.7); not all type I: (12.17); `S` of type II when `|W₁| < |W₂|`, `|P| = p^q` elementary abelian, `|U| ≤ (p^q−1)/(p−1)`, coherence of the `S`-family: (13.2); `|U|` formula: Peterfalvi (13.?) as `card_FTtypeP_Galois_compl` (MC-PFsection13 line 1492).
- F5: Appendix C: B&G Theorem C with its hypotheses (A), (B) (MC-BGappC lines 41–48); its application: Peterfalvi (14.2); the complement `W₁W₂^y` of `L`: (14.5); `U` not characteristic in `H(L)`: (14.7); the inequalities: (14.8); `T` of type II: (14.9); `H(L) = U`: (14.16).

Repair: attach these locators at the claims (and the page numbers once a legal copy is to hand); keep "uncertified" status in `sources.toml` for the two CUP volumes.

## R05 (P3) — "both maxima are type II" is placed before its inputs

Location: `README.md` lines 335–336: "Orient them by `|W₁|<|W₂|` and prove both maxima are type II" in F4d (Peterfalvi §13).

Claim: Peterfalvi §13 proves that both `S` and `T` are of type II.

Witness: (13.2) gives only `|W₁| < |W₂| → S` is of type II (MC-PFsection13 line 198: `q < p -> FTtype S == 2`). That `T` is of type II is Peterfalvi (14.9) (MC-PFsection14 lines 736–737), proved inside the §14 section whose hypotheses are (14.3): a maximal `L ≥ N_G(U)` of type I, Frobenius with kernel `H(L)`, with a coherent family, and the inequalities (14.8). Those are F5 stage-1 objects in this README, so the F4d target needs a later layer (defect class 11).

Repair: in F4d keep "`S` is of type II (13.2)"; move "`T` is of type II (14.9)" into F5 between stage 1 (which builds `L`, its complement and the coherent family) and stage 2, and let stage 3's symmetric construction for `M ≥ N_G(V)` cite it.

## R06 (P3) — pull-request numbers and process text in the README

Location: `README.md` line 28 (`LocalFiniteGroupTheory [#1634](…/pull/1634)`), line 42 (a relative link `../FiniteGroupExtensionSplitting/README.md` to a folder that exists only on pull request #1774), line 431 ("Coordinate before adapting code"), lines 19–21 ("Suggested homes").

Claim: cross-roadmap citations name the roadmap and its section, never a pull-request number; the text is timeless.

Witness: the policy list in the brief; the gate's `prnum` scanner does not catch a number inside a link target.

Repair: cite `LocalFiniteGroupTheory L1–L7` and `FiniteGroupExtensionSplitting S0–S3` by name and section without links or numbers; delete "Coordinate before adapting code"; the suggested file homes can stay if phrased as the intended library location.

## R07 (P3) — `Suggested.lean` docstring and binders

Location: `Suggested.lean` lines 9–15 and 71, 91.

Claim: the module docstring is "<title>: target signatures", says the roadmap is `README.md`, that the file states the headline theorems against the pinned APIs, and names each headline that is not statable at the pins with what it lacks.

Witness: the docstring says "suggested interfaces … not exhaustive … suggested forms for selected targets". The headlines that are not statable are unnamed: the five-type theorem and Peterfalvi (8.8) (no carrier for maximal-subgroup types, `H(M)`, `σ(M)` cores), the type-I Frobenius theorem (12.7), the coherence theorems of §§5–6 (no induced families), the Thompson transitivity theorem (no `SCN₃`, no `O_{p'}`), B&G 10.6 (no `p`-length). Also `exists_dadeExtension` (line 71) and `IsCoherent` (line 91) carry both the section's `[Finite G]` and an explicit `[Fintype G]`; one suffices (`Fintype`, for the sums).

Repair: rewrite the docstring in the required form with that list; drop the redundant `Finite` binder where `Fintype` is added (or state the sums with `Finite` via `Nat.card` and `Finset.univ` under `Fintype.ofFinite`).

## R08 (P3) — four definitions no stated theorem uses

Location: `Suggested.lean` lines 82–98 (`familySpan`, `coherenceDomain`, `IsCoherent`) and 103–105 (`sigmaPrimes`).

Claim: `Suggested.lean` contains only the simple definitions a stated headline needs.

Witness: the file's five theorems mention `IsMinimalOddSimple`, `DadeDatum` and `supportedClassFunctions` only. `IsCoherent`, `coherenceDomain`, `familySpan` and `sigmaPrimes` appear in no theorem; they are an API catalogue. (Their bodies are right: `coherenceDomain L A S = ℤ[S] ⊓ CF(L,A)` is math-comp's `'Z[S, A]`, and `IsCoherent` is `coherent_with` with an additive `ν`, MC-PFsection5 lines 483–486; `sigmaPrimes` is B&G's `σ(M)`, MC-BGsection10 line 67–68.)

Repair: delete the four from `Suggested.lean` (the README keeps them as targets). If the author wants the reusable F2 export consumed by GlaubermanZStar Z2 to be an acceptance test, the statable one is the Dade/induction comparison: under `DadeDatum L A H` with `∀ a ∈ A, H a = ⊥`, the `T` of `exists_dadeExtension` agrees with `Subgroup.indClassFunction L` on `supportedClassFunctions L A` (`Subgroup.indClassFunction` exists at the pin, `TauCeti/RepresentationTheory/Induction/TrivialIntersection.lean:147`).

## R09 (P3) — README and Lean names do not agree

Location: `README.md` line 8 (the only backticked Lean name of this roadmap, `isSolvable_of_odd_natCard`); `Suggested.lean` lines 22–125.

Claim: every Lean name appears in the README.

Witness: `IsMinimalOddSimple`, `not_isMinimalOddSimple`, `even_natCard_of_nonabelian_simple`, `DadeDatum`, `supportedClassFunctions`, `exists_dadeExtension`, `familySpan`, `coherenceDomain`, `IsCoherent`, `sigmaPrimes`, `appendixC_prime_le` (11 of 12) occur nowhere in the README; line 351 refers to "the Lean prototype" instead of naming `appendixC_prime_le`.

Repair: after R08, name the remaining eight declarations at their README targets (F0 for the three endpoint statements, F2 for `DadeDatum`, `supportedClassFunctions`, `exists_dadeExtension`, F5 for `appendixC_prime_le`).

## Verified sound

**Gate and build.** Re-ran the gate on this head: identical counters to the worker's (`imports=1 mathlib-subimports=6 no-import-mathlib=1`; `build=6` from the worker's run). Elaborated a probe copy of the file (all declarations except `appendixC_prime_le`, plus `#check @` for each) with `lake env lean`: the only warnings are the four `declaration uses sorry`; the elaborated types coincide with the worker's `signatures.md`, and the seven "dropped `[Finite G]`" leads are harmless: `IsMinimalOddSimple` is false without finiteness only through `Odd 0`, which `Nat.card` of an infinite type makes false anyway, and the five definitions are total objects whose statements never need finiteness; the theorems all keep `[Finite G]` or `[Fintype G]`.

**One-tactic probe (padding).** `not_isMinimalOddSimple` with `simp [IsMinimalOddSimple]`: no progress. `isSolvable_of_odd_natCard` with `infer_instance`: instance not found; with `simp_all`: no progress. `even_natCard_of_nonabelian_simple` with `simp_all`: no progress. `appendixC_prime_le` with `omega`: fails. `exists_dadeExtension` with `simp`: unsolved goals. Nothing in the file closes in one tactic; no declaration mirrors a Check or computes a value.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)`, no UPWARD or CYCLE line, no `moved:` line (vacuous, R03). By hand: the README's suppliers are Mathlib, Tau Ceti, CharacterTheory and InductionRestriction (both on main under `TauCetiRoadmap/RepresentationTheory/`), LocalFiniteGroupTheory (open pull request #1634 by another author, new folder: layers `## L1`–`## L7` exist with the cited content: L1 cores and Hall subgroups, L3 Thompson's `A × B` lemma, L4 replacement theorems, L5 `IsPStable p G` definition, `ZJ` and normal complements, L6 fixed-point-free automorphisms, L7 solvable signalizer functors) and FiniteGroupExtensionSplitting (open pull request #1774, new folder: `### 2.4 Gaschütz's splitting theorem`, `## Layer 3: Sylow detection and invariant complements (S3)`). None of these cites OddOrderTheorem. GlaubermanZStar (open pull request #1778) cites `OddOrderTheorem F2` as a supplier and declares only `glauberman_zStar`, `glauberman_zStar_sylow`, `brauer_suzuki`, `ZStarConclusion`, `InPrincipalTwoBlock` and two principal-block theorems in its own namespace: no shared fully qualified name, no cycle. Neither supplier pull request is in the merge order; this roadmap sits last (line 374) and is placed after its suppliers.

**Ownership and duplication.** `roadmaps grep` over the 440 open pull requests and main for `Dade`, `Feit.Thompson|odd order theorem`, `coherent (family|extension)`, `Thompson transitivity`, `p-length`, `minimal (odd )?simple`: no other roadmap states the odd order theorem, a Dade isometry, coherence, `σ(M)` or the five types (CFSGStatement and CFSGBasicProperties mention Feit–Thompson as a prerequisite only; ModularCharactersAndBlocks mentions it in passing). Mathlib at the pin has no Hall subgroups, Fitting subgroup, `π`-cores or `p`-length (grep of `Mathlib/GroupTheory`), so the F1/F3 objects are rightly imported from LocalFiniteGroupTheory. Tau Ceti at the pin has none of the Dade/coherence objects (`grep -r Dade` empty). This roadmap is the owner of F0–F6.

**Library declarations opened at the pin.** `TauCeti.ClassFunction k G : Submodule k (G → k)` (`CharacterTable/ClassFunction.lean:53`); `TauCeti.virtualCharacters : AddSubgroup (G → k)` (`VirtualCharacter.lean:132`); `TauCeti.IsTISet (S : Set G) (H : Subgroup G)` with fields `subset`, `conj_mem` and "a conjugate by `g ∉ H` is disjoint from `S`" (`GroupTheory/TrivialIntersection.lean:194`); `TauCeti.IsTISubgroup` (`:115`); `TauCeti.IsFrobeniusComplement` = `ne_bot ∧ ne_top ∧ IsTISubgroup` (`:326`); `TauCeti.characterPairing_ind_ind_of_isTISet [Fintype G] (hG : IsUnit (Nat.card G : k)) (hH : IsTISubgroup H) (hne_top : H ≠ ⊤) (hS : IsTISet S H) …` (`RepresentationTheory/Induction/TrivialIntersection.lean:144`): the README's remark at lines 162–164 that this lemma carries an extra `IsTISubgroup` hypothesis is correct; the three CharacterTheory names of R03; Mathlib `IsZGroup` (`GroupTheory/SpecificGroups/ZGroup.lean:39`), `Subgroup.normalizer (S : Set G)` (`Algebra/Group/Subgroup/Defs.lean:669`), `rootsOfUnity (k : ℕ) (M) [CommMonoid M] : Subgroup Mˣ` (`RingTheory/RootsOfUnity/Basic.lean:56`), `Sylow` (`GroupTheory/Sylow.lean:54`), `IsMulCommutative`, `Group.IsSolvable`, `IsSimpleGroup` (extends `Nontrivial`).

**Sources read.** Feit–Thompson 1963, all six chapters from MSP's open archive (FT63; the OCR is poor but Definition 9.1 "tamely imbedded subset", printed pp. 803–804, is at FT63-p03 lines 38–59: `L`-fusion control, a normal complement `H_i` to `C_L(a)` in `C_G(a)` with `(|H_i|, |C_L(L)|) = 1`, matching `DadeDatum`). Peterfalvi 2000 and Bender–Glauberman 1994 are Cambridge volumes with no legal copy here; I read the math-comp odd-order sources (CeCILL-B, fetched as author-page texts), whose comments give the theorem numbers quoted above.

**Adversarial table.** Instances and the values computed on each side.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsMinimalOddSimple G` | trivial group; `C₃`; `S₃`; `A₅`; `C₇ ⋊ C₃` | trivial: `IsSimpleGroup` needs `Nontrivial` → false. `C₃`: odd, simple, but `IsMulCommutative` → false. `S₃`, `A₅`: `Nat.card` = 6, 60 even → false. `C₇ ⋊ C₃`: order 21 odd, not simple (`C₇` normal) → false | no instance; predicate is the conjunction Peterfalvi §8 assumes (`minSimpleOddGroupType`) | none |
| `isSolvable_of_odd_natCard` | trivial group; `C₇ ⋊ C₃`; infinite `G` | 1 odd, solvable ✓; 21 odd, solvable (derived series `C₇ > 1`) ✓; infinite: `Nat.card = 0`, `Odd 0` false, and `[Finite G]` is in scope | matches math-comp `Feit_Thompson` (MC-PFsection14 line 1259) | none |
| `even_natCard_of_nonabelian_simple` | `C₂`; `A₅`; trivial group | `C₂`: abelian, excluded; `A₅`: 60 even ✓; trivial: not simple | matches `simple_odd_group_prime` (MC-PFsection14 line 1263) | none |
| `not_isMinimalOddSimple` | equivalence with the endpoint | a minimal odd simple group is odd and nonsolvable; conversely a nonsolvable odd group has a minimal nonsolvable section, simple nonabelian with solvable proper subgroups (F0) | consistent both ways | none |
| `DadeDatum L A H` vs Peterfalvi (2.2) | field by field against MC-PF2 lines 94–98 | `A <| L` = `subset` + `invariant`; `1 ∉ A` = `subset`; (a) fusion = `fusion`; (b) `H a ><| C_L(a) = C_G(a)` = `centralizer`, `normal`, `disjoint`, `product`; (c) = `coprime` (quantified over both `a, b`) | exact match; nothing weaker, nothing stronger | none |
| `DadeDatum`, degenerate | `A = ∅`; `G = S₃`, `L = ⟨(12)⟩`, `A = {(12)}`, `H a = ⊥` | `A = ∅`: all fields vacuous, holds; `supportedClassFunctions = {0}`, `T = 0` satisfies the theorem. `S₃`: `C_G((12)) = L = C_L(a)`, `H a ∩ C_L(a) = 1`, `H a · C_L(a) = C_G(a)`, `gcd(1, 2) = 1`, G-conjugates of `(12)` in `A`: only itself ✓ | holds; both are instances of (2.3)'s T.I. case | none |
| `exists_dadeExtension`, isometry and values | `S₃` instance, `f = 1_L − sgn_L` (degree 0, supported on `A`) | `T f = Ind 1 − Ind sgn = (1 + χ₂) − (sgn + χ₂) = 1 − sgn ∈ ℤ[Irr S₃]`; `(T f)((12)) = 2 = f((12))`, `(T f)(3‑cycle) = 0`, `(T f)(1) = 0`; `(1/6)Σ|Tf|² = (1/6)(0 + 3·4) = 2 = (1/2)(0 + 4) = (f,f)_L` | all three conjuncts hold with equality | none |
| `exists_dadeExtension`, wrong model | `T f` plus a function `e` supported off `⋃(aH_a)^G` | `‖Tf + e‖² = ‖Tf‖² + ‖e‖² > ‖f‖²` for `e ≠ 0` | the isometry conjunct excludes it; the support statement is a README target (line 148) | none |
| Hermitian vs bilinear pairing (Conventions, line 63) | characters `χ`; `ℤ`-combinations | `conj χ(g) = χ(g⁻¹)` for every character, extended `ℤ`-linearly | the two pairings agree on virtual characters, as stated | none |
| `supportedClassFunctions L A` | `A = ∅`; `A = L \ {1}`; `A = L` | `{0}`; class functions vanishing at 1, i.e. degree 0; all class functions | a `ℂ`-submodule in each case; `1 ∉ A` makes `CF(L,A) ⊆` degree 0 | none |
| `coherenceDomain L A S` vs `'Z[S, A]` | `S = Irr L`, `A = L \ {1}` | `ℤ[Irr L] ⊓ CF(L, L\{1}) = ℤ[Irr L]₀` | equals math-comp `'Z[S, A]` (MC-PFsection5 line 484) | none (R08: unused) |
| `IsCoherent` | `S = ∅`; `L = G`, `S = Irr G`, `A = G\{1}`, `τ` = inclusion | `familySpan = ⊥`, `ν = 0`: coherent; `ν = id`: isometry, integral, agrees with `τ` | trivially coherent in both, as for Peterfalvi's definition | none (R08: unused) |
| Convention line 69: `R(S)₀ ⊆ CF(L,A)` must be proved per family | `S = Irr L`, `A = L\{1}` vs `A ⊊ L\{1}` | `1 − χ` for `χ(1) = 1` has degree 0 and is supported on `L \ ker χ`, not on a smaller `A` | the two domains differ for a general `A`; the README's warning is right | none |
| `sigmaPrimes G M` | `M = ⊤`; `M = ⊥`; `G = S₃`, `M = C₂`; `M = C₃` | all primes of `|G|`; `∅` (`p ∤ 1`); `N_G(C₂) = C₂ ≤ M` so `2 ∈ σ`, `3 ∤ 2`: `σ = {2}`; `N_G(C₃) = S₃ ⊄ C₃`: `σ = ∅` | agrees with B&G `sigma` (MC-BGsection10 line 67–68); Sylow-independence: `N_G(P^m) = N_G(P)^m ≤ M` | none (R08: unused) |
| narrow, `α`, `β`, `β ⊆ α` (F3a) | `C_p`; `C_p × C_p`; `(C_p)³`; extraspecial `p^{1+2}` of exponent `p` | rank 1, 2: narrow (rank ≤ 2); `(C_p)³`: every rank‑2 elementary abelian subgroup lies in the rank‑3 one, none maximal → not narrow → `p ∈ β`; extraspecial: rank 2 → narrow | matches MC-BGsection5 line 51 `('r_p(A) > 2) ==> ('E_p^2(A) ∩ 'E*_p(A) ≠ ∅)`; `p ∉ α ⇒` rank ≤ 2 `⇒` narrow `⇒ p ∉ β` | none |
| `τ₁, τ₂, τ₃, κ` (F3a) | definitions vs MC-BGsection12 lines 44–46, MC-BGsection14 lines 99–104 | `τ₁`: `σ'`, rank 1, `p ∤ |M'|`; `τ₂`: `σ'`, rank 2; `τ₃`: `σ'`, rank 1, `p ∣ |M'|`; `κ`: `τ₁ ∪ τ₃` with an order‑`p` subgroup centralising a nonidentity element of `M_σ` (rank 1 in odd order = cyclic Sylow) | exact; the "partition of the primes outside `σ(M)`" (line 260) needs `α(M) ⊆ σ(M)` (rank ≥ 3 ⇒ `σ`), which F3c supplies before F3c uses it | none |
| Thompson transitivity (F3b) | hypotheses vs B&G 7.6 (MC-BGsection7 lines 957–960) | `A ∈ SCN₃[p]` = abelian, normal in a Sylow `P`, `C_P(A) = A`, `m_p(A) ≥ 3`; `q ≠ p`; conclusion: `O_{p'}(C(A))` transitive on maximal `A`-invariant `q`-subgroups | exact, including the conjugating subgroup | none |
| Z-group `p`-length theorem (F1) | vs B&G 3.6 (MC-BGsection3 lines 593–596) | solvable, odd, `H ⋊ R`, coprime, `R₀ ≤ R` prime order, `Zgroup C_H(R₀)` ⇒ `[H,R]` has `p`-length 1 | exact | none |
| rank ≤ 2 ⇒ `p`-length ≤ 1 (F1) | vs B&G 4.18(c,e) (MC-BGsection4 lines 1144–1148) | solvable, odd, `r_p ≤ 2` ⇒ `O_{p'}(G')` Hall and `G/O_{p',p}` an abelian `p'`-group | exact | none |
| `p`-stability (F1) | vs B&G 6.1 (MC-BGsection6 lines 37–40) | odd, solvable ⇒ `p`-stable (and `p`-abelian-constrained) | exact | none |
| Hall cores, `M_σ ≤ M'`, `p`-length 1 of proper subgroups (F3c) | vs B&G 10.2, 10.6 (MC-BGsection10 lines 394, 404, 445, 466, 632) | `M_α` Hall `α`-subgroup, `M_σ` Hall `σ`-subgroup, `M_σ ≤ M'` (so no `σ`-prime divides `|M:M'|`), `M_σ ≠ 1`, every proper `H` has `p`-length 1 | exact | none |
| Frobenius-type data and types I–V (F3d) | field by field vs MC-BGsection16 lines 110–162 | type F: `H ≠ 1`, `U ≠ 1`, `H ⋊ U = M`, abelian normal `U₁ ⊇ C_U(x)`, `U₀ ≤ U` with `exp U₀ = exp U` and `H ⋊ U₀` Frobenius; type I (a)(b)(c); P-configuration (a)–(e) incl. `W₂ ≤ H ∩ M''`, `C_{M'}(x) = W₂`; II–IV: `U ≠ 1`, `|W₁|` prime, `F(M)^#` T.I.; II: `U` abelian, `N(U) ⊄ M`, `M'` of type F, `H(M') = H(M)`; III/IV: `N(U) ≤ M`, `U` abelian/nonabelian; V: `U = 1` and (a)/(b)/(c) with `|W₁| ∣ p−1`, `|O_p(H)| = p³`, `|W₁| ∣ p+1` | exact match on every clause | none |
| Theorem (8.8) alternative (F3d) | vs MC-PFsection8 lines 433–449 | all type I, or `S, T` with `W = W₁ × W₂` cyclic, `V` T.I. with normaliser `W`, `S' ⋊ W₁ = S`, `T' ⋊ W₂ = T`, `S ∩ T = W`, `FTtype S = 2 ∨ FTtype T = 2`, every non-type-I maximum conjugate to `S` or `T` | exact; `gcd(|W₁|,|W₂|) = 1` from cyclicity: `C₃ × C₃` not cyclic, `C₃ × C₅` cyclic | none |
| `C₇ ⋊ C₃` against Frobenius-type data (Checks, line 406) | `H(M) = C₇`, `E = C₃` | `C₇` is the unique normal Sylow; `E₁ = 1 ⊇ C_E(h) = 1`; `E₀ = E` acts fixed-point-freely | satisfies type-F data; `H(M)^#` is T.I. in `M` itself, so type I(a) relative to `M` | none |
| Type I is Frobenius (F4b); not all type I (F4c) | vs (12.7), (12.17) (MC-PFsection12 lines 1282–1283, 1306) | `M` maximal of type I ⇒ Frobenius with kernel `M_F = H(M)` | exact; strictly stronger than type-F data, as the README says | none |
| `S` of type II; `|P| = p^q` (F4d, F5) | vs (13.2) (MC-PFsection13 lines 198–203) | `q < p ⇒ FTtype S = 2`; `P` elementary abelian of order `p^q`; `u ≤ (p^q−1)/(p−1)` | exact for `S`; `T`'s type II is (14.9) | R05 |
| `|U|` dichotomy (F5 stage 2) | vs `card_FTtypeP_Galois_compl` (MC-PFsection13 line 1493) | `u = nU/q` if `p ≡ 1 (mod q)`, else `u = nU` | matches "either `q ∣ p−1` with `q|U| = nU`, or `|U| = nU`" | none |
| `gcd(nU, p−1) = 1 ⟺ q ∤ p−1` (F5) | `(p,q) = (5,3)`, `(7,3)`, `(3,2)` | `nU = 31`, `gcd(31,4) = 1`, `3 ∤ 4` ✓; `nU = 57 ≡ 3 (mod 6)`, `gcd = 3`, `3 ∣ 6` ✓; `nU = 4`, `gcd(4,2) = 2`, `2 ∣ 2` ✓ | B&G Remark I (MC-BGappC line 129–136): `nU ≡ q (mod p−1)` | none |
| `appendixC_prime_le` hypotheses vs Theorem C | (A), (B) at MC-BGappC lines 41–48 | (A): `p, q` prime, `coprime nU (p−1)`, `P ⋊ U`, `P ≅ (F,+)` with `P₀` the prime-field line, `U ↪ Fˣ` injective with conjugation = multiplication, `|P| = p^q`, `|U| = nU`; (B): `Q` abelian `p'`-group (math-comp assumes `q`-elementary abelian from (14.2) and derives exactly `abelian Q`, `p'-group Q`, lines 225–229, and uses nothing else of it: lines 642, 708), `P₀ ≤ N(Q)`, `∃ y ∈ Q, P₀^y ≤ N(U)` | the Lean states Theorem C at its own generality: `Ue` an isomorphism onto `rootsOfUnity nU F` = the unique subgroup of order `nU` of the cyclic `Fˣ` = the norm-one group; `hact` is `sigma (x ^ u) = sigma x · psi u` (line 81); `hQab`, `hQp`, `hQnorm`, `hUnorm` are (B) | none |
| `appendixC_prime_le`, degenerate primes | `(2,2)`, `(2,q)`, `(p,2)` odd `p`, `p = q` | `(2,2)`: `nU = 3`, coprime to 1, conclusion `2 ≤ 2` true; `(2,q)`: `2 ≤ q` true; `(p,2)`: `nU = p+1`, `gcd(p+1, p−1) = 2`, hypothesis false; `p = q`: `p ≤ p` true | no even or equal case can refute it; B&G Remark V derives `p, q` odd from `q < p` | none |
| `appendixC_prime_le`, `Q = ⊥` | `y = 1` | `hUnorm` becomes `P₀ ≤ N_G(U)`; for `r ∈ P ∩ N(U)`, `u ∈ U`: `r⁻¹ u r = u · (r^u)⁻¹ r` with `(r^u)⁻¹ r ∈ P ∩ U = 1`, so `r` is fixed by multiplication by every `w ∈ U`, `r(w − 1) = 0`, `r = 0` (`|U| = nU > 1`) | hypotheses contradictory, theorem vacuously true; `hPU` is needed for this | none |
| `appendixC_prime_le`, junk values | `p ^ q − 1`, `(p^q−1)/(p−1)` in `ℕ` | `p ≥ 2` so no truncation; `(p−1) ∣ (p^q − 1)` so division exact | no junk | none |
| F5 stage 1, the complement of `L` | vs (14.5) (MC-PFsection14 line 538) | `L = H ⋊ (W₁ ⟨W₂⟩^y)` for some `y ∈ Q`, order `pq` | exact | none |
| F5 stages 2–3 | vs (14.7), (14.16) (MC-PFsection14 lines 639, 1171) | `U` not characteristic in `H(L)`; `H(L) = U` | exact, in that order; the contradiction is between them | none |
| Dade = induction when every `H_a = 1` (F2, line 160) | `S₃` instance above; general `a ∈ A` | `Ind f(a) = (1/|L|)·|{g : gag⁻¹ ∈ A}|·f(a) = (|L·C_G(a)|/|L|) f(a) = f(a)` since `C_G(a) = C_L(a) ≤ L`; zero off the saturation | holds; equals MC-PF2 `Dade_Ind` under (2.3) `normedTI A G L ⟺ ∀ a, H a = 1` (line 174–175) | none |
| T.I. data convention (F3d, lines 284–287) | `IsTISet D N`, `D ≠ ∅` | `N ≤ N_G(D)` by `conj_mem`; `g ∉ N ⇒ gDg⁻¹ ∩ D = ∅ ≠ D ∩ D ⇒ g ∉ N_G(D)` | `N_G(D) = N` follows, as claimed; nonemptiness is used | none |

**Cross-roadmap citations resolved.** LocalFiniteGroupTheory L1, L3, L4, L5, L6, L7 and the `IsPStable p G` definition (L5): present at the head of pull request #1634. FiniteGroupExtensionSplitting S0–S3 and the Gaschütz theorem (§2.4): present at the head of #1774. CharacterTheory and InductionRestriction: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` and `…/InductionRestriction/README.md` on main (Clifford theory is InductionRestriction Layer 5, Mackey Layer 3, virtual characters Layer 6). GlaubermanZStar Z2 (#1778) consumes "OddOrderTheorem F2" by name and section.

## Not verifiable

- Peterfalvi, *Character Theory for the Odd Order Theorem* (CUP 2000) and Bender–Glauberman, *Local Analysis for the Odd Order Theorem* (CUP 1994): no legal copy (the publisher pages are paywalled; the pageplace preview linked at README line 421 is the front matter only). Every statement above was checked against the math-comp odd-order transcription, which names the theorem numbers; page numbers are not available to me.
- Feit–Thompson 1963: read from MSP's open archive, but the OCR of the Fraktur notation is unreliable beyond section headings and Definition 9.1; I did not use it for any hypothesis check.
- Ownership against open pull requests was checked only through `roadmaps grep` and the three pull requests the README names (#1634, #1774, #1778); the brief's sibling checkouts do not include those three, so I read them with `roadmaps show`.

## Source issues

- **Error** in Bender–Glauberman 1994 at Theorem 10.1(e), printed page unknown: the source states part (e) in a form that is incorrect as written; it should be omitted or restated (math-comp does not formalise it); affects nothing (the part is unused in the proof).
- **Gap** in Bender–Glauberman 1994 at Proposition 3.9, printed page unknown: the source omits the hypothesis that the acted-on group is nontrivial; it should assume `H ≠ 1`; affects a stated result.
