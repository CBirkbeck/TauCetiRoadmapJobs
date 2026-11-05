# FIX-RT-StableHomotopyKTheoryPartII~2

This round repairs red-team round 2: pass a (six findings) and pass b (one finding). Pass b's only finding is the same defect as pass a F04, so both are settled in one section. Each finding was checked against the cached legal sources, the cited supplier roadmaps (on main, or at the open head shown by `roadmaps show`), and the pins. All seven are right, and all are applied.

Files edited:
- `packages/StableHomotopyKTheoryPartII/README.md`
- `packages/StableHomotopyKTheoryPartII/sources.toml`: two locator strings, no new key.

Unchanged: `Suggested.lean` (no declarations), `metadata.toml` and `design/plan.json` (no new gap).

## RT-StableHomotopyKTheoryPartII~2a/F01 (P1) — applied

Change in the §4.2 Check: "the space-level power on π₀ sends 2 to 4, while additivity would give 2" → "the lift sends 2 to 2u+Nm(1). Restriction to π₀(Hℤ⊗Hℤ)=ℤ gives 4; can gives 2∈π₀T₂(Hℤ)=ℤ₂. The value is neither 2u nor 4u."

Evidence:
- **Sum formula.** The space-level sum formula (bmms86, VIII.1, Proposition 1.1(vi); ns18 lines 4920–4952) gives (1+1)^⊗2 = 1⊗1 + 1⊗1 + Nm(1⊗1).
- **Restriction.** u restricts to 1 and Nm(1) restricts to 1+τ(1)=2, so the total is 4.
- **can.** can(u)=Δ₂(1)=1 and can∘Nm=0, so can(2u+Nm(1))=2. This is ℤ₂-additive, as Δ₂ must be.
- **Why the old Check was false.** Read in π₀((Hℤ⊗Hℤ)^(hC₂)), the old value "4" means 4u. But can(4u)=4≠2, which contradicts the §4.2 theorem itself.
- **Same pattern elsewhere.** These are all correct and unchanged:
  - §4.4 Check P₂(2)=4: it is taken in H⁰(BΣ₂;ℤ)=ℤ, where the transfer of 1 is 2.
  - §4.6 Check (4 mod 2=0).
  - §5.6 Check.
  - §4.3 Check (2u=Nm(1)≠0 in ℤ/4 for H𝔽₂).

## RT-StableHomotopyKTheoryPartII~2a/F02 (P1) — applied

Change: new target §1.2, "The homological Tate spectral sequence of a Greenlees tower". It covers finite G and bounded-below, finite-type X, and has four parts: H^c_*(X^(tG))≅π_*((H𝔽_p⊗X)^(tG)); strong convergence from Ĥ^(−s)(G;H_tX); duality with continuous cohomology; and multiplicativity, with the unit represented by 1⊗1. It has three Checks. The §2.6 unit step now cites §1.2 instead of KTheoryFiniteLocalFields §4.5.

Evidence:
- **The supplier gives homotopy only.** KTheoryFiniteLocalFields §4.5 (third paragraph, at its open head) supplies `tateSpectralSequence` with E²=Ĥ^(−s)(G,π_tT), converging only conditionally to π_(s+t)T^(tG).
- **The proof needs homology.** The lnr12 argument that §2.6 follows (lnr12 line 2059) uses the homological sequence ⇒ H^c_* (lnr12 lines 1488, 1608).
- **The bridge.** The step from one to the other is lnr12 Proposition 4.16 (line 1550): Greenlees stages commute with H𝔽_p⊗−, and lim¹ vanishes by finite type. Then Boardman's criterion gives strong convergence (lnr12 line 1495). Neither step was supplied before.
- **Ownership.**
  - `roadmaps grep` for "homological Tate spectral" and "continuous homology" finds no match on main or at any open head.
  - "Greenlees" occurs only in KTheoryFiniteLocalFields §4.5 (homotopy version) and in chromatic citations.
  - Board packages: the only "continuous homology" matches are Galois-theoretic.
  - This roadmap already owns continuous cohomology of towers (§2.1), so it owns §1.2. No supplier gap is needed.
