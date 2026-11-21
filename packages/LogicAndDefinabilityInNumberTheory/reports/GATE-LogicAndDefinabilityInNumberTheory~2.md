# GATE-LogicAndDefinabilityInNumberTheory~2: answers to human review

One comment, posted 2026-11-21T10:05:08Z, makes two points: H01 (AKE) and H02 (Macintyre's elimination). Both are questions about where this roadmap stops and a planned series on the model theory of local fields begins. The series exists only as a plan in a fork's issue tracker. It is not a roadmap on main, it is not an open roadmap pull request (`roadmaps grep` finds no folder for it) and it is not in the merge order. So nothing here can cite it, and while it stays a plan it supplies nothing to this roadmap.

## H01 (0stellensatz) — answered

The boundary works without any change here. §§1.1–1.5 stay as they are, and a later roadmap that cites §1.5 is a consumer, which keeps the supply running in one direction. For Artin's conjecture, the form to cite is §1.5(a) with O=ℤ and a coefficient-free θ. In Lean this is `ax_kochen_ring` (`TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean` line 44): for each ring sentence φ there is an N such that φ holds in `ℚ_[p]` iff it holds in `LaurentSeries (ZMod p)` for every prime p > N. For a fixed degree d, "every form of degree d in d²+1 variables has a nontrivial zero" is a single ring sentence, since it quantifies over the finitely many coefficients. The bound therefore depends on d. The series has to supply Lang's theorem that 𝔽_p((t)) is C₂ itself.

The one-sorted AKE does not duplicate §1.4. §1.4 is stated only for H_ac,0 structures, which carry an angular component as data (§1.2). Its own text (line 193) makes no claim for mixed-characteristic henselian fields. The residue-characteristic-zero case of the one-sorted theorem does follow from §1.4: pass to an ℵ₁-saturated elementary extension, which has an angular component, then take the reduct. §1.4 does not state that consequence, so the series can either cite §1.4 for that case or prove all cases from its embedding lemma. Either way nothing here changes.

## H02 (0stellensatz) — applied

The roadmap needed this statement: before the repair, §2.2 used Macintyre's theorem without stating it. The citation for the P-minimality of F (old line 282) gave as its reason "its definable sets being the semialgebraic ones", which is Macintyre's theorem. The cited sources treat elimination as a standing fact: Cluckers–Gordon–Halupczok (`integrability_of_oscillatory_functions_on_local_fields_transfer_p` line 489, p.11) and Cluckers–Comte–Loeser (`cluckers_comte_loeser_2012` lines 159–162, §1.1, p.4). No roadmap on main or in an open pull request states it (`roadmaps grep -i macintyre`, `'p-adically closed|P-minimal|Ershov|Prestel'`), and neither does the pinned Mathlib or Tau Ceti. The series plan cannot be cited, so §2.2 keeps the statement.

Changes, all in `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md`:
- **New paragraph (line 272).** For every finite extension F/ℚ_p, every formula of the Macintyre language with coefficients from F is equivalent in F to a quantifier-free one. Equivalently, every set definable in the ring language with parameters is a Boolean combination of the sets {f=0} and {f∈P_n}. The elimination holds in every structure elementarily equivalent to F. The route is Denef's: cell decomposition for quantifier-free sets, then projection onto the base (Pas, p.138: `pas_1989` line 96).
- **Citation clause (line 284).** Old: "its definable sets being the semialgebraic ones". New: P-minimality now follows "by the elimination theorem above".
- **Two new Checks (lines 295–296):**
  - The ring language alone does not eliminate quantifiers: the nonzero squares are infinite and coinfinite.
  - For a prime ℓ≠p, x∈O_F iff 1+πx^ℓ∈P_ℓ.
- **`*Needs:*` line (line 298).** Adds Mathlib `HenselianLocalRing`.
- **Scope (line 1854).** This roadmap owns Macintyre's elimination and cell decomposition over a fixed finite extension of ℚ_p, not over arbitrary p-adically closed fields.

When the series' p-adically-closed-fields roadmap opens, it comes later in the merge order than this one. It can state the general Prestel–Roquette theorem for p-adically closed fields of p-rank d, with its finitely many constants, as a variant that covers more fields. It would cite §2.2 for the fixed-F case.

## Adversarial pass on the added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Macintyre QE over F (line 272) | m=0 (sentences); p=2 with F=ℚ₂; ramified F=ℚ₂(√2); F=ℚ_p, p odd | m=0: each sentence with constants is true or false in F, so it is equivalent to 0=0 or 0≠0. p=2 and ramified: the statement is made with coefficients from F, which is the setting of CCL §1.1 p.4 for every finite K/ℚ_p. | holds | none |
| "Equivalently … semialgebraic" | both directions | QE⇒: every atomic Macintyre formula is f=0 or f∈P_n. ⇐: replace P_n(t) by ∃y(yⁿ=t∧t≠0) to get a ring formula; its set is a Boolean combination of atomic sets. | holds | none |
| Holds in every K'≡F | complete theory | F⊨∀x(φ↔ψ) is a sentence of Th(F), so it holds in every model | holds | none |
| Route: projection of a cell is its base | cells of line 272 / CGH Def. 3.3.1 | Cells project surjectively onto their base. Bases are quantifier-free definable by induction, so a union of cells projects onto a union of bases. | holds once the bases are quantifier-free definable, which the sentence now requires | added "with quantifier-free definable bases" |
| Check: ring-language QE fails | one variable over F | A quantifier-free ring set is finite or cofinite. The nonzero squares contain u² for every u≠0, so they are infinite. Their complement contains π·u², which has odd order 1+2·ord u, so it is infinite too. | true; it rules out the plausible wrong statement (QE in the ring language) | — |
| Check: x∈O_F ⟺ 1+πx^ℓ∈P_ℓ, ℓ≠p prime | ℚ₅ with ℓ=2: x=1 and x=1/5. ℚ₂ with ℓ=3: x=1 and x=1/2. | ℚ₅, x=1: 1+5=6≡1 mod 5, a square by Hensel. ℚ₅, x=1/5: ord(5·5⁻²)=−1, odd, not a square. ℚ₂, x=1: 1+2=3≡1 mod 2, and f′(y)=3y² is a unit, so 3 is a cube in ℚ₂. ℚ₂, x=1/2: ord(2·2⁻³)=−2, not divisible by 3, not a cube. General case: ord x=−k<0 gives order 1−ℓk≡1 mod ℓ. | true in both directions | — |
| P-minimality clause (line 284) | CDL Def. 2.1 (`cubides_darniere_leenknegt_2017` lines 123–125, p.3) | The definition requires semialgebraic definable subsets of every K'≡F, and the elimination gives exactly that | holds | wording now cites the elimination |

## Suggested.lean

Not changed. Macintyre's elimination is a supporting target, not a headline, and the Macintyre language does not exist at the pins. `signatures.md` stands (14 declarations, none lost a section binder). With no change, the `#check` comparison was not rerun.

## Ownership and sources

- **Ownership against open pull requests: checked.** I used `roadmaps grep` over the open heads and main for `macintyre`, `p-adically closed`, `P-minimal`, `Ershov`, `Ax[-–]Kochen`, `angular component` and `Prestel`. The only hits are this roadmap, LogicAndDefinabilityInNumberTheoryPartII (which cites only §§0.1–0.2 here, an unrelated use), and unrelated uses in other roadmaps: Prestel's model-theory textbook, the elliptic-fixed-point paper of another Prestel, and the ACVF lemma in ClassicalAdicEtaleCohomology. None states AKE or Macintyre's QE.
- **Sources.** Every locator added comes from texts the manifest already records: `cluckers_comte_loeser_2012` lines 143–162 (p.4), `integrability_of_oscillatory_functions_on_local_fields_transfer_p` line 489 (p.11) and `pas_1989` line 96 (p.138). No new source and no `needs-references.toml` entry.
- **Citations lead.** `citations.md` flagged `Diophantine.mrdp` (README line 979 at this head). It is declared at `Suggested.lean` line 70 as `TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.Diophantine.mrdp`, so the flag is a false lead.
- **No suspicious instructions** in the reviewed text.

## Build and gate

- `lake build TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.Suggested`: `Build completed successfully (18248 jobs).` The only warnings are 11 "declaration uses `sorry`".
- Gate, after commit `f1d1e63c`: `gate LogicAndDefinabilityInNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 11 roadmaps, 123 edges, 0 problem(s)`. No UPWARD or CYCLE line.