- **Placement and generality.**
  - §1.2 is a new number in Layer 1, next to the Tate coefficients of §1.1. This avoids renumbering §§2.6–2.7, which are cited throughout.
  - It is stated at lnr12's generality: finite G, not only C_p.
  - The C_p, B^(⊗p) comparison with the Singer identification stays in the §2.6 route.
- **Edits that follow from it.**
  - §2.6 *Needs*: §1.2 replaces KTheoryFiniteLocalFields §4.5.
  - Layer 1 and Layer 2 Dependencies.
  - The KTheoryFiniteLocalFields contract: it now names the homotopy Tate spectral sequence and its conditional convergence.
  - Scope, "How to read the build", and the Layer 1 title and introduction.
  - The lnr12 locator in References and in `sources.toml`: Corollary 4.11, p.890; Definition 4.12, Remark 4.13 and Propositions 4.14–4.16, pp.891–894; Proposition 4.17, p.895. Page markers were checked in the extraction: line 1425 is p.891, line 1591 is p.895.
- **Same pattern elsewhere.**
  - §3.2's "bounded Tate spectral sequence" really is the homotopy sequence (finitely many rows after truncation), so its citation is correct. But it was missing from §3.2's *Needs* and from the Layer 3 Dependencies; I added it to both.
  - No other homological use of the supplier's sequence was found.

## RT-StableHomotopyKTheoryPartII~2a/F03 (P3) — applied

Change:
- §4.4: the Check "P_p(0)=0 and P_p(1)=1" is replaced by a KU Check: P₂(2)=3·1+sign, against the pullback 4·1. The characters are 2 and 4.
- §5.3: the Checks "P_p^n(0)=0" and "P_p^0(1)=1 and agrees with P_p" are replaced by three Checks: H𝔽₂, n=1 (ub+u²); KU, n=−2 (β²); and KU, n=0 (3·1+sign).
- The two twist controls in §5.3 are kept.

Evidence:
- **The wrong model passes the old Checks.** pr*(x^p) passes every old §4.4 Check. For HA coefficients, R⁰(X×BΣ_p)=H⁰(X;A) when X is connected, so the two operations agree there; the README now says so.
- **KU separates them.**
  - Using the §4.4 sum-formula API with the KU transfer tr(1)=[ℂΣ₂]=1+sign gives 3+sign.
  - In KU⁰(BΣ₂)=R(Σ₂)^∧_I we have I^n=2^(n−1)I, so the completion is ℤ⊕ℤ₂(sign−1), and sign−1≠0.
- **New §5.3 values.**
  - n=1: P(u)=Sq⁰u·b+Sq¹u=ub+u² in H²(ℝP∞×BΣ₂) = span{u², ub, b²}. This agrees with the Euler class u(u+b) in the §6.2 Check.
  - n=−2: the API sends P(β) to β^p=β²∈R^(np)(pt)=π₄KU, a unit.
  - An operation that is zero in nonzero degrees fails both.

## RT-StableHomotopyKTheoryPartII~2a/F04, RT-StableHomotopyKTheoryPartII~2b/F01 (P3) — applied

Change, in §2.7 *Needs*, §3.4 *Needs* and the Layer 2 and Layer 3 Dependencies:
- "§7.15 (mod-p detection …)" → "§7.16 (mod-p detection …)".
- "§7.16 (closure …)" → "§7.15 (closure …)".

Evidence: at StableHomotopyKTheory's open head (`roadmaps show`), §7.15 is "Closure properties of complete spectra" and §7.16 is "Mod-p equivalence detects equivalences of complete spectra". The range citation §§7.14–7.16 in Conventions is unchanged.

## RT-StableHomotopyKTheoryPartII~2a/F05 (P3) — applied

Change in §7.5 *Needs* and the Layer 7 Dependencies:
- Old: "§F6.4 (smashing and the E(1)/KU Bousfield comparison)".
- New: "§F6.4 (smashing) and §F3 (ku_(2)≃BP⟨1⟩ and E(1) as the v₁-localization of BP⟨1⟩, giving E(1)≃KU_(2))".

The §7.5 route now derives the Bousfield class from §F3. The supplier contract now lists §F6.4 and §F3.

Evidence:
- On main, BordismFormalGroups F3 (its README lines 293–299) builds E(n) by inverting v_n on BP⟨n⟩ and includes ku_(2)≃BP⟨1⟩.
- F6.4 (lines 1248–1525) contains no KU. Its smashing theorem is at line 1276.
- Both v₁ and β generate π₂ of the same 2-local theory, so inverting either gives the same spectrum.
- Same pattern: the BordismFormalGroups supplier contract cited neither §F6.4 nor §F3, although §7.5 uses both. Both are added.

## RT-StableHomotopyKTheoryPartII~2a/F06 (P3) — applied

Change:
- §7.3 statement and route: "Remark IV.1.13 and Example IV.1.14" → "Remarks IV.1.13–IV.1.14".
- References, and the ns18 locator in `sources.toml` (same key): "IV.3 Propositions IV.3.1–IV.3.2 … pp.347–355" → "IV.3 Lemma IV.3.1, Proposition IV.3.2, Corollary IV.3.3 and Theorem IV.3.7 with proof, pp.345–355".

Evidence:
- ns18 line 5067 is "Remark IV.1.14", on printed p.331 (page header at line 5056).
- ns18 line 5615 is "Lemma IV.3.1", on printed p.345 (header at line 5593).
- The §8.3 locator (Proposition IV.3.2 on p.347, Corollary IV.3.3 on p.351) was already right.
- Same pattern: I compared every ns18 label the README cites (32 label/kind pairs) with the source. All the others match.

## Checks

**Elaboration.** `lake env lean packages/StableHomotopyKTheoryPartII/Suggested.lean`, run from the content checkout: exit 0, no output, both before and after the header repair below. Apart from that header, the file is unchanged and declares nothing. The `#check @name` signature comparison therefore has no declarations to compare; none of the repairs adds a statable headline. The new §1.2 is supporting machinery, and its carriers (spectra with G-action, Tate, mod-p homology of spectra) are absent at the pins, as the docstring already records for this layer's headlines.

**Dependency check.** Run as the brief prescribes:

```text
depcheck: 188 roadmaps, 1231 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. The only new supplier edges are to KTheoryFiniteLocalFields §4.5, RefinedTraceMethods §§2.11–2.13, StableHomotopyKTheory §§7.9 and 7.26, and BordismFormalGroups §§F3 and F6.4. All of them are earlier in the order or on main.

**Worker check failure (module-system warning).** The worker's build warned that `Suggested.lean` imports Mathlib without the module system. The header changed from `import Mathlib` to `module` followed by `public import Mathlib`. This is the form used by TypeAHeckeAlgebras on main and by the open RootSystemsPartII and AlgebraicTopologyPartII roadmaps. The file declares nothing, so it needs no `public section`. The gate's header scanners (imports, `import Mathlib` present, no `Mathlib.*` submodules, no `set_option`, no residue, no sorry'd data) report no hit. The re-run dependency check is unchanged: `depcheck: 188 roadmaps, 1231 edges, 0 problem(s)`. Nothing else changed.

**Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.

**Ownership.** Checked by object against main, the board packages and the open heads, through `roadmaps grep` and the sibling checkouts in the brief. §1.2 has no other owner; see F02.

## Adversarial pass on changed and new statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §4.2 Check (Hℤ lift of 2) | p=2; p=3; X=0 | p=2: 2u+Nm(1); restriction 2+2=4, can 2+0=2∈ℤ₂; candidate 2u has restriction 2, candidate 4u has can 4. p=3: 2u+2Nm(1) (two free orbits of mixed words); restriction 2+6=8=2³, can 2∈ℤ₃. X=0: 0 | consistent with Δ additive and the §4.2 equality |
| §4.4 KU Check | KU, pt, p=2; HA, pt; 0 and 1 | 3+sign, character 2; pr*(4) has character 4; sign−1≠0 in ℤ⊕ℤ₂(sign−1). HA: tr(1)=2, so P(2)=4=pr*(4). 0↦0 (tr(0)=0), 1↦1 | KU separates P from pr*(x^p); for HA at a point the two agree |
| §5.3 Check, H𝔽₂, n=1 | u∈H¹(ℝP∞) | ub+u²; both monomials in a basis of H²(ℝP∞×BΣ₂) = span{u², ub, b²}. Dividing by b gives u+u²s, as in §6.2 | discriminates zero and pullback models |
| §5.3 Check, KU, n=−2 | β | restriction β²∈π₄KU, a generator. The zero operation gives 0 | discriminates |
| §5.3 Check, KU, n=0 | 2 | 3+sign, equal to §4.4 by the API P^0=P | consistent |
| §1.2, comparison and E² | X=S, G=C₂, p=2; G=C₃, p=2; G=e; X=Hℤ, C₃, p=2; X=0 | S: 𝔽₂ in every (s,0), collapse (d_r changes t by r−1≥1), H^c_n=𝔽₂ for all n, while H_*(S₂^∧;𝔽₂) is 𝔽₂ only in degree 0. C₃ at p=2: Ĥ=0, so E²=0; group homology would give H₀(C₃;𝔽₂)=𝔽₂. e: 0. Hℤ with C₃ at p=2: E²=0, matching the 3-torsion Tate groups. X=0: 0 | true; excludes the "homology of the limit" and "group homology" models |
| §1.2, finiteness | X=H𝔽_p, trivial C_p | E²_(s,t)=Ĥ^(−s)⊗A_t is finite in each bidegree; total degree n is infinite (all t≥0). The statement claims finiteness only per bidegree, and the continuous dual handles infinite H^c_n | statement correctly scoped |
| §1.2, products and unit | C₂, 𝔽₂; C₃, 𝔽₃; X=H𝔽_p^(⊗p) | Laurent generator times inverse is 1 at p=2. At p=3, t·t⁻¹=1 and e·(t⁻¹e)=0 since e²=0. Unit 1⊗1^(⊗p) in Ĥ⁰(C_p;𝔽_p)=𝔽_p/p𝔽_p=𝔽_p, nonzero. Unit filtration: S→ẼG is the 0-skeleton, so filtration 0 | true |
| §1.2, duality | stage V_s finite-dimensional | colim_s Hom(V_s,𝔽_p) = continuous dual of lim V_s; this is Remark 4.13 at page level | true |
| §2.6 route (unit step) | B=H𝔽_p, p=2,3 | unit ↦ class 1⊗1^(⊗p); its dual is Σx⁻¹⊗1 or Σxy⁻¹⊗1, which ε sends to 1, so g(1)=1. The wrong map −Δ at p=3 gives g(1)=2 | inputs now all supplied (§1.2, §2.4, §2.5) |
| §7.5 route (Bousfield class) | p=2 | π₂ku_(2)=ℤ_(2)β and π₂BP⟨1⟩=ℤ_(2)v₁; an equivalence matches the generators up to a 2-local unit, so v₁⁻¹BP⟨1⟩≃β⁻¹ku_(2)=KU_(2) | true from F3 |
| §2.7 / §3.4 supplier locators | Hℤ in §3.4 | mod-p detection reduces to H(M/pM) (§7.16). The limit of complete stages is complete (§7.15, countable tower limits). Hℚ has zero mod-p reduction and is not complete (the §7.16 Check) | locators now match |

## For the maintainer

- `design/plan.json` (outside the editable `gaps` list) still has the locator "Remark IV.1.13 and Example IV.1.14" in the ns18 citation of the KU Frobenius target. The label there should read "Remarks IV.1.13–IV.1.14", as in the README and `sources.toml`.
- New README section §1.2. The Layer 1 title is now "Cyclic coefficients, permutation conventions and homological Tate spectral sequences". No existing section number changed, and no Lean name changed. Roadmaps citing this one by section are unaffected.
- No new supplier gap. No source was missing, and nothing was fetched. Every locator added reuses the existing key `lnr12`.
- No suspicious instructions were found in the reviews or the sources read.
